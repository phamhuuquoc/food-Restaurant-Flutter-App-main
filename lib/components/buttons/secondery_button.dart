import 'package:flutter/material.dart';
// Thư viện Material Design của Flutter cung cấp các widget và thành phần giao diện người dùng tiêu chuẩn.

import '../../constants.dart';
// Tệp constants.dart chứa các hằng số tái sử dụng trong ứng dụng, như màu sắc và kích thước khoảng cách.

class SeconderyButton extends StatelessWidget {
  // Widget này là một nút bấm thứ cấp (secondary button) với viền xung quanh, kế thừa từ StatelessWidget.

  const SeconderyButton({
    super.key,
    required this.child, // Widget con sẽ được hiển thị bên trong nút.
    required this.press, // Hàm callback được gọi khi nút được bấm.
  });

  final Widget
      child; // Widget con, ví dụ như Text hoặc Icon, hiển thị bên trong nút.
  final VoidCallback press; // Hàm callback sẽ được gọi khi nút được nhấn.

  @override
  Widget build(BuildContext context) {
    // Phương thức build trả về một widget giao diện của nút.
    return SizedBox(
      width: double.infinity,
      // SizedBox có `width: double.infinity` giúp nút giãn rộng hết mức theo chiều ngang.

      child: OutlinedButton(
        onPressed: press, // Khi nhấn, hàm `press` được gọi.
        style: OutlinedButton.styleFrom(
          // style: tùy chỉnh các thuộc tính hiển thị của nút.
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: 12),
          // padding: Cung cấp khoảng cách trong nút, với khoảng cách ngang từ hằng số defaultPadding và khoảng cách dọc là 12.

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            // borderRadius: Làm tròn các góc của nút với bán kính là 8.

            side: BorderSide(color: primaryColor, width: 0.8),
            // side: Viền ngoài của nút với màu `primaryColor` và độ rộng viền là 0.8.
          ),
        ),
        child: child, // Widget con được hiển thị trong nút.
      ),
    );
  }
}
