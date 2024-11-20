import 'package:flutter/material.dart';
import '../../../components/price_range_and_food_type.dart'; // Import widget cho phạm vi giá và loại thực phẩm
import '../../../constants.dart'; // Import các constants như màu sắc, padding,...

class Info extends StatelessWidget {
  const Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Canh lề bên trái
      children: [
        // Hình ảnh món ăn, AspectRatio để duy trì tỷ lệ phù hợp
        AspectRatio(
          aspectRatio: 1.33, // Tỷ lệ 1.33:1 cho hình ảnh
          child: Image.asset(
            "assets/images/Header-image.png", // Đường dẫn hình ảnh trong thư mục assets
            fit: BoxFit.cover, // Đảm bảo hình ảnh phủ đầy khu vực
          ),
        ),
        const SizedBox(height: defaultPadding), // Khoảng cách dưới hình ảnh
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding), // Padding trái và phải
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Canh lề trái cho các phần tử trong Column
            children: [
              // Tiêu đề món ăn
              Text("Bánh Mì Cookie",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge), // Sử dụng style titleLarge từ theme
              const SizedBox(height: 8), // Khoảng cách giữa tiêu đề và mô tả
              // Mô tả món ăn
              Text(
                "Bánh quy shortbread, bánh quy chocolate turtle và bánh red velvet. 8 ounces cream cheese, làm mềm.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium, // Sử dụng style bodyMedium từ theme
              ),
              const SizedBox(height: 16), // Khoảng cách dưới mô tả
              // Hiển thị phạm vi giá và loại thực phẩm
              const PriceRangeAndFoodtype(
                foodType: [
                  "Món Hoa",
                  "Món Mỹ",
                  "Món Đặc Sản"
                ], // Các loại thực phẩm
              ),
            ],
          ),
        ),
      ],
    );
  }
}
