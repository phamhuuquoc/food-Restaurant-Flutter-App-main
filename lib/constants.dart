import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// Colors that we use in our app
// Định nghĩa màu sắc sử dụng trong ứng dụng
const titleColor = Color(0xFF010F07); // Màu sắc cho tiêu đề
const primaryColor = Color(0xffec0042); // Màu sắc chính
const accentColor = Color(0xFFcddafd); // Màu nhấn mạnh
const bodyTextColor = Color(0xFF868686); // Màu văn bản cơ thể
const inputColor = Color(0xFFFBFBFB); // Màu nền của input

const double defaultPadding = 16; // Khoảng cách mặc định cho các phần tử
const Duration kDefaultDuration = Duration(
    milliseconds:
        250); // Thời gian mặc định cho các chuyển động, ví dụ như animation

// Text Style for button text
const TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white, // Màu chữ là trắng
  fontSize: 14, // Kích thước chữ
  fontWeight: FontWeight.bold, // Định dạng chữ in đậm
);

// Padding cho TextField
const EdgeInsets kTextFieldPadding = EdgeInsets.symmetric(
  horizontal: defaultPadding, // Padding ngang
  vertical: defaultPadding, // Padding dọc
);

// Text Field Decoration
// Định nghĩa border và các thuộc tính cho TextField
const OutlineInputBorder kDefaultOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(6)), // Bo góc
  borderSide: BorderSide(
    color: Color(0xFFF3F2F2), // Màu của đường viền
  ),
);

// Định nghĩa decoration cho Input OTP
const InputDecoration otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.zero, // Không có padding bên trong
  counterText: "", // Không hiển thị số ký tự đã nhập
  errorStyle:
      TextStyle(height: 0), // Điều chỉnh lỗi text để không chiếm không gian
);

// Định nghĩa border khi có lỗi
const kErrorBorderSide =
    BorderSide(color: Colors.red, width: 1); // Màu đỏ cho border khi có lỗi

// Các validator cho các trường nhập liệu

// Validator cho mật khẩu (password)
final passwordValidator = MultiValidator([
  RequiredValidator(
      errorText:
          'Kiểm tra mật khẩu không được trống'), // Kiểm tra mật khẩu không được trống
  MinLengthValidator(8,
      errorText:
          'Mật khẩu phải có ít nhất 8 ký tự'), // Mật khẩu phải có ít nhất 8 ký tự
  PatternValidator(r'(?=.*?[#?!@$%^&*-/])',
      errorText:
          'Mật khẩu cần có ít nhất 1 ký tự đặc biệt') // Mật khẩu cần có ít nhất 1 ký tự đặc biệt
]);

// Validator cho email
final emailValidator = MultiValidator([
  RequiredValidator(
      errorText:
          'Kiểm tra email không được trống'), // Kiểm tra email không được trống
  EmailValidator(
      errorText:
          'Kiểm tra định dạng email hợp lệ') // Kiểm tra định dạng email hợp lệ
]);

// Validator cho trường bắt buộc
final requiredValidator = RequiredValidator(
    errorText:
        'Kiểm tra trường này không được trống'); // Kiểm tra trường này không được trống

// Validator cho mật khẩu xác nhận khớp
final matchValidator = MatchValidator(
    errorText:
        'Kiểm tra mật khẩu xác nhận khớp với mật khẩu chính'); // Kiểm tra mật khẩu xác nhận khớp với mật khẩu chính

// Validator cho số điện thoại
final phoneNumberValidator = MinLengthValidator(10,
    errorText:
        'Kiểm tra số điện thoại có ít nhất 10 chữ số'); // Kiểm tra số điện thoại có ít nhất 10 chữ số

// Văn bản chung "Or"
final Center kOrText = Center(
    child: Text("Or",
        style: TextStyle(
            color:
                titleColor.withOpacity(0.7))) // Văn bản "Or" với màu sắc nhạt
    );
