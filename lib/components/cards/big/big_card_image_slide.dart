import 'package:flutter/material.dart';
// Thư viện Material Design của Flutter cung cấp các widget và thành phần giao diện người dùng tiêu chuẩn.

import 'package:foodly_ui/constants.dart';
// Thư viện constants.dart chứa các hằng số tái sử dụng trong ứng dụng, chẳng hạn như màu sắc và khoảng cách mặc định.

import '../../dot_indicators.dart';
// dot_indicators.dart là nơi định nghĩa widget DotIndicator, dùng để hiển thị các chấm chỉ thị cho PageView.

import 'big_card_image.dart';
// big_card_image.dart chứa widget BigCardImage, dùng để hiển thị hình ảnh trong trang.

class BigCardImageSlide extends StatefulWidget {
  const BigCardImageSlide({
    super.key,
    required this.images, // Danh sách các hình ảnh được truyền vào từ bên ngoài.
  });

  final List images; // Danh sách hình ảnh được sử dụng trong slide.

  @override
  _BigCardImageSlideState createState() => _BigCardImageSlideState();
}

class _BigCardImageSlideState extends State<BigCardImageSlide> {
  // _BigCardImageSlideState là trạng thái của widget BigCardImageSlide, sẽ thay đổi khi người dùng cuộn qua các hình ảnh.

  int intialIndex =
      0; // Biến lưu trữ chỉ số của hình ảnh hiện tại (ban đầu là 0).

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // AspectRatio giúp tạo tỷ lệ cho widget, ở đây là tỷ lệ 1.81, đảm bảo hiển thị hình ảnh đúng tỷ lệ.
      aspectRatio: 1.81,
      child: Stack(
        // Stack cho phép các widget chồng lên nhau.
        children: [
          PageView.builder(
            // PageView.builder tạo một view với khả năng cuộn qua các trang (hình ảnh).
            onPageChanged: (value) {
              setState(() {
                intialIndex =
                    value; // Cập nhật chỉ số khi người dùng thay đổi trang.
              });
            },
            itemCount:
                widget.images.length, // Số lượng trang bằng số lượng hình ảnh.
            itemBuilder: (context, index) =>
                BigCardImage(image: widget.images[index]),
            // itemBuilder: Trả về widget BigCardImage cho mỗi hình ảnh trong danh sách.
          ),
          Positioned(
            // Positioned giúp đặt vị trí chính xác cho widget bên trong Stack.
            bottom:
                defaultPadding, // Khoảng cách từ dưới lên bằng defaultPadding.
            right:
                defaultPadding, // Khoảng cách từ bên phải sang bằng defaultPadding.
            child: Row(
              children: List.generate(
                widget.images
                    .length, // Tạo các chỉ thị tương ứng với số lượng hình ảnh.
                (index) => DotIndicator(
                  isActive: intialIndex ==
                      index, // Chỉ thị màu trắng khi là trang hiện tại.
                  activeColor: Colors.white,
                  inActiveColor: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
