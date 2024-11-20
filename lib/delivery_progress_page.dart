import 'package:flutter/material.dart';
import 'package:foodly_ui/my_receipt.dart'; // Import widget MyReceipt

// StatelessWidget để hiển thị trang tiến trình giao hàng
class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage(
      {super.key}); // Thêm tham số key và gọi constructor của lớp cha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold cung cấp cấu trúc cơ bản của một trang (app bar, body, etc.)
      appBar: AppBar(
        title: const Text("Đang giao hàng"), // Tiêu đề trên app bar
        backgroundColor: Colors.transparent, // Màu nền app bar trong suốt
      ),
      body: const Column(
        // Dùng Column để xếp các widget theo chiều dọc
        children: [
          MyReceipt(
            // Truyền tham số cho widget MyReceipt
            orderedItems: [], // Danh sách các món đã đặt (ở đây là một danh sách trống)
            totalPrice: 0, // Tổng giá tiền (ở đây là 0)
          ),
        ],
      ),
    );
  }
}
