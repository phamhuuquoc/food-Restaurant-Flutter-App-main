import 'package:flutter/material.dart'; // Nhập thư viện Flutter cơ bản

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  // Màn hình lịch sử đơn hàng, kế thừa StatelessWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold cung cấp cấu trúc cơ bản cho màn hình
      appBar: AppBar(
        // AppBar là phần thanh tiêu đề của màn hình
        title: const Text(
            "Lịch sử đơn hàng"), // Tiêu đề hiển thị trên thanh AppBar
      ),
      body: const Center(
        // Center dùng để căn giữa nội dung trên màn hình
        child: Text(
            "Tất cả đơn hàng đã mua của bạn sẽ nằm ở đây"), // Văn bản đơn giản hiển thị thông báo "Lịch sử đơn hàng"
      ),
    );
  }
}
