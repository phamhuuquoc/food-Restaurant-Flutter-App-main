import 'package:flutter/material.dart'; // Thư viện Flutter để xây dựng giao diện người dùng
import '../../../components/section_title.dart'; // Import widget SectionTitle từ thư mục components
import '../../../constants.dart'; // Import các hằng số và giá trị mặc định

// Widget Categories hiển thị danh mục các món ăn
class Categories extends StatefulWidget {
  const Categories({
    super.key,
  }); // Khởi tạo widget Categories

  @override
  _CategoriesState createState() =>
      _CategoriesState(); // Trả về trạng thái của widget Categories
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // Sử dụng Column để xếp các phần tử theo chiều dọc
      crossAxisAlignment:
          CrossAxisAlignment.start, // Canh chỉnh các phần tử bên trái
      children: [
        // SectionTitle hiển thị tiêu đề cho phần danh mục
        SectionTitle(
          title: "Thể loại", // Tiêu đề là "Categories"
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
              horizontal:
                  defaultPadding), // Padding bên trái và phải cho phần bên trong
          child: Wrap(
            // Dùng Wrap để sắp xếp các nút một cách linh hoạt
            spacing: defaultPadding / 2, // Khoảng cách giữa các nút
            children: List.generate(
              // Tạo ra một danh sách các nút từ dữ liệu demoCategories
              demoCategories
                  .length, // Số lượng phần tử trong danh sách demoCategories
              (index) => ElevatedButton(
                // Mỗi phần tử trong danh sách sẽ là một ElevatedButton
                onPressed: () {}, // Chưa xử lý sự kiện khi nhấn nút
                style: ElevatedButton.styleFrom(
                  // Tạo kiểu cho nút
                  minimumSize:
                      const Size(56, 40), // Kích thước tối thiểu của nút
                  backgroundColor: index == 2
                      ? primaryColor
                      : bodyTextColor, // Màu nền của nút, nếu là phần tử thứ 2 thì dùng primaryColor
                ),
                child: Text(demoCategories[index]
                    ["title"]), // Văn bản của nút là tiêu đề danh mục
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Dữ liệu giả lập cho các danh mục
  List<Map<String, dynamic>> demoCategories = [
    {"title": "Tất cả", "isActive": false}, // Danh mục "All"
    {"title": "Gà rán", "isActive": false}, // Danh mục "Fried Chicken"
  ];
}
