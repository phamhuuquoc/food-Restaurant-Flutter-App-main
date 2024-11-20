import 'package:flutter/material.dart'; // Thư viện chính của Flutter.
import 'package:foodly_ui/constants.dart'; // Tệp constants chứa các giá trị không thay đổi như padding, màu sắc.
import '../../components/dot_indicators.dart'; // Thành phần để hiển thị chấm trạng thái (Dot Indicators).
import '../auth/sign_in_screen.dart'; // Màn hình đăng nhập.
import 'components/onboard_content.dart'; // Thành phần hiển thị nội dung Onboarding.

/// Widget chính của màn hình Onboarding.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

/// State lưu trữ trạng thái cho `OnboardingScreen`.
class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0; // Biến theo dõi trang hiện tại của PageView.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Đảm bảo nội dung không tràn ra khu vực như notch hay thanh trạng thái.
        child: Column(
          children: [
            const Spacer(flex: 2), // Khoảng trống chiếm 2 phần chiều cao tổng.

            /// Phần hiển thị nội dung các trang Onboarding.
            Expanded(
              flex: 14, // Phần này chiếm 14 phần chiều cao tổng.
              child: PageView.builder(
                // Công cụ tạo danh sách trang có thể cuộn.
                itemCount:
                    demoData.length, // Số lượng trang dựa trên `demoData`.
                onPageChanged: (value) {
                  // Gọi khi người dùng thay đổi trang.
                  setState(() {
                    currentPage = value; // Cập nhật trang hiện tại.
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  // Xây dựng nội dung từng trang.
                  illustration: demoData[index]
                      ["illustration"], // Đường dẫn ảnh minh họa.
                  title: demoData[index]["title"], // Tiêu đề của trang.
                  text: demoData[index]["text"], // Văn bản mô tả của trang.
                ),
              ),
            ),

            const Spacer(), // Khoảng trống chiếm 1 phần chiều cao tổng.

            /// Hiển thị các chấm trạng thái dưới màn hình.
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các chấm.
              children: List.generate(
                // Tạo danh sách các DotIndicator.
                demoData.length, // Số lượng chấm dựa trên `demoData`.
                (index) => DotIndicator(
                    isActive: index == currentPage), // Trạng thái hoạt động.
              ),
            ),

            const Spacer(flex: 2), // Khoảng trống chiếm 2 phần chiều cao tổng.

            /// Nút điều hướng sang màn hình đăng nhập.
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding), // Thêm khoảng cách ngang.
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // Điều hướng sang `SignInScreen`.
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: Text("Bắt đầu ngay bây giờ"
                    .toUpperCase()), // Văn bản in hoa trên nút.
              ),
            ),

            const Spacer(), // Khoảng trống chiếm 1 phần chiều cao tổng.
          ],
        ),
      ),
    );
  }
}

/// Dữ liệu mẫu hiển thị trong các trang Onboarding.
List<Map<String, dynamic>> demoData = [
  {
    "illustration":
        "assets/Illustrations/Illustrations_1.svg", // Hình minh họa đầu tiên.
    "title": "Tất cả các mục yêu thích của bạn", // Tiêu đề trang đầu.
    "text":
        "Đặt hàng từ các nhà hàng địa phương tốt nhất \nvới dịch vụ giao hàng theo yêu cầu, dễ dàng.", // Nội dung mô tả.
  },
  {
    "illustration":
        "assets/Illustrations/Illustrations_2.svg", // Hình minh họa thứ hai.
    "title": "Ưu đãi giao hàng miễn phí", // Tiêu đề trang thứ hai.
    "text":
        "Giao hàng miễn phí cho khách hàng mới \nvà các phương thức thanh toán khác.", // Nội dung mô tả.
  },
  {
    "illustration":
        "assets/Illustrations/Illustrations_3.svg", // Hình minh họa thứ ba.
    "title": "Chọn thức ăn của bạn", // Tiêu đề trang thứ ba.
    "text":
        "Dễ dàng tìm thấy kiểu thèm ăn của bạn và\nbạn sẽ được giao hàng trong phạm vi rộng.", // Nội dung mô tả.
  },
];
