import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:flutter/material.dart'; // Import Flutter framework
import 'package:foodly_ui/CartModel.dart'; // Import lớp CartModel để quản lý giỏ hàng
import 'package:foodly_ui/constants.dart'; // Import file constants để dùng hằng số
import 'package:foodly_ui/screens/onboarding/onboarding_scrreen.dart'; // Import màn hình giới thiệu ứng dụng
import 'package:provider/provider.dart'; // Import Provider để quản lý trạng thái

// import 'firebase_options.dart'; // Tùy chọn, nếu cấu hình Firebase riêng thì bật dòng này

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Đảm bảo các Widgets được khởi tạo đúng thứ tự
// String realTimeValue = '0'; // Giá trị mẫu cho real-time data
// String getOnceValue = '0'; // Giá trị mẫu cho one-time fetch data

  // Khởi tạo Firebase cho ứng dụng
  await Firebase.initializeApp();

  // Chạy ứng dụng
  runApp(const MyApp());
}

// Lớp chính của ứng dụng
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor với key để hỗ trợ widget tree

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Cung cấp ChangeNotifierProvider
      create: (context) =>
          CartModel(), // Đăng ký lớp CartModel để quản lý giỏ hàng

      child: MaterialApp(
        title: 'Gà rán', // Tiêu đề ứng dụng

        // Thiết lập giao diện chung (theme) cho ứng dụng
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor), // Thiết lập màu chính từ seedColor

          elevatedButtonTheme: ElevatedButtonThemeData(
            // Tùy chỉnh giao diện ElevatedButton
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, // Màu nền
              foregroundColor: Colors.white, // Màu chữ
              minimumSize:
                  const Size(double.infinity, 40), // Kích thước tối thiểu
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc nút bấm
              ),
            ),
          ),

          // Thiết lập kiểu chữ mặc định
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: bodyTextColor), // Màu chữ trung bình
            bodySmall: TextStyle(color: bodyTextColor), // Màu chữ nhỏ
          ),

          // Thiết lập giao diện mặc định cho các ô nhập liệu
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(defaultPadding), // Padding bên trong
            hintStyle: TextStyle(color: bodyTextColor), // Kiểu chữ cho gợi ý
          ),
        ),

        // Đặt màn hình khởi đầu là màn hình giới thiệu
        home: const OnboardingScreen(),
      ),
    );
  }
}
