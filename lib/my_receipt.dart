import 'package:flutter/material.dart'; // Import Flutter framework
import 'package:foodly_ui/screens/home/home_screen.dart'; // Import màn hình Home

// Widget MyReceipt, hiển thị hóa đơn sau khi đặt hàng
class MyReceipt extends StatelessWidget {
  // Các tham số để nhận danh sách mặt hàng đã đặt và tổng giá trị
  final List<Map<String, dynamic>> orderedItems;
  final double totalPrice;

  // Constructor với required để đảm bảo các tham số không null
  const MyReceipt({
    super.key,
    required this.orderedItems, // Danh sách các mặt hàng đã đặt
    required this.totalPrice, // Tổng giá trị đơn hàng
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Màu nền của màn hình
      body: Padding(
        padding: const EdgeInsets.all(25), // Padding toàn màn hình
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Căn giữa các phần tử theo chiều dọc
          children: [
            // Tiêu đề cảm ơn
            const Text(
              "Cảm ơn bạn đã đặt hàng!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink, // Màu hồng
              ),
            ),
            const SizedBox(height: 25), // Khoảng cách
            // Danh sách các mặt hàng đã đặt
            ListView.separated(
              shrinkWrap: true, // Đảm bảo kích thước tối ưu cho danh sách
              itemCount: orderedItems.length, // Số lượng mặt hàng
              separatorBuilder: (context, index) =>
                  const Divider(), // Đường kẻ giữa các mặt hàng
              itemBuilder: (context, index) {
                final item = orderedItems[index]; // Lấy mặt hàng hiện tại
                return ListTile(
                  title: Text(
                    item["title"], // Tên mặt hàng
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, // Chữ đậm
                    ),
                  ),
                  subtitle: Text(
                    "Price: \$${item["price"]}", // Giá của mặt hàng
                    style: const TextStyle(
                      fontStyle: FontStyle.italic, // Chữ nghiêng
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10), // Khoảng cách
            // Hiển thị tổng giá trị đơn hàng
            Text(
              "Total Price: \$${totalPrice.toStringAsFixed(2)}", // Tổng giá trị định dạng 2 chữ số thập phân
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, // Chữ đậm
              ),
            ),
            const SizedBox(height: 25), // Khoảng cách
            // Nút quay lại trang chủ
            ElevatedButton(
              onPressed: () {
                // Xử lý quay về màn hình Home
                if (!context.mounted) {
                  return; // Kiểm tra context đã mounted chưa
                }
                Route route = MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ); // Tạo route tới HomeScreen
                Navigator.pushReplacement(
                    context, route); // Chuyển màn hình và xóa màn hình hiện tại
              },
              child: const Text("Quay lại trang chủ"), // Nội dung nút
            ),
          ],
        ),
      ),
    );
  }
}
