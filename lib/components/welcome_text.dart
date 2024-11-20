import 'package:flutter/material.dart';
import 'package:foodly_ui/constants.dart';

class WelcomeText extends StatelessWidget {
  final String title, text;

  const WelcomeText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding), // Khoảng cách trên
        Text(
          title, // Tiêu đề
          style: Theme.of(context)
              .textTheme
              .titleLarge! // Sử dụng kiểu chữ từ theme
              .copyWith(
                  fontWeight:
                      FontWeight.w600), // Thêm trọng lượng font cho tiêu đề
        ),
        const SizedBox(
            height: defaultPadding / 2), // Khoảng cách giữa tiêu đề và mô tả
        Text(text,
            style: Theme.of(context).textTheme.bodyMedium), // Mô tả văn bản
        const SizedBox(height: defaultPadding), // Khoảng cách dưới
      ],
    );
  }
}
