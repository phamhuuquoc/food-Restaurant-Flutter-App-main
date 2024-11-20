import 'package:flutter/material.dart';
import 'package:foodly_ui/screens/orderDetails/order_details_screen.dart';
import '../../../components/cards/iteam_card.dart';
import '../../../constants.dart';
import '../../addToOrder/order_details_screen.dart';

class Items extends StatefulWidget {
  const Items({Key? key});

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  double totalPrice = 0; // Thêm biến để lưu trữ tổng giá trị đơn hàng

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
              // bạn sẽ nhận được chỉ số tab được chọn
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
                // Cộng giá trị món vào tổng giá trị khi nhấn
                setState(() {
                  totalPrice += demoData[index]["price"];
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsScreen(
                      totalPrice:
                          totalPrice, // Chuyển tổng giá trị đến màn OrderDetails
                      selectedItems: [], // Mảng danh sách món đã chọn
                    ),
                  ),
                );
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
    child: Text('All Menu'),
  )
];

final List<Map<String, dynamic>> demoData = [
  {
    "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
    "title": "Gà Rán Sốt Hàn Quốc",
    "description": "Gà rán giòn thơm, được phủ sốt Hàn Quốc đậm đà hương vị.",
    "price": 7.99,
    "foodType": "Gà Rán Hàn Quốc",
    "priceRange": "\$" * 3,
  },
  {
    "image": "assets/images/featured_items_2.png",
    "title": "Menu Item 2",
    "description": "Description of Menu Item 2",
    "price": 7.99,
    "foodType": "Chinese",
    "priceRange": "\$" * 2,
  },
  {
    "image": "assets/images/featured_items_3.png",
    "title": "Menu Item 3",
    "description": "Description of Menu Item 3",
    "price": 6.49,
    "foodType": "Mexican",
    "priceRange": "\$",
  },
];