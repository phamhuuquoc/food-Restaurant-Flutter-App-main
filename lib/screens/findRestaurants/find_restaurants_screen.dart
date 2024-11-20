import 'package:flutter/material.dart'; // Thư viện Flutter cho giao diện người dùng
import 'package:flutter_svg/flutter_svg.dart'; // Thư viện cho phép sử dụng các biểu tượng SVG
import 'package:foodly_ui/entry_point.dart'; // Import màn hình EntryPoint
import '../../components/buttons/secondery_button.dart'; // Import nút thứ cấp
import '../../components/welcome_text.dart'; // Import văn bản chào mừng
import '../../constants.dart'; // Import các hằng số (như padding, màu sắc)

// Màn hình "FindRestaurantsScreen" cho phép người dùng tìm kiếm nhà hàng gần mình
class FindRestaurantsScreen extends StatelessWidget {
  const FindRestaurantsScreen({super.key}); // Constructor của màn hình

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold là cấu trúc cơ bản của một màn hình trong Flutter
      appBar: AppBar(
        // Thanh tiêu đề với nút đóng
        leading: IconButton(
          icon: const Icon(Icons.close), // Biểu tượng đóng
          onPressed: () {
            // Khi nhấn nút đóng, điều hướng về màn hình EntryPoint
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EntryPoint(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        // SafeArea để tránh các vùng bị che khuất bởi thanh trạng thái hoặc các yếu tố khác
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding), // Padding cho nội dung
          child: Column(
            // Cột chứa các phần tử
            crossAxisAlignment:
                CrossAxisAlignment.start, // Các phần tử căn lề trái
            children: [
              const WelcomeText(
                // Văn bản chào mừng, giải thích cách tìm nhà hàng
                title: "Tìm nhà hàng gần bạn ",
                text:
                    "Vui lòng nhập vị trí của bạn hoặc cho phép truy cập vào \nvị trí của bạn để tìm nhà hàng gần bạn.",
              ),

              // Nút "Use current location"
              SeconderyButton(
                press: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Căn giữa các phần tử trong hàng
                  children: [
                    SvgPicture.asset(
                      "assets/icons/location.svg", // Biểu tượng vị trí
                      height: 24,
                      color: primaryColor, // Màu biểu tượng
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Use current location", // Văn bản đi kèm biểu tượng
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: defaultPadding), // Khoảng cách giữa các phần tử

              // Form nhập địa chỉ mới
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      // onSaved: (value) => _location = value,  // Lưu giá trị địa chỉ
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: titleColor), // Kiểu chữ cho ô nhập
                      cursorColor: primaryColor, // Màu con trỏ
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/marker.svg", // Biểu tượng marker
                            colorFilter: const ColorFilter.mode(bodyTextColor,
                                BlendMode.srcIn), // Áp dụng màu cho biểu tượng
                          ),
                        ),
                        hintText: "Nhập địa chỉ mới", // Văn bản gợi ý
                        contentPadding: kTextFieldPadding, // Padding cho ô nhập
                      ),
                    ),
                    const SizedBox(height: defaultPadding), // Khoảng cách
                    ElevatedButton(
                      onPressed: () {
                        // Khi nhấn nút "Continue", điều hướng về EntryPoint
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EntryPoint(),
                          ),
                        );
                      },
                      child: const Text("Tiếp tục"), // Nút "Continue"
                    ),
                  ],
                ),
              ),

              const SizedBox(height: defaultPadding), // Khoảng cách dưới cùng
            ],
          ),
        ),
      ),
    );
  }
}
