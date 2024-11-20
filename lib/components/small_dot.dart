import 'package:flutter/material.dart';

class SmallDot extends StatelessWidget {
  const SmallDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4, // Chiều cao của dấu chấm
      width:
          4, // Chiều rộng của dấu chấm (giữ cho nó hình tròn vì chiều cao và chiều rộng bằng nhau)
      decoration: BoxDecoration(
        color: Theme.of(context)
            .textTheme
            .bodyLarge!
            .color!
            .withOpacity(0.4), // Màu của dấu chấm dựa trên theme hiện tại
        shape: BoxShape.circle, // Đảm bảo dấu chấm là hình tròn
      ),
    );
  }
}
