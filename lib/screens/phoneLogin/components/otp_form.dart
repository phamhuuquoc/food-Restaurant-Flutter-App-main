import 'package:flutter/material.dart'; // Thư viện Flutter cơ bản
import 'package:foodly_ui/entry_point.dart'; // Nhập EntryPoint (sau khi xác minh OTP, người dùng được chuyển đến EntryPoint)
import 'package:form_field_validator/form_field_validator.dart'; // Thư viện validator để kiểm tra dữ liệu nhập vào các trường

import '../../../constants.dart'; // Nhập các hằng số từ file constants.dart

import '../../../components/buttons/primary_button.dart'; // Nhập PrimaryButton từ thư mục components

class OtpForm extends StatefulWidget {
  // OtpForm là widget dùng để nhập mã OTP
  const OtpForm({
    super.key,
  });

  @override
  _OtpFormState createState() =>
      _OtpFormState(); // Tạo state cho widget OtpForm
}

class _OtpFormState extends State<OtpForm> {
  final _formKey =
      GlobalKey<FormState>(); // Khóa toàn bộ form để quản lý việc xác thực

  FocusNode? _pin1Node; // Quản lý focus cho ô nhập OTP thứ 1
  FocusNode? _pin2Node; // Quản lý focus cho ô nhập OTP thứ 2
  FocusNode? _pin3Node; // Quản lý focus cho ô nhập OTP thứ 3
  FocusNode? _pin4Node; // Quản lý focus cho ô nhập OTP thứ 4

  @override
  void initState() {
    super.initState();
    _pin1Node = FocusNode(); // Khởi tạo các focus node
    _pin2Node = FocusNode();
    _pin3Node = FocusNode();
    _pin4Node = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _pin1Node!.dispose(); // Hủy các focus node khi không còn sử dụng
    _pin2Node!.dispose();
    _pin3Node!.dispose();
    _pin4Node!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // Form dùng để chứa và xác thực các trường nhập liệu
      key: _formKey,
      child: Column(
        // Column chứa các widget theo chiều dọc
        children: [
          Row(
            // Các ô nhập OTP sẽ được hiển thị ngang nhau
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Căn đều các ô nhập
            children: [
              // Ô nhập mã OTP thứ 1
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      _pin2Node!
                          .requestFocus(); // Tự động chuyển focus khi người dùng nhập 1 ký tự
                    }
                  },
                  validator: RequiredValidator(errorText: '')
                      .call, // Kiểm tra xem trường có trống không
                  autofocus: true,
                  maxLength: 1, // Chỉ cho phép 1 ký tự
                  focusNode: _pin1Node, // Gắn focus cho ô nhập
                  obscureText: true, // Ẩn ký tự khi nhập
                  keyboardType: TextInputType.number, // Chỉ cho phép nhập số
                  textAlign: TextAlign.center, // Căn giữa nội dung nhập
                  decoration:
                      otpInputDecoration, // Dùng một kiểu trang trí (decoration) đã định nghĩa trong constants.dart
                ),
              ),
              // Ô nhập mã OTP thứ 2
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      _pin3Node!
                          .requestFocus(); // Chuyển focus sang ô nhập OTP thứ 3
                    }
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin2Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              // Ô nhập mã OTP thứ 3
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      _pin4Node!
                          .requestFocus(); // Chuyển focus sang ô nhập OTP thứ 4
                    }
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin3Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              // Ô nhập mã OTP thứ 4
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      _pin4Node!
                          .unfocus(); // Dừng focus khi người dùng nhập xong
                    }
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin4Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
            ],
          ),
          const SizedBox(
              height: defaultPadding *
                  2), // Khoảng cách giữa ô nhập và nút tiếp theo
          // Nút "Continue" để tiếp tục quá trình
          PrimaryButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                // Kiểm tra nếu các ô nhập hợp lệ, thực hiện chuyển trang
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EntryPoint(), // Sau khi xác minh thành công, chuyển tới EntryPoint
                  ),
                );
              } else {}
            },
          )
        ],
      ),
    );
  }
}
