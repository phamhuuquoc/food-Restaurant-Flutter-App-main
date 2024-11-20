import 'package:flutter/material.dart'; // Thư viện Flutter dùng để xây dựng giao diện
import 'package:foodly_ui/screens/details/details_screen.dart'; // Màn hình chi tiết của nhà hàng
import '../../../components/cards/big/restaurant_info_big_card.dart'; // Component hiển thị thông tin nhà hàng
import '../../../components/scalton/big_card_scalton.dart'; // Component dùng để hiển thị hiệu ứng loading (placeholder)
import '../../../constants.dart'; // Các hằng số chung như padding, màu sắc
import '../../../demoData.dart'; // Dữ liệu giả lập (demo) cho các món ăn và nhà hàng

// Widget chính hiển thị nội dung của màn hình chính
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true; // Biến trạng thái để điều khiển loading
  int demoDataLength = 4; // Số lượng item giả lập cần hiển thị

  @override
  void initState() {
    super.initState();
    // Mô phỏng việc tải dữ liệu từ mạng
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading =
            false; // Sau 1 giây, cập nhật trạng thái để không còn loading nữa
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding), // Thêm padding cho toàn bộ nội dung
        child: ListView.builder(
          itemCount: isLoading
              ? 3
              : demoDataLength, // Số lượng item hiển thị, nếu đang loading thì hiển thị 3 item
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
                bottom: defaultPadding), // Khoảng cách giữa các item
            child: isLoading
                // Khi đang loading, hiển thị placeholder (hiệu ứng loading)
                ? const BigCardScalton()
                // Khi dữ liệu đã được tải xong, hiển thị thông tin nhà hàng
                : RestaurantInfoBigCard(
                    images: demoBigImages
                      ..shuffle(), // Shuffle ảnh từ danh sách demoBigImages
                    name: demoMediumCardData[index]["name"] ??
                        "Unknown", // Lấy tên nhà hàng, nếu null thì dùng "Unknown"
                    rating: demoMediumCardData[index]["rating"] ??
                        0, // Lấy đánh giá, nếu null thì dùng 0
                    numOfRating: demoMediumCardData[index]["numOfRating"] ??
                        0, // Số lượng đánh giá, nếu null thì dùng 0
                    deliveryTime: demoMediumCardData[index]["deliveryTime"] ??
                        0, // Thời gian giao hàng, nếu null thì dùng 0
                    foodType: demoMediumCardData[index]["foodType"] ??
                        [], // Loại món ăn, nếu null thì dùng mảng rỗng
                    press: () {
                      // Khi nhấn vào card nhà hàng, điều hướng đến màn hình chi tiết của nhà hàng
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsScreen(),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
