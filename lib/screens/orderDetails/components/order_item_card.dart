import 'package:flutter/material.dart';
import '../../../constants.dart';

class OrderedItemCard extends StatelessWidget {
  const OrderedItemCard({
    super.key,
    required this.numOfItem,
    required this.title,
    required this.description,
    required this.price,
  });

  final int numOfItem;
  final String? title, description;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumOfItems(numOfItem: numOfItem), // Hiển thị số lượng món
            const SizedBox(width: defaultPadding * 0.75),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style:
                        Theme.of(context).textTheme.titleMedium, // Tiêu đề món
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    description!,
                    style: Theme.of(context).textTheme.bodyMedium, // Mô tả món
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Cắt mô tả nếu quá dài
                  ),
                ],
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "USD \$${price.toString()}", // Hiển thị giá món
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: primaryColor), // Màu sắc của giá
            ),
          ],
        ),
        const SizedBox(height: defaultPadding / 2),
        const Divider(), // Đường phân cách
      ],
    );
  }
}

class NumOfItems extends StatelessWidget {
  const NumOfItems({
    super.key,
    required this.numOfItem,
  });

  final int numOfItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
            width: 0.5, color: const Color(0xFF868686).withOpacity(0.3)),
      ),
      child: Text(
        numOfItem.toString(), // Hiển thị số lượng món
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: primaryColor), // Màu sắc của số lượng
      ),
    );
  }
}