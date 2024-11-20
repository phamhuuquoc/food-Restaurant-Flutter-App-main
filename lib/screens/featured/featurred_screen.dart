import 'package:flutter/material.dart'; // Thư viện Flutter để xây dựng giao diện người dùng
import 'components/body.dart'; // Import widget Body từ thư mục components (hiển thị danh sách nội dung chính)

// Màn hình FeaturedScreen hiển thị các đối tác nổi bật
class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({super.key}); // Khởi tạo đối tượng FeaturedScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar hiển thị tiêu đề của màn hình
      appBar: AppBar(
        title: const Text("Đối tác nổi bật"), // Tiêu đề của màn hình
      ),
      // Phần thân của màn hình chứa widget Body
      body: const Body(),
    );
  }
}
