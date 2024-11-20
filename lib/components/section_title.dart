import 'package:flutter/material.dart';

import '../constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    this.isMainSection =
        true, // Dùng để xác định là phần chính của ứng dụng hay không
    required this.title, // Tiêu đề phần
    required this.press, // Hành động khi nhấn vào nút (See all / Clear all)
  });

  final bool
      isMainSection; // Biến để xác định xem đây có phải là phần chính không
  final String title; // Tiêu đề phần
  final VoidCallback press; // Callback khi nhấn nút

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding), // Padding xung quanh phần này
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử trong hàng
        children: [
          // Tiêu đề phần
          Text(
            isMainSection
                ? title
                : title
                    .toUpperCase(), // Nếu là phần chính, hiển thị tiêu đề bình thường, ngược lại in hoa
            style: isMainSection
                ? Theme.of(context)
                    .textTheme
                    .titleLarge // Kiểu chữ cho phần chính
                : Theme.of(context)
                    .textTheme
                    .titleMedium, // Kiểu chữ cho phần không phải chính
          ),

          // Nút "See all" hoặc "Clear all"
          GestureDetector(
            onTap: press, // Gọi hàm press khi người dùng nhấn
            child: Text(
              isMainSection
                  ? "See all"
                  : "Clear all"
                      .toUpperCase(), // Nút thay đổi tùy theo phần chính hay không
              style: isMainSection
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: primaryColor) // Kiểu chữ cho phần chính
                  : TextStyle(
                      // Kiểu chữ cho phần không phải chính
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: titleColor.withOpacity(0.64),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
