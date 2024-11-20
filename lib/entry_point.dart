import 'package:flutter/cupertino.dart'; // Gói cung cấp các widget phong cách iOS.
import 'package:flutter/material.dart'; // Gói cung cấp widget phong cách Material Design.
import 'package:flutter_svg/flutter_svg.dart'; // Hỗ trợ hiển thị file SVG.
import 'constants.dart'; // Tệp chứa các hằng số chung (như màu sắc, kích thước).
import 'screens/home/home_screen.dart'; // Màn hình chính (Home).
import 'screens/orderDetails/order_details_screen.dart'; // Màn hình chi tiết đơn hàng.
import 'screens/profile/profile_screen.dart'; // Màn hình thông tin cá nhân.
import 'screens/search/search_screen.dart'; // Màn hình tìm kiếm.

/// EntryPoint là widget chính quản lý điều hướng giữa các màn hình thông qua một Bottom Navigation Bar.
class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  _EntryPointState createState() => _EntryPointState();
}

/// State của EntryPoint quản lý trạng thái của Bottom Navigation Bar.
class _EntryPointState extends State<EntryPoint> {
  // Chỉ số của tab đang được chọn (ban đầu là tab đầu tiên).
  int _selectedIndex = 0;

  // Danh sách các mục của thanh điều hướng.
  final List<Map<String, dynamic>> _navitems = [
    {"icon": "assets/icons/home.svg", "title": "Trang chủ"}, // Tab Home
    {"icon": "assets/icons/search.svg", "title": "Tìm kiếm"}, // Tab Search
    {"icon": "assets/icons/order.svg", "title": "Đơn hàng"}, // Tab Orders
    {"icon": "assets/icons/profile.svg", "title": "Hồ sơ"}, // Tab Profile
  ];

  // Danh sách các màn hình tương ứng với mỗi tab.
  final List<Widget> _screens = [
    const HomeScreen(), // Màn hình chính.
    const SearchScreen(), // Màn hình tìm kiếm.
    const OrderDetailsScreen(
        // Màn hình chi tiết đơn hàng.
        totalPrice: 0, // Tổng giá trị ban đầu (có thể cập nhật).
        selectedItems: []), // Danh sách các sản phẩm được chọn (rỗng ban đầu).
    const ProfileScreen(), // Màn hình thông tin cá nhân.
  ];

  @override
  Widget build(BuildContext context) {
    // Cấu trúc của widget hiển thị.
    return Scaffold(
      body: _screens[
          _selectedIndex], // Hiển thị màn hình tương ứng với tab đã chọn.
      bottomNavigationBar: CupertinoTabBar(
        // Thanh điều hướng ở cuối màn hình.
        onTap: (value) {
          // Sự kiện khi người dùng nhấn vào một tab.
          setState(() {
            _selectedIndex = value; // Cập nhật chỉ số tab được chọn.
          });
        },
        currentIndex: _selectedIndex, // Tab hiện tại đang được chọn.
        activeColor: primaryColor, // Màu của biểu tượng/tab được chọn.
        inactiveColor: bodyTextColor, // Màu của biểu tượng/tab chưa được chọn.
        items: List.generate(
          // Tạo danh sách các mục trong thanh điều hướng.
          _navitems.length, // Số lượng mục tương ứng với danh sách `_navitems`.
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              // Hiển thị biểu tượng SVG.
              _navitems[index]["icon"], // Đường dẫn tới file SVG của tab.
              height: 30, // Chiều cao biểu tượng.
              width: 30, // Chiều rộng biểu tượng.
              colorFilter: ColorFilter.mode(
                  // Thay đổi màu sắc biểu tượng dựa trên trạng thái.
                  index == _selectedIndex
                      ? primaryColor
                      : bodyTextColor, // Màu khi tab được chọn/chưa chọn.
                  BlendMode.srcIn), // Chế độ hòa trộn màu.
            ),
            label: _navitems[index]["title"], // Văn bản hiển thị tên tab.
          ),
        ),
      ),
    );
  }
}
