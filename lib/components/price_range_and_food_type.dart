import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import thư viện SVG
import '../components/small_dot.dart';
import '../constants.dart';

class PriceRangeAndFoodtype extends StatelessWidget {
  const PriceRangeAndFoodtype({
    super.key,
    this.priceRange =
        'assets/icons/coin_dollar.svg', // Đường dẫn tới file SVG hình đồng xu
    required this.foodType,
  });

  final String priceRange; // Đường dẫn tới file SVG hình đồng xu
  final List<String> foodType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sử dụng SvgPicture để hiển thị file SVG
        SvgPicture.asset(
          priceRange,
          width: 24, // Điều chỉnh kích thước theo yêu cầu
          height: 24,
        ),
        ...List.generate(
          foodType.length,
          (index) => Row(
            children: [
              buildSmallDot(),
              Text(foodType[index],
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }

  Padding buildSmallDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      child: SmallDot(),
    );
  }
}
