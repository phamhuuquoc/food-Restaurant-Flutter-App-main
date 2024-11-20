import 'package:flutter/material.dart'; // Nhập thư viện Flutter cơ bản
import '../../components/buttons/primary_button.dart'; // Nhập PrimaryButton tùy chỉnh từ thư mục components
import '../../components/welcome_text.dart'; // Nhập WelcomeText tùy chỉnh từ thư mục components
import '../../constants.dart'; // Nhập các hằng số từ file constants.dart
import 'number_verify_screen.dart'; // Nhập màn hình xác minh số điện thoại

class PghoneLoginScreen extends StatefulWidget {
  // StatefulWidget cho màn hình đăng nhập
  const PghoneLoginScreen({super.key}); // Khởi tạo PghoneLoginScreen với khóa

  @override
  State<PghoneLoginScreen> createState() =>
      _PghoneLoginScreenState(); // Tạo trạng thái cho màn hình này
}

class _PghoneLoginScreenState extends State<PghoneLoginScreen> {
  final _formKey =
      GlobalKey<FormState>(); // Khóa Form để xác thực các trường nhập liệu

  String? _phoneNumber; // Biến lưu trữ số điện thoại nhập vào

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold cung cấp cấu trúc cơ bản cho màn hình
      appBar: AppBar(
        // Thanh tiêu đề của màn hình
        title: const Text("Đăng nhập vào Gà rán"), // Tiêu đề của thanh AppBar
      ),
      body: SafeArea(
        // SafeArea đảm bảo rằng các widget không bị che khuất bởi các phần như thanh trạng thái
        child: Padding(
          // Padding để tạo khoảng cách từ các cạnh màn hình
          padding: const EdgeInsets.symmetric(
              horizontal:
                  defaultPadding), // Thêm padding ngang với giá trị mặc định
          child: Column(
            // Column để sắp xếp các widget theo chiều dọc
            crossAxisAlignment: CrossAxisAlignment
                .start, // Canh lề trái cho các widget trong Column
            children: [
              const WelcomeText(
                // Widget WelcomeText hiển thị lời chào
                title: "Bắt đầu với Gà rán", // Tiêu đề chào mừng
                text:
                    "Nhập số điện thoại của bạn để sử dụng Gà rán \nvà thưởng thức đồ ăn nhé :)", // Mô tả
              ),
              const SizedBox(
                  height: defaultPadding), // Khoảng cách giữa các widget
              Form(
                // Form cho phép xác thực và lưu trữ dữ liệu người dùng
                key: _formKey, // Khóa để kiểm tra và lưu dữ liệu form
                child: TextFormField(
                  // Trường nhập liệu cho số điện thoại
                  validator: phoneNumberValidator
                      .call, // Validator để kiểm tra tính hợp lệ của số điện thoại
                  autofocus:
                      true, // Trường nhập liệu tự động nhận focus khi mở màn hình
                  onSaved: (value) => _phoneNumber =
                      value, // Lưu giá trị của số điện thoại khi form được lưu
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          titleColor), // Thiết lập phong cách văn bản cho trường nhập liệu
                  cursorColor: primaryColor, // Màu của con trỏ khi nhập liệu
                  keyboardType:
                      TextInputType.phone, // Kiểu bàn phím là số điện thoại
                  decoration: const InputDecoration(
                    // Trang trí trường nhập liệu
                    hintText: "Số điện thoại", // Văn bản gợi ý
                    contentPadding:
                        kTextFieldPadding, // Padding cho nội dung của trường nhập liệu
                  ),
                ),
              ),
              const Spacer(), // Tạo khoảng trống giữa các phần tử trong Column
              // Nút đăng ký
              PrimaryButton(
                text: "Sign Up", // Văn bản hiển thị trên nút
                press: () {
                  // Hàm khi nhấn nút
                  if (_formKey.currentState!.validate()) {
                    // Kiểm tra tính hợp lệ của form
                    _formKey.currentState!
                        .save(); // Lưu dữ liệu của form vào biến
                    Navigator.push(
                      // Chuyển sang màn hình xác minh số điện thoại
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NumberVerifyScreen(),
                      ),
                    );
                  } else {
                    // Nếu form không hợp lệ, không làm gì cả
                  }
                },
              ),
              const SizedBox(
                  height:
                      defaultPadding), // Khoảng cách cuối cùng trước khi kết thúc Column
            ],
          ),
        ),
      ),
    );
  }
}
