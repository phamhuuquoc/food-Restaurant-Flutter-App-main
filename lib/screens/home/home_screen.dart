import 'dart:convert'; // Gói để xử lý JSON.
import 'package:firebase_auth/firebase_auth.dart'; // Sử dụng để xác thực người dùng Firebase.
import 'package:flutter/material.dart'; // Gói Material Design.
import 'package:http/http.dart' as http; // Thư viện gửi yêu cầu HTTP.
import 'package:location/location.dart'; // Gói hỗ trợ lấy vị trí người dùng.
import '../../components/cards/big/big_card_image_slide.dart'; // Component hiển thị ảnh dạng slide.
import '../../components/cards/big/restaurant_info_big_card.dart'; // Component hiển thị thông tin nhà hàng.
import '../../components/section_title.dart'; // Component hiển thị tiêu đề.
import '../../constants.dart'; // Tệp chứa các hằng số chung.
import '../../demoData.dart'; // Dữ liệu demo.
import '../details/details_screen.dart'; // Màn hình chi tiết nhà hàng.
import '../featured/featurred_screen.dart'; // Màn hình đối tác nổi bật.
import 'components/medium_card_list.dart'; // Component danh sách thẻ cỡ trung.
import 'components/promotion_banner.dart'; // Component banner quảng cáo.

/// HomeScreen là widget chính hiển thị giao diện trang chủ.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String locationStr = "Đang tải..."; // Chuỗi hiển thị vị trí.
  late Location location; // Đối tượng quản lý vị trí.

  @override
  void initState() {
    super.initState();
    location = Location(); // Khởi tạo đối tượng Location.
    requestLocation(); // Yêu cầu lấy vị trí người dùng.
  }

  /// Hàm lấy vị trí hiện tại của người dùng.
  void requestLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    // Kiểm tra và yêu cầu bật dịch vụ vị trí.
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return; // Thoát nếu dịch vụ không được bật.
      }
    }

    // Kiểm tra và yêu cầu quyền truy cập vị trí.
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return; // Thoát nếu quyền bị từ chối.
      }
    }

    // Lấy vị trí hiện tại.
    locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) async {
      double? lat = currentLocation.latitude; // Lấy vĩ độ.
      double? lon = currentLocation.longitude; // Lấy kinh độ.
      if (lat == null || lon == null) {
        return; // Nếu không lấy được vị trí, thoát.
      }

      // Gọi API để tìm địa chỉ từ tọa độ.
      String newLocation = await reverseSearchLocation(lat, lon);
      if (mounted) {
        // Nếu widget còn tồn tại, cập nhật trạng thái.
        setState(() {
          locationStr = newLocation;
        });
      }
    });
  }

  /// Hàm tìm kiếm ngược địa chỉ từ tọa độ.
  Future<String> reverseSearchLocation(double lat, double lon) async {
    try {
      // Gửi yêu cầu tới API Nominatim để lấy thông tin địa chỉ.
      http.Response res = await http.get(
        Uri.parse(
            "https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lon&format=jsonv2&accept-language=vi"),
        headers: {'Accept-Language': 'vi'}, // Yêu cầu phản hồi bằng tiếng Việt.
      );

      // Kiểm tra phản hồi thành công.
      if (res.statusCode == 200) {
        dynamic json = jsonDecode(res.body); // Giải mã JSON từ phản hồi.
        String city = json['address']['city'] ??
            "Thành phố không xác định"; // Lấy tên thành phố.
        return city; // Trả về tên thành phố.
      } else {
        return "Không thể tải vị trí"; // Lỗi phản hồi.
      }
    } catch (e) {
      return "Error: $e"; // Xử lý lỗi.
    }
  }

  @override
  void dispose() {
    location.onLocationChanged
        .drain(); // Hủy đăng ký lắng nghe vị trí khi widget bị hủy.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9999.0), // Bo góc ảnh đại diện.
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                FirebaseAuth.instance.currentUser?.photoURL ??
                    'https://scontent.fsgn15-1.fna.fbcdn.net/v/t39.30808-6/457133595_1117809013101704_658581424721644739_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHipLYzJesXdD3on4qnBcBKsVG_jzLnB66xUb-PMucHrofAKMmFKDy2j0948UzDt5K1CrEoI1L4Pv5eTUinz0Yi&_nc_ohc=SwAoElEUp2QQ7kNvgFiIXr6&_nc_zt=23&_nc_ht=scontent.fsgn15-1.fna&_nc_gid=AIuhJHVrQCoPwII2SSB_-34&oh=00_AYCIMx3Gpv-3-R7c7WkbNtPH7nRWmJ_5ckANx4aylRit6Q&oe=6740074D',
              ),
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              "Giao hàng đến".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: primaryColor), // Tiêu đề "Giao hàng đến".
            ),
            Text(
              locationStr, // Hiển thị vị trí người dùng.
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child:
                    BigCardImageSlide(images: demoBigImages), // Slide ảnh lớn.
              ),
              const SizedBox(height: defaultPadding * 2),
              SectionTitle(
                title: "Đối tác nổi bật",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const FeaturedScreen(), // Chuyển đến màn hình nổi bật.
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              const MediumCardList(), // Danh sách thẻ cỡ trung.
              const SizedBox(height: 20),
              const PromotionBanner(), // Banner quảng cáo.
              const SizedBox(height: 20),
              SectionTitle(
                title: "Lựa chọn tốt nhất",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeaturedScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const MediumCardList(), // Danh sách thẻ cỡ trung.
              const SizedBox(height: 20),
              SectionTitle(title: "Tất cả nhà hàng", press: () {}),
              const SizedBox(height: 16),
              // Danh sách thẻ thông tin nhà hàng lớn.
              Column(
                children: demoRestaurantNames.map((name) {
                  int index = demoRestaurantNames.indexOf(name);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(
                        defaultPadding, 0, defaultPadding, defaultPadding),
                    child: RestaurantInfoBigCard(
                      images: demoBigImages, // Danh sách ảnh nhà hàng.
                      name: name, // Tên nhà hàng.
                      rating: 4.3, // Đánh giá.
                      numOfRating: 200, // Số lượt đánh giá.
                      deliveryTime: 25, // Thời gian giao hàng.
                      foodType: const ["Hàn Quốc"], // Loại thức ăn.
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DetailsScreen(), // Chuyển đến màn hình chi tiết.
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
