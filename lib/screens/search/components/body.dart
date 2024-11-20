import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; // Thư viện để sử dụng icon SVG
import 'package:foodly_ui/constants.dart'; // Các giá trị hằng số được định nghĩa trong ứng dụng
import '../../../components/cards/big/restaurant_info_big_card.dart'; // Card hiển thị thông tin nhà hàng
import '../../../components/scalton/big_card_scalton.dart'; // Skeleton card để hiển thị khi dữ liệu đang tải
import '../../../demoData.dart'; // Dữ liệu mẫu cho các nhà hàng

class Body extends StatefulWidget {
  const Body({super.key}); // Khởi tạo Body widget với key

  @override
  _BodyState createState() => _BodyState(); // Khởi tạo state cho Body widget
}

class _BodyState extends State<Body> {
  final _formKey =
      GlobalKey<FormState>(); // Khóa form để xác thực dữ liệu nhập vào

  bool _showSearchResult =
      false; // Biến kiểm tra có hiển thị kết quả tìm kiếm hay không
  bool _isLoading =
      true; // Biến kiểm tra trạng thái loading (dữ liệu đang được tải)

  @override
  void initState() {
    super.initState();
    // Mô phỏng thời gian tải dữ liệu (sau 1 giây, chuyển sang trạng thái không loading)
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false; // Kết thúc trạng thái loading
      });
    });
  }

  // Hàm xử lý hiển thị kết quả tìm kiếm sau khi người dùng nhập từ khóa
  void showResult() {
    setState(() {
      _isLoading = true; // Set trạng thái loading khi bắt đầu tìm kiếm
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSearchResult = true; // Hiển thị kết quả tìm kiếm
        _isLoading = false; // Tắt trạng thái loading
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding), // Padding cho màn hình
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Tìm kiếm',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium), // Tiêu đề "Search"
            const SizedBox(height: defaultPadding),
            buildSearchForm(), // Form tìm kiếm
            const SizedBox(height: defaultPadding),
            Text(
              _showSearchResult
                  ? "Kết quả tìm kiếm"
                  : "Nhà hàng hàng đầu", // Tiêu đề tùy theo trạng thái tìm kiếm
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: ListView.builder(
                itemCount: _isLoading
                    ? 2
                    : 5, // Số lượng item trong danh sách, 2 khi đang loading, 5 khi có dữ liệu
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding),
                  child: _isLoading
                      ? const BigCardScalton() // Hiển thị skeleton card khi đang loading
                      : RestaurantInfoBigCard(
                          // Dữ liệu nhà hàng được hiển thị
                          images: demoBigImages
                            ..shuffle(), // Shuffle danh sách hình ảnh (dữ liệu mẫu)
                          name: "McDonald's", // Tên nhà hàng
                          rating: 4.3, // Đánh giá của nhà hàng
                          numOfRating: 200, // Số lượng đánh giá
                          deliveryTime: 25, // Thời gian giao hàng
                          foodType: const [
                            "Chinese",
                            "American",
                            "Deshi food"
                          ], // Loại món ăn của nhà hàng
                          press: () {}, // Hành động khi nhấn vào card
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget tìm kiếm
  Form buildSearchForm() {
    return Form(
      key: _formKey, // Gắn khóa form
      child: TextFormField(
        onChanged: (value) {
          // Khi người dùng thay đổi giá trị trong ô nhập liệu
          if (value.length >= 3) {
            showResult(); // Gọi hàm hiển thị kết quả khi nhập từ khóa dài hơn 3 ký tự
          }
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState!.validate()) {
            // Khi người dùng submit form và dữ liệu hợp lệ
            _formKey.currentState!.save(); // Lưu dữ liệu

            // Hiển thị kết quả tìm kiếm khi người dùng submit
            showResult();
          } else {
            // Nếu form không hợp lệ, không làm gì
          }
        },
        validator: requiredValidator
            .call, // Kiểm tra giá trị của ô nhập liệu (bắt buộc)
        style: Theme.of(context)
            .textTheme
            .labelLarge, // Định dạng văn bản nhập vào
        textInputAction:
            TextInputAction.search, // Hiển thị nút tìm kiếm trên bàn phím
        decoration: InputDecoration(
          hintText:
              "Tìm kiếm trên Gà rán", // Văn bản gợi ý khi ô nhập liệu rỗng
          contentPadding: kTextFieldPadding, // Padding cho text field
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg', // Icon tìm kiếm SVG
              color: bodyTextColor, // Màu sắc của icon
            ),
          ),
        ),
      ),
    );
  }
}
