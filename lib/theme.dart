import 'package:flutter/material.dart'; // Thư viện giao diện Flutter
import 'constants.dart'; // File chứa các hằng số (như màu sắc, kích thước)

ThemeData buildThemeData() {
  return ThemeData(
    // Màu chính của ứng dụng
    primaryColor: accentColor,

    // Màu nền mặc định cho Scaffold (màn hình chính)
    scaffoldBackgroundColor: Colors.white,

    // Font chữ mặc định của ứng dụng
    fontFamily: "SF Pro Text",

    // Thiết lập giao diện cho AppBar
    appBarTheme: const AppBarTheme(
      color: Colors.white, // Màu nền của AppBar
      elevation: 0, // Không có đổ bóng (phẳng)
      centerTitle: true, // Căn giữa tiêu đề AppBar
      iconTheme:
          IconThemeData(color: Colors.black), // Màu của các biểu tượng (Icons)
    ),

    // Giao diện mặc định cho các ô nhập liệu (TextField, FormField)
    inputDecorationTheme: inputDecorationTheme,

    // Giao diện mặc định cho các nút bấm
    buttonTheme: buttonThemeData,

    // Điều chỉnh mật độ hiển thị giao diện tùy theo nền tảng
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// Giao diện mặc định cho các ô nhập liệu
final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  fillColor: inputColor, // Màu nền của ô nhập liệu
  filled: true, // Hiển thị màu nền cho ô nhập liệu

  // Padding mặc định bên trong ô nhập liệu
  contentPadding: const EdgeInsets.all(defaultPadding),

  // Viền mặc định của ô nhập liệu
  border: kDefaultOutlineInputBorder,

  // Viền khi ô nhập liệu được kích hoạt nhưng chưa có tiêu điểm
  enabledBorder: kDefaultOutlineInputBorder,

  // Viền khi ô nhập liệu được lấy tiêu điểm
  focusedBorder: kDefaultOutlineInputBorder.copyWith(
      borderSide: BorderSide(
    color: primaryColor.withOpacity(0.5), // Màu viền khi lấy tiêu điểm
  )),

  // Viền khi ô nhập liệu có lỗi
  errorBorder: kDefaultOutlineInputBorder.copyWith(
    borderSide: kErrorBorderSide, // Sử dụng màu viền lỗi được định nghĩa trước
  ),

  // Viền khi ô nhập liệu có lỗi và được lấy tiêu điểm
  focusedErrorBorder: kDefaultOutlineInputBorder.copyWith(
    borderSide: kErrorBorderSide, // Sử dụng màu viền lỗi được định nghĩa trước
  ),
);

// Giao diện mặc định cho các nút bấm
const ButtonThemeData buttonThemeData = ButtonThemeData(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8))), // Bo góc nút bấm
);
