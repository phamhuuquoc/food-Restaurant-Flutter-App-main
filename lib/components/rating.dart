import 'package:flutter/material.dart';
import '../constants.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating, // Điểm đánh giá
  });

  final double rating; // Điểm đánh giá

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 3), // Padding của hộp chứa
      decoration: const BoxDecoration(
        color: primaryColor, // Màu nền của hộp đánh giá (primaryColor)
        borderRadius: BorderRadius.all(Radius.circular(6)), // Bo góc hộp
      ),
      child: Text(
        rating.toString(), // Hiển thị điểm đánh giá dưới dạng chuỗi
        style: Theme.of(context)
            .textTheme
            .labelSmall! // Kiểu chữ từ theme của ứng dụng
            .copyWith(color: Colors.white), // Màu chữ là trắng
      ),
    );
  }
}
