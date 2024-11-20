import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class RatingWithCounter extends StatelessWidget {
  const RatingWithCounter({
    super.key,
    required this.rating, // Đánh giá (số điểm đánh giá)
    required this.numOfRating, // Số lượng đánh giá
  });

  final double rating; // Số điểm đánh giá
  final int numOfRating; // Số lượng người đánh giá

  @override
  Widget build(BuildContext context) {
    return Row(
      // Sử dụng Row để sắp xếp các widget con theo chiều ngang
      children: [
        // Hiển thị số điểm đánh giá
        Text(
          rating.toString(), // Chuyển đổi số điểm thành chuỗi
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: titleColor.withOpacity(0.74)),
        ),
        const SizedBox(width: 8), // Khoảng cách giữa các phần tử

        // Hiển thị biểu tượng sao đánh giá
        SvgPicture.asset(
          "assets/icons/rating.svg", // Sử dụng hình ảnh SVG biểu tượng sao
          height: 20,
          width: 20,
          colorFilter: const ColorFilter.mode(
            primaryColor, // Màu sắc của sao được gán bằng primaryColor
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 8), // Khoảng cách giữa các phần tử

        // Hiển thị số lượng đánh giá
        Text(
          "$numOfRating+ Ratings", // Hiển thị số lượng đánh giá với ký tự "+"
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: titleColor.withOpacity(0.74)),
        ),
      ],
    );
  }
}
