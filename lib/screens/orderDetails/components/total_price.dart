import 'package:flutter/material.dart'; // Thư viện Flutter cơ bản
import '../../../constants.dart'; // Nhập các hằng số từ file constants.dart

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.price, // price là giá trị truyền vào khi sử dụng widget này
  });

  final double price; // Định nghĩa biến price là một giá trị kiểu double

  @override
  Widget build(BuildContext context) {
    return Row(
      // Sử dụng Row để sắp xếp các phần tử ngang hàng
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử ở hai đầu
      children: [
        const Text.rich(
          // Dùng Text.rich để kết hợp các kiểu chữ trong một dòng
          TextSpan(
            text: "Tổng cộng ", // Text chính "Total"
            style: TextStyle(
                color: titleColor,
                fontWeight:
                    FontWeight.w500), // Căn chỉnh màu và font cho "Total"
            children: [
              TextSpan(
                text: "(incl. VAT)", // Text con là "(incl. VAT)"
                style: TextStyle(
                    fontWeight: FontWeight
                        .normal), // Căn chỉnh font chữ của "(incl. VAT)"
              ),
            ],
          ),
        ),
        Text(
          "\$$price", // Hiển thị giá trị price với dấu "$"
          style: const TextStyle(
              color: titleColor,
              fontWeight: FontWeight.w500), // Căn chỉnh màu và font cho giá
        ),
      ],
    );
  }
}
