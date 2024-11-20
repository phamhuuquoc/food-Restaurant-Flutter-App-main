import 'package:flutter/material.dart'; // Thư viện Flutter để xây dựng giao diện người dùng
import '../../../components/section_title.dart'; // Import widget SectionTitle từ thư mục components
import '../../../constants.dart'; // Import các hằng số và giá trị mặc định

// Widget Dietaries hiển thị các chế độ ăn kiêng
class Dietaries extends StatefulWidget {
  const Dietaries({
    super.key,
  }); // Khởi tạo widget Dietaries

  @override
  _DietariesState createState() =>
      _DietariesState(); // Trả về trạng thái của widget Dietaries
}

class _DietariesState extends State<Dietaries> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // Sử dụng Column để xếp các phần tử theo chiều dọc
      crossAxisAlignment:
          CrossAxisAlignment.start, // Canh chỉnh các phần tử bên trái
      children: [
        // SectionTitle hiển thị tiêu đề cho phần chế độ ăn kiêng
        SectionTitle(
          title: "Chế độ ăn uống", // Tiêu đề là "Dietary"
          press:
              () {}, // Xử lý sự kiện khi người dùng nhấn vào tiêu đề (chưa định nghĩa hành động)
          isMainSection:
              false, // Đặt thuộc tính này là false, vì đây không phải là phần chính
        ),
        const SizedBox(
            height:
                defaultPadding), // Khoảng cách giữa SectionTitle và phần tiếp theo
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20), // Padding bên trái và phải cho phần bên trong
          child: Wrap(
            // Dùng Wrap để sắp xếp các nút một cách linh hoạt
            spacing: 10, // Khoảng cách giữa các nút
            children: List.generate(
              // Tạo ra một danh sách các nút từ dữ liệu demoDietaries
              demoDietaries
                  .length, // Số lượng phần tử trong danh sách demoDietaries
              (index) => ElevatedButton(
                // Mỗi phần tử trong danh sách sẽ là một ElevatedButton
                onPressed: () {}, // Chưa xử lý sự kiện khi nhấn nút
                style: ElevatedButton.styleFrom(
                  // Tạo kiểu cho nút
                  minimumSize:
                      const Size(56, 40), // Kích thước tối thiểu của nút
                  backgroundColor: index == 1
                      ? primaryColor
                      : bodyTextColor, // Màu nền của nút, nếu là phần tử thứ 1 thì dùng primaryColor
                ),
                child: Text(demoDietaries[index]
                    ["title"]), // Văn bản của nút là tiêu đề chế độ ăn kiêng
              ),
            ),
          ),
        )
      ],
    );
  }

  // Dữ liệu giả lập cho các chế độ ăn kiêng
  List<Map<String, dynamic>> demoDietaries = [
    {"title": "Any", "isActive": false}, // Chế độ ăn kiêng "Any"
  ];
}
