import 'package:flutter/material.dart';
// Thư viện Material Design của Flutter cung cấp các widget tiêu chuẩn cho giao diện người dùng.

class SocalButton extends StatelessWidget {
  // SocalButton là một nút tùy chỉnh với biểu tượng và văn bản, chủ yếu dùng cho các nút mạng xã hội.

  final Color color; // Màu nền của nút.
  final String text; // Văn bản hiển thị trên nút.
  final Widget icon; // Biểu tượng hiển thị trên nút.
  final GestureTapCallback press; // Hàm callback được gọi khi nút được bấm.

  const SocalButton({
    super.key,
    required this.color, // Màu nền được truyền vào từ bên ngoài.
    required this.icon, // Biểu tượng được truyền vào từ bên ngoài.
    required this.press, // Hàm callback được truyền vào từ bên ngoài.
    required this.text, // Văn bản được truyền vào từ bên ngoài.
  });

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    // padding: Đệm khoảng cách bên trong nút, với chiều ngang là 16 và chiều dọc là 8.

    return SizedBox(
      width: double.infinity,
      // `width: double.infinity` đảm bảo nút chiếm toàn bộ chiều ngang của bố cục.

      child: ElevatedButton(
        // ElevatedButton: Một nút nổi với nền màu.
        style: ElevatedButton.styleFrom(
          padding: padding, // Sử dụng padding đã định nghĩa trước đó.
          backgroundColor: color, // Màu nền của nút.
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            // borderRadius: Làm tròn các góc của nút với bán kính là 8.
          ),
        ),
        onPressed: press, // Khi nút được nhấn, hàm `press` sẽ được gọi.

        child: Row(
          // Row để sắp xếp icon và text theo chiều ngang.
          children: [
            Container(
              padding:
                  const EdgeInsets.all(8), // Đệm khoảng cách xung quanh icon.
              height: 28, // Chiều cao của container chứa icon.
              width: 28, // Chiều rộng của container chứa icon.
              decoration: const BoxDecoration(
                color: Colors.white, // Màu nền trắng cho container icon.
                borderRadius: BorderRadius.all(Radius.circular(4)),
                // borderRadius: Làm tròn góc của container chứa icon với bán kính là 4.
              ),
              child: icon, // Biểu tượng hiển thị trong container.
            ),
            const Spacer(flex: 2),
            // Spacer giúp tạo khoảng cách giữa icon và text.

            Text(
              text.toUpperCase(), // Văn bản được chuyển thành chữ in hoa.
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              // style: Sử dụng kiểu chữ bodySmall của theme, đổi màu chữ thành trắng và đậm.
            ),
            const Spacer(flex: 3),
            // Spacer tạo khoảng cách giữa text và cạnh bên phải của nút.
          ],
        ),
      ),
    );
  }
}
