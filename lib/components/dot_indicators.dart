import 'package:flutter/material.dart';
import '../constants.dart';
// constants.dart chứa các hằng số tái sử dụng trong ứng dụng, chẳng hạn như màu sắc và khoảng cách.

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive =
        false, // Chỉ định trạng thái có hoạt động hay không (active hoặc inactive).
    this.activeColor = primaryColor, // Màu sắc của dot khi nó được active.
    this.inActiveColor =
        const Color(0xFF868686), // Màu sắc của dot khi nó không được active.
  });

  final bool isActive; // Trạng thái của indicator (active hay inactive).
  final Color activeColor,
      inActiveColor; // Màu sắc của dot khi active hoặc inactive.

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // AnimatedContainer giúp tạo ra một hiệu ứng hoạt hình khi thay đổi các thuộc tính.
      duration:
          kDefaultDuration, // Thời gian chuyển đổi khi trạng thái thay đổi.
      margin: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2), // Khoảng cách giữa các dots.
      height: 5, // Chiều cao của dot indicator.
      width: 8, // Chiều rộng của dot indicator.
      decoration: BoxDecoration(
        // Cung cấp các thuộc tính trang trí cho indicator.
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        // Nếu dot đang hoạt động, sử dụng activeColor, nếu không thì dùng inActiveColor với độ mờ.
        borderRadius:
            const BorderRadius.all(Radius.circular(20)), // Góc bo tròn cho dot.
      ),
    );
  }
}
