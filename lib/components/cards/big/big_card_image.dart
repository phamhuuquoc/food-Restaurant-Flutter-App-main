import 'package:flutter/material.dart';
// Thư viện Material Design của Flutter cung cấp các widget và thành phần giao diện người dùng tiêu chuẩn.

class BigCardImage extends StatelessWidget {
  // BigCardImage là một widget tùy chỉnh hiển thị hình ảnh trong một container với bo góc và định dạng thích hợp.

  const BigCardImage({
    super.key,
    required this.image, // Đường dẫn hình ảnh (tên file hình ảnh trong assets) được truyền vào từ bên ngoài.
  });

  final String image; // Đường dẫn tới hình ảnh trong thư mục assets.

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container chứa hình ảnh, có thể được tùy chỉnh về kích thước, màu sắc và các yếu tố khác.

      decoration: BoxDecoration(
        // BoxDecoration dùng để trang trí cho Container.

        borderRadius: const BorderRadius.all(Radius.circular(12)),
        // borderRadius: Làm tròn các góc của container với bán kính 12, tạo hiệu ứng bo góc cho hình ảnh.

        image: DecorationImage(
          // DecorationImage cho phép đặt hình ảnh làm nền của container.
          image: AssetImage(image),
          // AssetImage: Được sử dụng để tải hình ảnh từ thư mục assets.
          // Nếu muốn tải hình ảnh từ URL, có thể thay thế bằng NetworkImage().

          fit: BoxFit.cover,
          // fit: BoxFit.cover giúp hình ảnh phủ đầy toàn bộ vùng chứa mà không bị biến dạng, mặc dù có thể bị cắt bớt nếu tỉ lệ không phù hợp.
        ),
      ),
    );
  }
}
