import 'package:flutter/material.dart';
import 'package:foodly_ui/constants.dart';
import 'package:foodly_ui/my_receipt.dart';
import 'package:foodly_ui/payment_page.dart';

class OrderDetailsScreen extends StatefulWidget {
  // Nhận các tham số từ màn hình trước
  final double totalPrice; // Tổng giá ban đầu
  final List<Map<String, dynamic>>
      selectedItems; // Danh sách các mặt hàng đã chọn

  const OrderDetailsScreen({
    super.key,
    required this.totalPrice, // Khởi tạo tổng giá từ tham số
    required this.selectedItems, // Khởi tạo danh sách mặt hàng đã chọn
  });

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int itemCount = 1; // Biến dùng để lưu số lượng mặt hàng
  late double totalPrice =
      widget.totalPrice; // Tổng giá được gán từ tham số widget
  late List<Map<String, dynamic>> selectedItems =
      widget.selectedItems; // Danh sách mặt hàng đã chọn

  @override
  Widget build(BuildContext context) {
    // Giao diện chính của màn hình
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đơn đặt hàng của bạn"), // Tiêu đề AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              // Hiển thị tổng giá
              Text(
                "Tổng giá: \$${totalPrice.toStringAsFixed(0)}", // Làm tròn tổng giá đến 2 chữ số thập phân
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: defaultPadding * 2),

              // Hiển thị danh sách mặt hàng
              ListView.builder(
                shrinkWrap: true, // Để ListView không chiếm toàn bộ chiều cao
                physics:
                    const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn riêng
                itemCount: selectedItems.length, // Số lượng mặt hàng
                itemBuilder: (context, index) {
                  final item =
                      selectedItems[index]; // Lấy từng mục trong danh sách
                  final price = item["price"] as double; // Giá của mặt hàng

                  return ListTile(
                    title: Row(
                      children: [
                        Text(item["title"]), // Hiển thị tên mặt hàng
                        const Spacer(), // Khoảng cách giữa tên và các nút

                        // Nút giảm số lượng
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (itemCount == 1) {
                                // Nếu số lượng = 1, xóa mục khỏi danh sách
                                selectedItems.removeWhere(
                                    (i) => i['title'] == item['title']);
                                totalPrice -= price; // Giảm tổng giá
                              } else {
                                // Nếu số lượng > 1, chỉ giảm số lượng
                                itemCount -= 1;
                                totalPrice -= price; // Cập nhật tổng giá
                              }
                            });
                          },
                        ),

                        // Hiển thị số lượng
                        Text('$itemCount'),

                        // Nút tăng số lượng
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              itemCount += 1; // Tăng số lượng
                              totalPrice += price; // Cập nhật tổng giá
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Nút chuyển đến trang thanh toán
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        orderedItems:
                            selectedItems, // Truyền danh sách mặt hàng
                        totalPrice: totalPrice, // Truyền tổng giá
                      ),
                    ),
                  );
                },
                child: const Text("Đi tới Thanh toán"),
              ),

              const SizedBox(height: defaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }
}
