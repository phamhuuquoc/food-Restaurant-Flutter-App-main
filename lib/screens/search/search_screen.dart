import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/cards/big/restaurant_info_big_card.dart'; // Thêm card hiển thị thông tin nhà hàng
import '../../components/scalton/big_card_scalton.dart'; // Skeleton card dùng khi đang tải dữ liệu
import '../../constants.dart'; // Các giá trị hằng số được định nghĩa trong ứng dụng
import '../../demoData.dart'; // Dữ liệu mẫu cho nhà hàng và các thông tin khác

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _showSearchResult =
      false; // Biến kiểm tra có hiển thị kết quả tìm kiếm hay không
  bool _isLoading = true; // Biến kiểm tra trạng thái loading

  @override
  void initState() {
    super.initState();
    // Mô phỏng delay để hiển thị loading
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false; // Sau khi delay, thay đổi trạng thái loading
      });
    });
  }

  // Hàm hiển thị kết quả tìm kiếm
  void showResult() {
    setState(() {
      _isLoading = true; // Khi tìm kiếm, set trạng thái loading
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSearchResult = true; // Hiển thị kết quả tìm kiếm
        _isLoading = false; // Tắt loading sau khi có kết quả
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding), // Padding mặc định
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding),
              Text(
                'Tìm kiếm',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium, // Tiêu đề "Search"
              ),
              const SizedBox(height: defaultPadding),
              const SearchForm(), // Form tìm kiếm
              const SizedBox(height: defaultPadding),
              Text(
                _showSearchResult
                    ? "Kết quả tìm kiếm"
                    : "Nhà hàng hàng đầu", // Tiêu đề thay đổi tùy theo trạng thái tìm kiếm
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: defaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: _isLoading
                      ? 2
                      : demoMediumCardData
                          .length, // Nếu đang loading thì chỉ hiển thị 2 item
                  itemBuilder: (context, index) {
                    // Lấy thông tin từ dữ liệu mẫu
                    final double rating =
                        (demoMediumCardData[index]["rating"] as double?) ?? 0.0;
                    final int deliveryTime =
                        (demoMediumCardData[index]["deliveryTime"] as int?) ??
                            0;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: _isLoading
                          ? const BigCardScalton() // Hiển thị card skeleton khi đang loading
                          : RestaurantInfoBigCard(
                              images: [
                                demoMediumCardData[index]["image"]
                              ], // Hình ảnh nhà hàng
                              name: demoMediumCardData[index]
                                  ["name"], // Tên nhà hàng
                              rating: rating, // Đánh giá
                              numOfRating: 200, // Số lượng đánh giá
                              deliveryTime: deliveryTime, // Thời gian giao hàng
                              foodType: const [
                                "Gà rán"
                              ], // Loại thực phẩm (dữ liệu mẫu)
                              press: () {}, // Hành động khi bấm vào card
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Form tìm kiếm
class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>(); // Khóa form để xác thực

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Gắn khóa form vào widget
      child: TextFormField(
        onChanged: (value) {
          // Nhận giá trị khi người dùng nhập liệu (để có thể tìm kiếm động)
          // if (value.length >= 3) showResult(); // Gọi hàm tìm kiếm khi có ít nhất 3 ký tự
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState!.validate()) {
            // Kiểm tra dữ liệu khi người dùng nhấn Enter (hoặc Submit)
            _formKey.currentState!.save(); // Lưu dữ liệu
            // Thực hiện hành động sau khi submit form
          } else {
            // Nếu form không hợp lệ, không làm gì
          }
        },
        validator: requiredValidator
            .call, // Validator để kiểm tra trường này có bắt buộc không
        style: Theme.of(context)
            .textTheme
            .labelLarge, // Định dạng văn bản của trường input
        textInputAction:
            TextInputAction.search, // Hiển thị hành động tìm kiếm trên bàn phím
        decoration: InputDecoration(
          hintText: "Search on foodly", // Hiển thị văn bản gợi ý
          contentPadding: kTextFieldPadding, // Padding cho text field
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg', // Hình ảnh icon tìm kiếm
              color: bodyTextColor, // Màu sắc của icon
            ),
          ),
        ),
      ),
    );
  }
}
