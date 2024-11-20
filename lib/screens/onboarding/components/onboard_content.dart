import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Widget StatelessWidget được dùng để hiển thị nội dung một trang onboarding
class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration, // Đường dẫn đến hình minh họa SVG
    required this.title, // Tiêu đề của trang onboarding
    required this.text, // Mô tả chi tiết nội dung
  });

  // Các biến cần thiết để hiển thị nội dung
  final String? illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Phần hình minh họa
        Expanded(
          child: AspectRatio(
            aspectRatio: 1, // Đảm bảo tỷ lệ hình minh họa là 1:1
            child: SvgPicture.asset(
                illustration!), // Hiển thị file SVG từ đường dẫn
          ),
        ),
        const SizedBox(height: 16), // Khoảng cách giữa hình và tiêu đề

        // Phần tiêu đề
        Text(
          title!, // Tiêu đề được truyền vào
          style: Theme.of(context)
              .textTheme
              .titleLarge! // Lấy kiểu tiêu đề lớn từ theme hiện tại
              .copyWith(fontWeight: FontWeight.bold), // Chỉnh font in đậm
        ),
        const SizedBox(height: 8), // Khoảng cách giữa tiêu đề và mô tả

        // Phần mô tả
        Text(
          text!, // Nội dung mô tả được truyền vào
          style:
              Theme.of(context).textTheme.bodyMedium, // Kiểu chữ mô tả từ theme
          textAlign: TextAlign.center, // Căn giữa văn bản
        ),
      ],
    );
  }
}
