import 'package:flutter/material.dart'; // Thư viện Flutter để xây dựng giao diện người dùng
import '../../../components/section_title.dart'; // Import widget SectionTitle từ thư mục components
import '../../../constants.dart'; // Import các hằng số và giá trị mặc định

// Widget PriceRange hiển thị một dải mức giá có thể lựa chọn
class PriceRange extends StatelessWidget {
  const PriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Sử dụng Column để xếp các phần tử theo chiều dọc
      crossAxisAlignment:
          CrossAxisAlignment.start, // Canh chỉnh các phần tử bên trái
      children: [
        // SectionTitle hiển thị tiêu đề cho phần dải mức giá
        SectionTitle(
          title: "Phạm vi giá", // Tiêu đề là "Price Range"
          press:
              () {}, // Xử lý sự kiện khi người dùng nhấn vào tiêu đề (chưa định nghĩa hành động)
          isMainSection:
              false, // Đặt thuộc tính này là false, vì đây không phải là phần chính
        ),
        const SizedBox(
            height:
                defaultPadding), // Khoảng cách giữa SectionTitle và phần tiếp theo
        SingleChildScrollView(
          // Cho phép cuộn ngang dải mức giá
          scrollDirection: Axis.horizontal, // Thiết lập hướng cuộn ngang
          child: Row(
            // Các mức giá sẽ được sắp xếp theo hàng ngang
            children: [
              const SizedBox(width: defaultPadding), // Khoảng cách bên trái
              ...List.generate(
                // Tạo ra một danh sách các nút mức giá
                // Ở đây tôi sử dụng độ dài = 0 (chỉ là ví dụ, cần thay đổi số lượng mức giá thật)
                0, // Số lượng các mức giá (chưa xác định)
                (index) => Padding(
                  // Tạo một Padding cho mỗi mức giá
                  padding: const EdgeInsets.only(
                      right: defaultPadding), // Khoảng cách giữa các nút
                  child: RoundedButton(
                    // Gọi widget RoundedButton để tạo nút
                    index:
                        index, // Chỉ số của nút (dùng để xác định giá trị mức giá)
                    isActive:
                        index == 2, // Chỉ định mức giá thứ 3 là "được chọn"
                    press: () {}, // Sự kiện khi nhấn vào nút (chưa xử lý)
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// Widget RoundedButton dùng để tạo các nút có dạng tròn cho mức giá
class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.isActive = false, // Biến để kiểm tra nếu nút này đang được chọn
    required this.index, // Chỉ số của nút
    required this.press, // Sự kiện khi nhấn vào nút
  });

  final bool isActive; // Biến xác định nút có được chọn hay không
  final int index; // Chỉ số của nút
  final VoidCallback press; // Sự kiện khi nhấn nút

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Sử dụng SizedBox để định nghĩa kích thước cho nút
      height: 56, // Chiều cao của nút
      width: 56, // Chiều rộng của nút
      child: ElevatedButton(
        // Tạo nút ElevatedButton
        style: ElevatedButton.styleFrom(
          // Định nghĩa kiểu cho nút
          padding: EdgeInsets.zero, // Không có padding bên trong nút
          backgroundColor: isActive
              ? primaryColor
              : inputColor, // Màu nền của nút, nếu được chọn thì dùng primaryColor
          shape: RoundedRectangleBorder(
            // Đặt hình dạng của nút thành tròn
            borderRadius: BorderRadius.circular(100), // Đặt bán kính bo tròn
            side: BorderSide(
                // Đặt viền cho nút
                color: isActive
                    ? primaryColor
                    : bodyTextColor.withOpacity(0.1)), // Đặt màu viền
          ),
        ),
        onPressed: press, // Gọi sự kiện khi nhấn vào nút
        child: Text(
          // Văn bản trên nút (hiển thị mức giá)
          "\$" *
              (index +
                  1), // Dùng ký tự "$" lặp lại theo chỉ số của nút, ví dụ \$ cho index = 0, \$\$ cho index = 1, vv
          style: TextStyle(
            fontWeight: FontWeight.normal, // Đặt kiểu font cho văn bản
            color: isActive
                ? Colors.white
                : titleColor, // Màu sắc văn bản, nếu nút được chọn thì màu trắng
            fontSize: 14, // Kích thước chữ
          ),
        ),
      ),
    );
  }
}
