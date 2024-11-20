import 'package:flutter/material.dart';
import '../../../components/scalton/scalton_rounded_container.dart'; // Import widget Skeleton để hiển thị trong khi tải
import '../../../constants.dart'; // Import các hằng số

// Widget chính hiển thị banner quảng cáo
class PromotionBanner extends StatefulWidget {
  const PromotionBanner({
    super.key,
  });

  @override
  _PromotionBannerState createState() => _PromotionBannerState();
}

class _PromotionBannerState extends State<PromotionBanner> {
  bool isLoading = true; // Biến trạng thái để theo dõi quá trình tải

  @override
  void initState() {
    super.initState();
    // Mô phỏng tải dữ liệu với độ trễ 1 giây
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false; // Cập nhật trạng thái là đã tải xong
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding), // Thêm khoảng cách hai bên cho banner
      child: isLoading
          ? const AspectRatio(
              // Khi đang tải, hiển thị widget Skeleton (dạng placeholder)
              aspectRatio: 1.97, // Tỉ lệ chiều rộng và chiều cao của container
              child: ScaltonRoundedContainer(
                  radious: 12), // Widget Skeleton với góc bo tròn
            )
          : ClipRRect(
              // Khi tải xong, hiển thị ảnh banner
              borderRadius: const BorderRadius.all(
                  Radius.circular(12)), // Bo tròn các góc
              child: Image.asset(
                  "assets/images/Banner.png"), // Ảnh banner từ tệp local
            ),
    );
  }
}
