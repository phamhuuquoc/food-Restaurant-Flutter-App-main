import 'package:firebase_auth/firebase_auth.dart'; // Thư viện Firebase Auth để xử lý xác thực người dùng
import 'package:flutter/material.dart'; // Thư viện Flutter cơ bản để xây dựng giao diện
import 'package:flutter_svg/flutter_svg.dart'; // Thư viện hỗ trợ hiển thị hình ảnh SVG
import 'package:foodly_ui/entry_point.dart'; // Màn hình vào chính của ứng dụng (EntryPoint)
//import 'package:foodly_ui/screens/home/home_screen.dart'; // Màn hình trang chủ của ứng dụng
import '../../components/buttons/socal_button.dart'; // Nút đăng nhập xã hội (Google)
import '../../components/welcome_text.dart'; // Văn bản chào mừng người dùng
import '../../constants.dart'; // Các hằng số chung như padding, màu sắc, v.v.
import 'package:google_sign_in/google_sign_in.dart'; // Thư viện xử lý đăng nhập Google

// Màn hình Đăng nhập
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

// Hàm xử lý đăng nhập với Google
Future<UserCredential> signInWithGoogle() async {
  // Bắt đầu quá trình đăng nhập với Google
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Lấy thông tin xác thực từ Google (token và id)
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Tạo thông tin xác thực để sử dụng với Firebase
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Đăng nhập Firebase với thông tin xác thực từ Google
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class _SignInScreenState extends State<SignInScreen> {
  // Lắng nghe sự thay đổi trạng thái đăng nhập của người dùng
  _SignInScreenState() {
    // Lắng nghe sự thay đổi trạng thái đăng nhập, nếu người dùng đã đăng nhập thì chuyển hướng
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // Khi người dùng đã đăng nhập thành công, chuyển hướng đến EntryPoint (màn hình chính của ứng dụng)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const EntryPoint()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Đặt màu nền cho màn hình đăng nhập (màu trắng)
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
        // Đặt AppBar trong suốt
        backgroundColor: Colors.transparent,
        elevation: 0, // Không có đổ bóng
        leading: const SizedBox(), // Không có biểu tượng ở góc trái
        title: const Text(
          "Đăng nhập", // Tiêu đề AppBar
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0)), // Màu đen cho tiêu đề
        ),
      ),

      body: SingleChildScrollView(
        // Scrollview cho phép cuộn màn hình khi có nội dung dài
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal:
                  defaultPadding), // Đặt padding mặc định cho lề trái và phải
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Căn lề các phần tử bên trái
            children: [
              const SizedBox(height: 100), // Khoảng cách từ trên xuống

              // Hiển thị văn bản chào mừng người dùng
              const WelcomeText(
                title:
                    "Chào mừng đến với ứng dụng mua Gà rán", // Tiêu đề chào mừng
                text:
                    "Nhấp để đăng nhập bằng Google của bạn", // Hướng dẫn đăng nhập
              ),

              const SizedBox(
                  height: defaultPadding), // Khoảng cách giữa các phần tử

              // Nút đăng nhập với Google
              SocalButton(
                press: () async {
                  // Gọi hàm đăng nhập với Google khi người dùng nhấn nút
                  await signInWithGoogle();
                },
                text: "Kết nối với Google", // Văn bản hiển thị trên nút
                color: const Color(
                    0xFF4285F4), // Màu sắc của nút (theo màu của Google)
                icon: SvgPicture.asset(
                  'assets/icons/google.svg', // Biểu tượng Google
                  height: 25, // Chiều cao biểu tượng
                ),
              ),
              const SizedBox(
                  height: defaultPadding), // Khoảng cách giữa các phần tử
            ],
          ),
        ),
      ),
    );
  }
}
