import 'package:flutter/material.dart'; // Thư viện Flutter để xây dựng giao diện
import 'package:flutter_svg/svg.dart'; // Thư viện hỗ trợ hiển thị các hình ảnh SVG
import '../../constants.dart'; // Các hằng số chung, ví dụ như padding và màu sắc
import '../search/search_screen.dart'; // Màn hình tìm kiếm
import 'components/iteams.dart'; // Component hiển thị danh sách món ăn
import 'components/restaurrant_info.dart'; // Component hiển thị thông tin nhà hàng

// Màn hình chi tiết của nhà hàng
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Nút chia sẻ
          IconButton(
            icon: SvgPicture.asset(
                "assets/icons/share.svg"), // Biểu tượng chia sẻ
            onPressed: () {
              // Hành động chia sẻ, hiện tại chưa có chức năng
            },
          ),
          // Nút tìm kiếm
          IconButton(
            icon: SvgPicture.asset(
                "assets/icons/search.svg"), // Biểu tượng tìm kiếm
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SearchScreen(), // Điều hướng đến màn hình tìm kiếm
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        // SafeArea giúp tránh phần giao diện bị che khuất bởi các vùng như notch hoặc thanh trạng thái
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Căn lề các phần tử bên trái
            children: [
              SizedBox(height: defaultPadding / 2), // Khoảng cách trên đầu
              RestaurantInfo(), // Hiển thị thông tin nhà hàng
              SizedBox(height: defaultPadding), // Khoảng cách giữa các phần tử
              Items(), // Hiển thị danh sách món ăn
            ],
          ),
        ),
      ),
    );
  }
}
