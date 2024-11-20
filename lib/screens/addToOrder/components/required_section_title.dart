import 'package:flutter/material.dart';
import '../../../constants.dart'; // Import các constants, ví dụ như màu sắc và padding

class RequiredSectionTitle extends StatelessWidget {
  const RequiredSectionTitle({
    super.key,
    required this.title, // Yêu cầu truyền vào title (tiêu đề) khi sử dụng widget này
  });

  final String title; // Biến lưu trữ giá trị của tiêu đề được truyền vào

  @override
  Widget build(BuildContext context) {
    return Row(
      // Dùng Row để sắp xếp các phần tử theo chiều ngang
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn đều các phần tử
      children: [
        // Tiêu đề chính
        Text(
          title, // Hiển thị giá trị của title được truyền vào widget
          maxLines: 1, // Chỉ hiển thị 1 dòng cho tiêu đề
          style: Theme.of(context)
              .textTheme
              .titleLarge, // Áp dụng style từ theme (style tiêu đề lớn)
        ),
        // Container chứa "Yêu cầu" (nút hoặc label)
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding /
                2, // Padding trái và phải bằng 1/2 padding mặc định
            vertical: defaultPadding /
                4, // Padding trên và dưới bằng 1/4 padding mặc định
          ),
          decoration: BoxDecoration(
              color: accentColor.withOpacity(
                  0.2), // Màu nền sử dụng accentColor với độ mờ 20%
              borderRadius: const BorderRadius.all(
                  Radius.circular(4))), // Bo góc container với bán kính 4
          child: Text(
            "Yêu cầu".toUpperCase(), // Chuyển chữ "Yêu cầu" thành chữ hoa
            style: Theme.of(context)
                .textTheme
                .labelSmall! // Áp dụng style labelSmall từ theme
                .copyWith(
                    color:
                        accentColor), // Copy style và thay đổi màu sắc thành accentColor
          ),
        )
      ],
    );
  }
}
