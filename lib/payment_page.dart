import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'my_receipt.dart'; // Import màn hình hóa đơn

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> orderedItems; // Danh sách mặt hàng đã đặt
  final double totalPrice; // Tổng giá trị đơn hàng

  const PaymentPage({
    super.key,
    required this.orderedItems, // Truyền danh sách mặt hàng từ màn hình trước
    required this.totalPrice, // Truyền tổng giá trị từ màn hình trước
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Quản lý trạng thái form nhập liệu
  String cardNumber = ''; // Lưu số thẻ tín dụng
  String expiryDate = ''; // Lưu ngày hết hạn
  String cardHolderName = ''; // Lưu tên chủ thẻ
  String cvvCode = ''; // Lưu mã CVV
  bool isCvvFocused = false; // Xác định xem người dùng đang nhập CVV hay không
  List<Map<String, dynamic>> selectedItems =
      []; // Lưu danh sách mặt hàng đã chọn

  /// Hàm xử lý khi người dùng nhấn nút thanh toán
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // Kiểm tra thông tin thẻ có hợp lệ không
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Xác nhận thanh toán"), // Tiêu đề hộp thoại
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"), // Hiển thị số thẻ
                Text("Expiry Date: $expiryDate"), // Hiển thị ngày hết hạn
                Text(
                    "Card Holder name: $cardHolderName"), // Hiển thị tên chủ thẻ
                Text("CVV: $cvvCode"), // Hiển thị CVV
              ],
            ),
          ),
          actions: [
            // Nút hủy bỏ
            TextButton(
              onPressed: () => Navigator.pop(context), // Đóng hộp thoại
              child: const Text("Hủy bỏ"),
            ),
            // Nút xác nhận
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng hộp thoại
                // Chuyển sang màn hình hóa đơn (MyReceipt)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyReceipt(
                      orderedItems:
                          widget.orderedItems, // Truyền danh sách mặt hàng
                      totalPrice: widget.totalPrice, // Truyền tổng giá trị
                    ),
                  ),
                );
              },
              child: const Text("ĐÚNG"),
            )
          ],
        ),
      );
    }
  }

  /// Hàm tính tổng giá trị đơn hàng (không cần thiết nếu tổng giá trị đã được truyền từ trước)
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in selectedItems) {
      // Duyệt qua danh sách mặt hàng đã chọn
      totalPrice += item['price']; // Cộng giá trị từng mặt hàng
    }
    return totalPrice; // Trả về tổng giá trị
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.surface, // Màu nền theo theme
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Thanh AppBar trong suốt
        title: const Text("Thanh toán"), // Tiêu đề "Checkout"
      ),
      body: Column(
        children: [
          // Widget hiển thị thẻ tín dụng
          CreditCardWidget(
            cardNumber: cardNumber, // Hiển thị số thẻ
            expiryDate: expiryDate, // Hiển thị ngày hết hạn
            cardHolderName: cardHolderName, // Hiển thị tên chủ thẻ
            cvvCode: cvvCode, // Hiển thị mã CVV
            showBackView: isCvvFocused, // Chuyển đổi mặt trước/sau khi nhập CVV
            onCreditCardWidgetChange: (p0) {}, // Không sử dụng callback này
          ),

          // Biểu mẫu nhập thông tin thẻ tín dụng
          CreditCardForm(
            cardNumber: cardNumber, // Dữ liệu số thẻ
            expiryDate: expiryDate, // Dữ liệu ngày hết hạn
            cardHolderName: cardHolderName, // Dữ liệu tên chủ thẻ
            cvvCode: cvvCode, // Dữ liệu mã CVV
            onCreditCardModelChange: (data) {
              setState(() {
                // Cập nhật trạng thái khi người dùng nhập
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey, // Form để kiểm tra tính hợp lệ
          ),

          const Spacer(), // Đẩy nút xuống cuối

          ElevatedButton(
            onPressed: userTappedPay, // Gọi hàm xử lý thanh toán khi nhấn nút
            child: const Text('Thanh toán ngay'), // Nội dung nút
          ),
        ],
      ),
    );
  }
}
