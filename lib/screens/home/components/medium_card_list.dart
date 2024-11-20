import 'package:flutter/material.dart';
import 'package:foodly_ui/screens/details/details_screen.dart'; // Import màn hình chi tiết sản phẩm
import '../../../components/cards/medium/restaurant_info_medium_card.dart'; // Import card thông tin nhà hàng
import '../../../components/scalton/medium_card_scalton.dart'; // Import widget Skeleton (xương cá) để hiển thị khi tải
import '../../../constants.dart'; // Import các hằng số
import '../../../demoData.dart'; // Import dữ liệu mẫu

class MediumCardList extends StatefulWidget {
  const MediumCardList({super.key});

  @override
  _MediumCardListState createState() => _MediumCardListState();
}

class _MediumCardListState extends State<MediumCardList> {
  bool isLoading = true; // Trạng thái tải dữ liệu, mặc định là đang tải

  @override
  void initState() {
    super.initState();
    // Mô phỏng tải dữ liệu bằng cách chờ 1 giây
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false; // Cập nhật trạng thái là đã tải xong
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy dữ liệu mẫu và trộn ngẫu nhiên để hiển thị
    List data = demoMediumCardData..shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Phần danh sách nhà hàng hiển thị theo chiều ngang
        SizedBox(
          width: double.infinity, // Chiều rộng chiếm toàn màn hình
          height: 254, // Độ cao cố định cho danh sách
          child: isLoading
              // Nếu đang tải, hiển thị hiệu ứng skeleton
              ? buildFeaturedPartnersLoadingIndicator()
              // Nếu tải xong, hiển thị danh sách card nhà hàng
              : ListView.builder(
                  scrollDirection: Axis.horizontal, // Cuộn ngang
                  itemCount: data.length, // Số lượng item
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding, // Padding trái mặc định
                      right: (data.length - 1) == index
                          ? defaultPadding
                          : 0, // Padding phải nếu là phần tử cuối
                    ),
                    // Thẻ thông tin nhà hàng
                    child: RestaurantInfoMediumCard(
                      image: data[index]['image'], // Hình ảnh nhà hàng
                      name: data[index]['name'], // Tên nhà hàng
                      location: data[index]['location'], // Vị trí
                      delivertTime: 25, // Thời gian giao hàng cố định
                      rating: 4.6, // Đánh giá cố định
                      press: () {
                        // Điều hướng sang màn hình chi tiết khi nhấn vào thẻ
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
      ],
    );
  }

  // Widget skeleton (xương cá) hiển thị khi đang tải
  SingleChildScrollView buildFeaturedPartnersLoadingIndicator() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Cuộn ngang
      child: Row(
        // Tạo danh sách widget Skeleton
        children: List.generate(
          2, // Số lượng Skeleton
          (index) => const Padding(
            padding: EdgeInsets.only(left: defaultPadding), // Padding trái
            child: MediumCardScalton(), // Widget Skeleton
          ),
        ),
      ),
    );
  }
}
