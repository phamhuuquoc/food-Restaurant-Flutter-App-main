import 'package:flutter/material.dart';
import '../../../constants.dart';

class RoundedCheckboxListTile extends StatelessWidget {
  const RoundedCheckboxListTile({
    super.key,
    this.isActive = false,
    required this.press,
    required this.text,
  });

  final bool
      isActive; // Biến xác định trạng thái (được chọn hoặc chưa được chọn) của checkbox
  final VoidCallback press; // Hành động khi checkbox được nhấn
  final String text; // Văn bản mô tả checkbox

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius:
              const BorderRadius.all(Radius.circular(8)), // Bo góc của nút chọn
          onTap: press, // Thực thi hành động khi checkbox được nhấn
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                CircleCheckBox(isActive: isActive), // Hiển thị checkbox tròn
                const SizedBox(
                    width: 8), // Khoảng cách giữa checkbox và văn bản
                Text(
                  text, // Văn bản mô tả checkbox
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: titleColor.withOpacity(0.84),
                      height: 1), // Kiểu dáng cho văn bản
                )
              ],
            ),
          ),
        ),
        const Divider(), // Dòng phân cách dưới mỗi checkbox
      ],
    );
  }
}

class CircleCheckBox extends StatelessWidget {
  const CircleCheckBox({
    super.key,
    this.isActive = false, // Biến xác định trạng thái của checkbox
  });

  final bool
      isActive; // Trạng thái của checkbox (được chọn hoặc chưa được chọn)

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kDefaultDuration, // Thời gian hoạt ảnh khi thay đổi trạng thái
      height: 24, // Chiều cao của checkbox
      width: 24, // Chiều rộng của checkbox
      padding: EdgeInsets.all(
          isActive ? 3 : 12), // Padding thay đổi tùy theo trạng thái
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Tạo hình tròn cho checkbox
        border: Border.all(
          color: isActive
              ? primaryColor
                  .withOpacity(0.54) // Màu viền khi checkbox được chọn
              : const Color(0xFF868686)
                  .withOpacity(0.54), // Màu viền khi checkbox không được chọn
          width: 0.8, // Độ dày của viền
        ),
      ),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: primaryColor, // Màu nền khi checkbox được chọn
          shape: BoxShape.circle, // Tạo hình tròn cho phần nền checkbox
        ),
      ),
    );
  }
}
