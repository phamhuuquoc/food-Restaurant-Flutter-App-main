import 'package:flutter/material.dart'; // Thư viện Flutter để xây dựng giao diện
import 'package:flutter_svg/flutter_svg.dart'; // Thư viện hỗ trợ hiển thị các hình ảnh SVG
import '../../../components/price_range_and_food_type.dart'; // Component hiển thị loại thức ăn và mức giá
import '../../../components/rating_with_counter.dart'; // Component hiển thị đánh giá và số lượng đánh giá
import '../../../constants.dart'; // Các hằng số chung, ví dụ như padding và màu sắc

// Widget hiển thị thông tin về nhà hàng
class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding), // Đặt padding cho lề trái và phải
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Căn lề các phần tử bên trái
        children: [
          // Tiêu đề nhà hàng
          Text(
            "Nhà hàng của Bẻm", // Tên nhà hàng
            style: Theme.of(context)
                .textTheme
                .headlineMedium, // Áp dụng kiểu chữ headlineMedium
            maxLines: 1, // Giới hạn tối đa 1 dòng
          ),
          const SizedBox(
              height: defaultPadding / 2), // Khoảng cách giữa các phần tử

          // Component hiển thị loại thức ăn và mức giá
          const PriceRangeAndFoodtype(
            foodType: ["Gà rán"], // Loại món ăn là "Fried Chicken"
          ),
          const SizedBox(
              height: defaultPadding / 2), // Khoảng cách giữa các phần tử

          // Component hiển thị đánh giá và số lượng đánh giá
          const RatingWithCounter(rating: 8.6, numOfRating: 200),
          const SizedBox(
              height: defaultPadding), // Khoảng cách giữa các phần tử

          // Hàng chứa thông tin giao hàng và nút Take away
          Row(
            children: [
              // Thông tin giao hàng miễn phí
              const DeliveryInfo(
                iconSrc: "assets/icons/delivery.svg", // Biểu tượng giao hàng
                text: "Miễn phí", // Văn bản "Free"
                subText: "Vận chuyển", // Phụ đề "Delivery"
              ),
              const SizedBox(
                  width: defaultPadding), // Khoảng cách giữa các phần tử

              // Thông tin giao hàng trong 20 phút
              const DeliveryInfo(
                iconSrc: "assets/icons/clock.svg", // Biểu tượng đồng hồ
                text: "20", // Văn bản "20"
                subText: "Phút", // Phụ đề "Minutes"
              ),
              const Spacer(), // Dãn cách giữa các phần tử

              // Nút "Take away"
              OutlinedButton(
                onPressed: () {}, // Hàm xử lý khi nhấn nút
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Đặt góc bo tròn cho nút
                  ),
                ),
                child: const Text("Mua mang về"), // Văn bản trên nút
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget hiển thị thông tin giao hàng (biểu tượng và văn bản)
class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({
    super.key,
    required this.iconSrc,
    required this.text,
    required this.subText,
  });

  final String iconSrc, text, subText; // Các tham số của widget

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Căn lề các phần tử theo chiều dọc
      children: [
        // Biểu tượng SVG
        SvgPicture.asset(
          iconSrc, // Đường dẫn tới tệp SVG
          height: 20, // Chiều cao biểu tượng
          width: 20, // Chiều rộng biểu tượng
          color: primaryColor, // Màu sắc của biểu tượng
        ),
        const SizedBox(width: 8), // Khoảng cách giữa biểu tượng và văn bản
        // Văn bản mô tả thông tin giao hàng
        Text.rich(
          TextSpan(
            text: "$text\n", // Văn bản chính
            style: Theme.of(context)
                .textTheme
                .labelLarge, // Áp dụng kiểu chữ labelLarge
            children: [
              TextSpan(
                text: subText, // Văn bản phụ
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight
                        .normal), // Áp dụng kiểu chữ labelSmall và fontWeight bình thường
              )
            ],
          ),
        ),
      ],
    );
  }
}
