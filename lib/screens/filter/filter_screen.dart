import 'package:flutter/material.dart'; // Thư viện Flutter để xây dựng giao diện người dùng
import '../../constants.dart'; // Import các hằng số như padding và màu sắc
import 'components/categories.dart'; // Import component Categories
import 'components/dietaries.dart'; // Import component Dietaries
import 'components/price_range.dart'; // Import component PriceRange

// Màn hình lọc (FilterScreen) với các bộ lọc cho người dùng
class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key}); // Constructor của FilterScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold là cấu trúc cơ bản của một màn hình trong Flutter
      appBar: AppBar(
        // Thanh tiêu đề
        title: const Text("Bộ lọc"), // Tiêu đề của màn hình
      ),
      body: const SafeArea(
        // SafeArea đảm bảo rằng nội dung không bị che khuất bởi các yếu tố như thanh trạng thái hoặc thanh điều hướng
        child: SingleChildScrollView(
          // Cho phép cuộn khi nội dung dài hơn màn hình
          child: Column(
            // Column để xếp các phần tử theo chiều dọc
            crossAxisAlignment: CrossAxisAlignment
                .start, // Các phần tử con được căn chỉnh bên trái
            children: [
              SizedBox(
                  height:
                      defaultPadding), // Khoảng cách đầu tiên (dùng hằng số padding mặc định)
              Categories(), // Hiển thị phần "Categories"
              SizedBox(height: defaultPadding), // Khoảng cách giữa các phần tử
              Dietaries(), // Hiển thị phần "Dietaries"
              SizedBox(height: defaultPadding), // Khoảng cách giữa các phần tử
              PriceRange(), // Hiển thị phần "PriceRange"
              SizedBox(height: defaultPadding), // Khoảng cách cuối cùng
            ],
          ),
        ),
      ),
    );
  }
}
