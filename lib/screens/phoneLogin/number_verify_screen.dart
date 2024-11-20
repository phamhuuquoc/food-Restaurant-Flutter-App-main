import 'package:flutter/gestures.dart'; // Thư viện để sử dụng TapGestureRecognizer (cho việc nhận dạng cú chạm)
import 'package:flutter/material.dart'; // Thư viện Flutter cơ bản
import '../../components/welcome_text.dart'; // Nhập WelcomeText tùy chỉnh từ thư mục components
import '../../constants.dart'; // Nhập các hằng số từ file constants.dart
import 'components/otp_form.dart'; // Nhập OtpForm từ thư mục con của màn hình xác minh

class NumberVerifyScreen extends StatelessWidget {
  // Màn hình xác minh số điện thoại (OTP)
  const NumberVerifyScreen({super.key}); // Khởi tạo NumberVerifyScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold tạo ra cấu trúc cơ bản cho màn hình
      appBar: AppBar(
        // Thanh tiêu đề của màn hình
        title: const Text("Đăng nhập vào Gà rán"), // Tiêu đề của màn hình
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView cho phép cuộn màn hình nếu nội dung quá dài
        child: Padding(
          // Padding tạo khoảng cách từ các cạnh của màn hình
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding), // Padding ngang với giá trị mặc định
          child: Column(
            // Column chứa các widget theo chiều dọc
            crossAxisAlignment: CrossAxisAlignment
                .start, // Canh lề trái cho các widget trong Column
            children: [
              const WelcomeText(
                // Widget hiển thị văn bản chào mừng
                title:
                    "Xác minh số điện thoại", // Tiêu đề cho màn hình xác minh
                text:
                    "Nhập mã 4 chữ số được gửi đến bạn tại \n+1501333982", // Mô tả yêu cầu nhập mã OTP
              ),

              // Form nhập mã OTP
              const OtpForm(), // Đây là widget tùy chỉnh, có thể chứa các trường nhập liệu cho mã OTP
              const SizedBox(
                  height: defaultPadding), // Khoảng cách giữa các widget

              // Widget cho liên kết gửi lại mã OTP
              Center(
                child: Text.rich(
                  TextSpan(
                    text:
                        "Không nhận được mã?", // Văn bản hỏi người dùng có nhận được mã không
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500), // Thiết lập kiểu văn bản
                    children: <TextSpan>[
                      // Thêm phần tử con cho TextSpan
                      TextSpan(
                        text: "Gửi lại lần nữa.", // Văn bản "Gửi lại lần nữa"
                        style: const TextStyle(
                            color: primaryColor), // Màu sắc cho văn bản này
                        recognizer:
                            TapGestureRecognizer() // Cảm giác tap để người dùng nhấn vào
                              ..onTap = () {
                                // Code gửi lại mã OTP sẽ được thực thi ở đây
                              },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                  height:
                      defaultPadding), // Khoảng cách dưới liên kết "Gửi lại lần nữa."

              // Thông báo về điều khoản và chính sách bảo mật
              const Center(
                child: Text(
                  "Bằng cách Đăng ký, bạn đồng ý với Điều khoản \n Điều kiện & Chính sách Bảo mật của chúng tôi.",
                  textAlign: TextAlign.center, // Căn giữa văn bản
                ),
              ),
              const SizedBox(
                  height:
                      defaultPadding), // Khoảng cách cuối cùng dưới thông báo về điều khoản
            ],
          ),
        ),
      ),
    );
  }
}
