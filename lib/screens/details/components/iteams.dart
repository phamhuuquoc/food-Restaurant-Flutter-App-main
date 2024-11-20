import 'package:flutter/material.dart';
import 'package:foodly_ui/components/cards/iteam_card.dart';
import 'package:foodly_ui/constants.dart';
import '../../orderDetails/order_details_screen.dart'; // import OrderDetailsScreen

class Items extends StatefulWidget {
  const Items({Key? key});

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  double totalPrice = 0; // Thêm biến lưu giá tổng cộng
  List<Map<String, dynamic>> selectedItems =
      []; // Thêm biến lưu danh sách sản phẩm đã chọn

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      totalPrice += item["price"];
      selectedItems.add(item);
      // totalPrice = item['price'];
      // selectedItems = [item];
    });
    // Chuyển đến OrderDetailsScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(
            totalPrice: totalPrice, selectedItems: selectedItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(
          length: demoTabs.length,
          child: TabBar(
            isScrollable: true,
            unselectedLabelColor: titleColor,
            labelStyle: Theme.of(context).textTheme.titleLarge,
            onTap: (value) {
              // bạn sẽ nhận được chỉ số tab đã chọn
            },
            tabs: demoTabs,
          ),
        ),
        ...List.generate(
          demoData.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            child: ItemCard(
              title: demoData[index]["title"],
              description: demoData[index]["description"],
              image: demoData[index]["image"],
              foodType: demoData[index]['foodType'],
              price: demoData[index]["price"],
              press: () {
                // Thêm sản phẩm đã chọn vào danh sách selectedItems và gửi đến OrderDetailsScreen
                addToCart(demoData[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

final List<Tab> demoTabs = <Tab>[
  const Tab(
    child: Text('Tất cả thực đơn'),
  )
];

final List<Map<String, dynamic>> demoData = [
  {
    "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
    "title": "Gà Rán Sốt Hàn Quốc",
    "description":
        "Món gà rán thơm ngon, giòn rụm, ngấm đẫm sốt Hàn Quốc, vị ngọt ngọt, cay cay. Một lần ăn là không thể ngừng!",
    "price": 2.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดคาราอาเกะ.jpg",
    "title": "Gà Rán Karaage",
    "description":
        "Thịt gà mềm mọng, lớp vỏ giòn tan, hương vị đậm đà khó quên. Cắn một miếng là yêu ngay!",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดซอสน้ำผึ้งกระเทียม.jpg",
    "title": "Gà Rán Sốt Mật Ong Tỏi",
    "description":
        "Gà rán giòn tan, phủ sốt mật ong tỏi thơm lừng, ăn một lần là ghiền!",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดซอสบาบีคิว.jpg",
    "title": "Gà Rán Sốt BBQ",
    "description":
        "Vị gà giòn tan kết hợp với sốt BBQ đậm đà, thơm lừng gia vị. Hãy thử và cảm nhận sự khác biệt!",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดซอสหัวหอม.jpg",
    "title": "Gà Rán Sốt Hành Tây",
    "description":
        "Gà rán giòn rụm, sốt đậm đà, ăn kèm hành tây tươi ngọt, đúng chuẩn món ngon xứ mình.",
    "price": 4.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ข้าวเหนียวไก่ทอด.png",
    "title": "Xôi Gà Rán",
    "description":
        "Gà rán giòn ngon, kết hợp với xôi nếp dẻo mềm, một bữa ăn trọn vẹn, no bụng cả ngày.",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดผัดเปรี้ยวหวาน.jpg",
    "title": "Gà Rán Xào Chua Ngọt",
    "description":
        "Vị chua chua, ngọt ngọt, ăn cùng người thân, không gian ấm cúng và hạnh phúc.",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดพริกอินโด.jpg",
    "title": "Gà Rán Sốt Ớt Indonesia",
    "description":
        "Món gà cay nồng, đậm đà, không thể cưỡng lại. Chắc chắn sẽ khiến bạn phải 'nghiện'!",
    "price": 4.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดสับ.jpg",
    "title": "Gà Rán Chặt Miếng",
    "description":
        "Món gà rán chặt miếng, thưởng thức một miếng là bạn sẽ quên hết âu lo.",
    "price": 2.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ข้าวมันไก่ทอด.jpg",
    "title": "Cơm Gà Rán",
    "description":
        "Cơm gà rán nóng hổi, thơm ngon với nước dùng đậm đà, làm bạn không thể quên.",
    "price": 4.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ลาบไก่ทอด.jpg",
    "title": "Gà Rán Kiểu Larb",
    "description":
        "Món gà cay nồng, ăn xong bạn sẽ cảm thấy 'chất chơi' hơn bao giờ hết.",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ปีกไก่ทอด.jpg",
    "title": "Cánh Gà Rán",
    "description": "Cánh gà rán vàng giòn, chỉ có thể nói một từ: Tuyệt vời!",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดหน้าโรงเรียน.jpg",
    "title": "Gà Rán Trước Cổng Trường",
    "description":
        "Nhớ lại thời học sinh, cùng bạn bè đứng đợi mua gà rán, một món ăn vừa ngon vừa gợi nhớ kỷ niệm.",
    "price": 1.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดหาดใหญ่.jpg",
    "title": "Gà Rán Hat Yai",
    "description":
        "Món gà rán nổi tiếng ở Hat Yai, thơm ngon đến mức bạn phải quay lại thêm một lần nữa.",
    "price": 4.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดบ้านๆ.jpg",
    "title": "Gà Rán Kiểu Nhà Quê",
    "description": "Gà rán kiểu dân dã, đơn giản mà ngon vô cùng.",
    "price": 3.99,
    "foodType": "Gà Rán",
  },
  {
    "image": "assets/images/ไก่ทอดซอสน้ำปลา.png",
    "title": "Gà Rán Sốt Nước Mắm",
    "description":
        "Món gà rán sốt nước mắm thơm ngon, ăn một miếng là quên hết mọi thứ. Đảm bảo an toàn cho sức khỏe!",
    "price": 6.99,
    "foodType": "Gà Rán",
  },
];
