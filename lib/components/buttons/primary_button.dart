import 'dart:io';
// Thư viện dart:io được sử dụng để kiểm tra thông tin nền tảng (như iOS hoặc Android).

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Các thư viện của Flutter cung cấp các widget giao diện người dùng theo phong cách Material Design (Android) và Cupertino (iOS).

import '../../constants.dart';
// constants.dart là nơi định nghĩa các hằng số như primaryColor, defaultPadding, và kButtonTextStyle để tái sử dụng dễ dàng.

class PrimaryButton extends StatelessWidget {
  // Widget PrimaryButton được kế thừa từ StatelessWidget, nghĩa là nó không có trạng thái (immutable).
  // Đây là một nút bấm với giao diện tùy chỉnh, tự động thay đổi theo nền tảng (iOS hoặc Android).

  final String text; // Văn bản hiển thị trên nút.
  final GestureTapCallback press; // Hàm callback được gọi khi nút được bấm.

  const PrimaryButton({super.key, required this.text, required this.press});
  // Hàm khởi tạo với các tham số bắt buộc: `text` và `press`.

  @override
  Widget build(BuildContext context) {
    // Phương thức build trả về giao diện của widget.
    EdgeInsets verticalPadding =
        const EdgeInsets.symmetric(vertical: defaultPadding);
    // verticalPadding: Cung cấp khoảng cách trên và dưới nội dung của nút, sử dụng giá trị defaultPadding.

    return SizedBox(
      width: double.infinity,
      // SizedBox với `width: double.infinity` đảm bảo nút chiếm toàn bộ chiều ngang của bố cục.

      child: Platform.isIOS
          // Kiểm tra nếu ứng dụng đang chạy trên iOS bằng `Platform.isIOS` từ thư viện dart:io.
          ? CupertinoButton(
              padding:
                  verticalPadding, // Khoảng cách trên và dưới của nội dung.
              color:
                  primaryColor, // Màu nền của nút lấy từ hằng số primaryColor.
              onPressed: press, // Hàm callback được gọi khi nút được bấm.
              child: buildText(context), // Văn bản hiển thị trên nút.
            )
          : ElevatedButton(
              // Nếu không phải iOS (Android hoặc nền tảng khác), sử dụng ElevatedButton.
              style: TextButton.styleFrom(
                padding:
                    verticalPadding, // Khoảng cách trên và dưới của nội dung.
                backgroundColor: primaryColor, // Màu nền của nút.
              ),
              onPressed: press, // Hàm callback được gọi khi nút được bấm.
              child: buildText(context), // Văn bản hiển thị trên nút.
            ),
    );
  }

  Text buildText(BuildContext context) {
    // Hàm tiện ích để tạo widget Text cho văn bản trên nút.
    return Text(
      text.toUpperCase(), // Chuyển văn bản thành chữ in hoa.
      style:
          kButtonTextStyle, // Sử dụng kiểu chữ được định nghĩa trong constants.dart.
    );
  }
}
