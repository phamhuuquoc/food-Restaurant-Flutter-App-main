//Chủ yếu phục vụ mục đích giao diện người dùng có thể thay đổi theo trạng thái của nút (hoạt động hay không hoạt động)

import 'package:flutter/material.dart';
//Khi import material.dart, bạn có thể sử dụng các widget, màu sắc, hiệu ứng, và các thành phần giao diện khác của Material Design

import '../../constants.dart';

//Widget này có tên là FittedButton và được kế thừa từ StatelessWidget
//Để biết một lớp trong Flutter có kế thừa từ StatelessWidget
//Ở đây, FittedButton sử dụng cú pháp extends StatelessWidget, cho thấy nó kế thừa từ StatelessWidget
class FittedButton extends StatelessWidget {
  const FittedButton({
    super.key,
    this.isActive = false,
    required this.text,
    required this.press,
  });

  final bool? isActive;
  final String? text;
  final VoidCallback press;

  //isActive: Xác định trạng thái của nút (mặc định là false).
  //text: Nội dung hiển thị trên nút.
  //press: Hàm callback sẽ được gọi khi nút được bấm.

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
        backgroundColor: isActive! ? primaryColor : const Color(0xFFF1F1F1),
      ),
      onPressed: press,
      child: Text(
        text!.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          color: isActive! ? Colors.white : titleColor.withOpacity(0.54),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
// Phương thức build trả về một ElevatedButton với các thuộc tính cấu hình như sau:
// style: Dùng TextButton.styleFrom để tùy chỉnh kiểu dáng của nút.
// padding: Cung cấp khoảng cách bên trong của nút, tính theo giá trị defaultPadding * 1.5 (được định nghĩa trong constants.dart).
// backgroundColor: Nếu isActive là true, màu nền của nút sẽ là primaryColor (màu chính được định nghĩa trong constants.dart); nếu không, màu nền là màu xám sáng (0xFFF1F1F1).
// onPressed: Khi nút được nhấn, callback press sẽ được gọi.
// child: Nội dung của nút là một Text, văn bản sẽ được chuyển thành chữ in hoa (toUpperCase()).
// style: Định dạng chữ:
// Kích thước chữ là 12.
// Màu sắc chữ thay đổi tùy theo isActive: nếu nút đang hoạt động, chữ có màu trắng; nếu không, chữ có màu titleColor (màu tiêu đề) với độ mờ 54%.
