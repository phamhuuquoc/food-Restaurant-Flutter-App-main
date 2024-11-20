import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.iconData,
    required this.press,
  });

  final IconData iconData; // Biến lưu trữ dữ liệu icon cần hiển thị
  final VoidCallback press; // Biến lưu trữ hành động khi nút được nhấn

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56, // Chiều cao của nút
      width: 56, // Chiều rộng của nút
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding:
              EdgeInsets.zero, // Không có padding mặc định cho ElevatedButton
          backgroundColor: const Color(0xFFF8F8F8), // Màu nền của nút
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(
                100)), // Đặt bán kính bo góc lớn để tạo hình tròn
            side: BorderSide(
              color: const Color(0xFF979797)
                  .withOpacity(0.1), // Màu viền của nút với độ mờ 10%
            ),
          ),
        ),
        onPressed: press, // Gán hành động khi nút được nhấn
        child: Icon(iconData), // Hiển thị biểu tượng icon được truyền vào
      ),
    );
  }
}
