import 'package:firebase_auth/firebase_auth.dart'; // Nhập Firebase Auth để quản lý xác thực người dùng
import 'package:flutter/material.dart'; // Nhập các widget cơ bản của Flutter
import 'package:flutter_svg/svg.dart'; // Nhập thư viện để sử dụng SVG icons
import 'package:foodly_ui/constants.dart'; // Nhập các giá trị và hằng số đã định nghĩa
import 'package:foodly_ui/screens/auth/sign_in_screen.dart'; // Màn hình đăng nhập
import 'package:foodly_ui/screens/profile/order_history_screen.dart'; // Màn hình lịch sử đơn hàng

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Đảm bảo không bị che khuất bởi các phần hệ thống của màn hình
      child: SingleChildScrollView(
        // Đảm bảo rằng nội dung có thể cuộn nếu không đủ chỗ
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding), // Đặt padding theo chiều ngang
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Căn chỉnh các widget theo chiều ngang bắt đầu từ bên trái
            children: [
              const SizedBox(height: defaultPadding), // Khoảng cách phía trên
              Text("Cài đặt tài khoản",
                  style: Theme.of(context).textTheme.headlineMedium), // Tiêu đề
              Text("Cập nhật thông tin đơn hàng của bạn.",
                  style: Theme.of(context).textTheme.bodyMedium), // Mô tả
              const SizedBox(height: 16), // Khoảng cách
              // ProfileMenuCard: Hiển thị các mục trong menu
              ProfileMenuCard(
                svgSrc: "assets/icons/order.svg", // Chỉ định icon SVG
                title: "Lịch sử đặt hàng của bạn", // Tiêu đề
                subTitle: "Theo dõi tình trạng giao đồ ăn.", // Mô tả phụ
                press: () {
                  // Xử lý khi người dùng nhấn vào mục
                  Navigator.push(
                    // Chuyển đến màn hình Lịch sử Đặt hàng
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderHistoryScreen(),
                    ),
                  );
                },
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/share.svg", // Chỉ định icon SVG
                title: "Đăng xuất", // Tiêu đề
                subTitle: "Nhấp vào đây khi bạn muốn đăng xuất", // Mô tả phụ
                press: () async {
                  // Xử lý khi người dùng nhấn vào mục
                  await FirebaseAuth.instance.signOut(); // Đăng xuất người dùng
                  if (!context.mounted) {
                    return; // Kiểm tra xem widget có còn được hiển thị không
                  }
                  Route route = MaterialPageRoute(
                      builder: (context) =>
                          const SignInScreen()); // Chuyển đến màn hình đăng nhập
                  Navigator.pushReplacement(context,
                      route); // Thay thế màn hình hiện tại bằng màn hình đăng nhập
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget ProfileMenuCard hiển thị từng mục trong cài đặt tài khoản
class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    super.key,
    this.title,
    this.subTitle,
    this.svgSrc,
    this.press,
  });

  final String? title,
      subTitle,
      svgSrc; // Các tham số cho tiêu đề, mô tả và icon
  final VoidCallback? press; // Callback khi nhấn vào card

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: defaultPadding / 2), // Đặt padding giữa các mục
      child: InkWell(
        // Để có hiệu ứng khi nhấn vào card
        borderRadius: const BorderRadius.all(
            Radius.circular(8)), // Đặt góc bo tròn cho card
        onTap: press, // Xử lý sự kiện nhấn
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 5), // Padding cho phần bên trong của card
          child: Row(
            // Sử dụng Row để sắp xếp các widget theo chiều ngang
            children: [
              SvgPicture.asset(
                // Hiển thị icon SVG
                svgSrc!,
                height: 24,
                width: 24,
                color: titleColor.withOpacity(0.64), // Đặt màu cho icon
              ),
              const SizedBox(width: 8), // Khoảng cách giữa icon và text
              Expanded(
                child: Column(
                  // Dùng Column để xếp tiêu đề và mô tả theo chiều dọc
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Căn chỉnh các widget bên trong theo chiều ngang
                  children: [
                    Text(
                      title!, // Tiêu đề
                      maxLines: 1, // Giới hạn số dòng
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge, // Áp dụng style cho tiêu đề
                    ),
                    const SizedBox(
                        height: 8), // Khoảng cách giữa tiêu đề và mô tả
                    Text(
                      subTitle!, // Mô tả phụ
                      maxLines: 1, // Giới hạn số dòng
                      style: TextStyle(
                        fontSize: 14,
                        color: titleColor
                            .withOpacity(0.54), // Áp dụng màu cho mô tả
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8), // Khoảng cách bên phải
              const Icon(
                Icons
                    .arrow_forward_ios_outlined, // Icon mũi tên chỉ về phía bên phải
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
