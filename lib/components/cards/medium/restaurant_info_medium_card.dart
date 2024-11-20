import 'package:flutter/material.dart';
// Thư viện Material Design của Flutter cung cấp các widget và thành phần giao diện người dùng tiêu chuẩn.

import '../../../constants.dart';
// Thư viện constants.dart chứa các hằng số tái sử dụng trong ứng dụng, chẳng hạn như màu sắc, khoảng cách mặc định.

import '../../rating.dart';
// rating.dart chứa widget Rating, hiển thị đánh giá của nhà hàng.

import '../../small_dot.dart';
// small_dot.dart chứa widget SmallDot, có thể là một dấu chấm nhỏ dùng để phân tách các thông tin.

class RestaurantInfoMediumCard extends StatelessWidget {
  const RestaurantInfoMediumCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.delivertTime,
    required this.press,
  });

  final String image, name, location; // Hình ảnh, tên, và vị trí của nhà hàng.
  final double rating; // Đánh giá của nhà hàng.
  final int delivertTime; // Thời gian giao hàng (tính bằng phút).
  final VoidCallback press; // Callback khi nhấn vào card.

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell dùng để tạo hiệu ứng khi người dùng nhấn vào widget.
      onTap: press, // Gọi callback khi nhấn vào card.
      child: SizedBox(
        width: 200, // Chiều rộng cố định cho card.
        child: Column(
          // Dùng Column để xếp các widget theo chiều dọc.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25, // Tỉ lệ khung hình của ảnh.
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                // Cắt góc ảnh để có hình dạng bo tròn.
                child: Image.asset(image, fit: BoxFit.cover),
                // Hiển thị hình ảnh nhà hàng từ asset.
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            // Hiển thị tên nhà hàng. Nếu tên quá dài, nó sẽ bị cắt với dấu "..." (ellipsis).
            const SizedBox(height: defaultPadding / 4),
            Text(
              location,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // Hiển thị vị trí của nhà hàng.
            const SizedBox(height: defaultPadding / 2),
            Row(
              // Dùng Row để xếp các widget theo chiều ngang.
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Rating(rating: rating),
                // Hiển thị đánh giá nhà hàng với widget Rating.
                Text(
                  "$delivertTime min",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: titleColor.withOpacity(0.74)),
                ),
                // Hiển thị thời gian giao hàng.
                const SmallDot(),
                // Hiển thị dấu chấm nhỏ giữa các thông tin.
                Text(
                  "Free delivery",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: titleColor.withOpacity(0.74)),
                ),
                // Hiển thị trạng thái giao hàng miễn phí.
              ],
            )
          ],
        ),
      ),
    );
  }
}
