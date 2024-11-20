import 'package:flutter/material.dart';
import 'components/body.dart'; // Nhập khẩu widget Body, nơi chứa nội dung chính của màn hình

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key}); // Khởi tạo ProfileScreen với key

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Scaffold là một widget cơ bản để tạo cấu trúc giao diện cho màn hình
      body:
          Body(), // Thêm widget Body vào thân của Scaffold. Body chứa các thành phần giao diện chính
    );
  }
}
