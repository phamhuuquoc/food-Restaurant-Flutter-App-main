import 'package:flutter/material.dart';
// Thư viện Material Design của Flutter cung cấp các widget và thành phần giao diện người dùng tiêu chuẩn.

import 'package:flutter_svg/flutter_svg.dart';
// Thư viện flutter_svg giúp hiển thị các hình ảnh dạng SVG trong ứng dụng Flutter.

import '../../../constants.dart';
// Thư viện constants.dart chứa các hằng số tái sử dụng trong ứng dụng, chẳng hạn như màu sắc, khoảng cách mặc định.

import '../../price_range_and_food_type.dart';
// price_range_and_food_type.dart chứa widget PriceRangeAndFoodtype, hiển thị thông tin loại thực phẩm và mức giá.

import '../../rating_with_counter.dart';
// rating_with_counter.dart chứa widget RatingWithCounter, hiển thị đánh giá và số lượng người đã đánh giá.

import '../../small_dot.dart';
// small_dot.dart chứa widget SmallDot, có thể là một dấu chấm nhỏ dùng để phân tách các thông tin.

import 'big_card_image_slide.dart';
// big_card_image_slide.dart chứa widget BigCardImageSlide, dùng để hiển thị các hình ảnh của nhà hàng dưới dạng slide.

class RestaurantInfoBigCard extends StatelessWidget {
  final List<String> images,
      foodType; // Danh sách hình ảnh của nhà hàng và loại món ăn.
  final String name; // Tên nhà hàng.
  final double rating; // Đánh giá của nhà hàng.
  final int numOfRating,
      deliveryTime; // Số lượng đánh giá và thời gian giao hàng.
  final bool isFreeDelivery; // Kiểm tra xem có giao hàng miễn phí hay không.
  final VoidCallback press; // Callback khi người dùng nhấn vào card.

  const RestaurantInfoBigCard({
    super.key,
    required this.name,
    required this.rating,
    required this.numOfRating,
    required this.deliveryTime,
    this.isFreeDelivery = true, // Mặc định là giao hàng miễn phí.
    required this.images,
    required this.foodType,
    required this.press, // Callback khi nhấn vào card.
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell dùng để tạo hiệu ứng khi người dùng nhấn vào widget.
      onTap: press, // Gọi callback khi nhấn vào card.
      child: Column(
        // Dùng Column để xếp các widget theo chiều dọc.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigCardImageSlide(images: images),
          // Hiển thị slide hình ảnh nhà hàng với BigCardImageSlide.
          const SizedBox(height: defaultPadding / 2),
          // Khoảng cách giữa các widget.
          Text(name, style: Theme.of(context).textTheme.titleLarge),
          // Hiển thị tên nhà hàng với kiểu chữ titleLarge từ theme.
          const SizedBox(height: defaultPadding / 4),
          PriceRangeAndFoodtype(foodType: foodType),
          // Hiển thị loại món ăn và mức giá với widget PriceRangeAndFoodtype.
          const SizedBox(height: defaultPadding / 4),
          Row(
            // Dùng Row để xếp các widget theo chiều ngang.
            children: [
              RatingWithCounter(rating: rating, numOfRating: numOfRating),
              // Hiển thị đánh giá và số lượng đánh giá với widget RatingWithCounter.
              const SizedBox(width: defaultPadding / 2),
              SvgPicture.asset(
                "assets/icons/clock.svg",
                // Hiển thị biểu tượng đồng hồ từ file SVG.
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "$deliveryTime Min",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              // Hiển thị thời gian giao hàng.
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: SmallDot(),
                // Hiển thị dấu chấm nhỏ.
              ),
              SvgPicture.asset(
                "assets/icons/delivery.svg",
                // Hiển thị biểu tượng giao hàng từ file SVG.
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(isFreeDelivery ? "Free" : "Paid",
                  style: Theme.of(context).textTheme.labelSmall),
              // Hiển thị trạng thái giao hàng miễn phí hay có phí.
            ],
          ),
        ],
      ),
    );
  }
}
