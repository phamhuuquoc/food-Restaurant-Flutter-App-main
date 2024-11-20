// Chứa tất cả dữ liệu demo
final List<String> demoRestaurantNames = [
  "Gà Rán Đặc Biệt",
  "Nhà Gà Hàn Quốc",
  "Gà Rán Cô Tâm",
  "Gà Rán Phát Tài",
  "Gà Rán Vỉa Hè",
  // Thêm nhiều tên nhà hàng hơn nếu cần
];

final Map<String, String> restaurantImages = {
  "Gà Rán Đặc Biệt": "assets/images/ไก่ทอดซอสหัวหอม.jpg",
  "Nhà Gà Hàn Quốc": "assets/images/ลาบไก่ทอด.jpg",
  "Gà Rán Cô Tâm": "assets/images/ปีกไก่ทอด.jpg",
  "Gà Rán Phát Tài": "assets/images/ข้าวเหนียวไก่ทอด.png",
  // Thêm nhiều tên nhà hàng và hình ảnh hơn nếu cần
};

List<String> demoBigImages = [
  "assets/images/ไก่ทอดซอสหัวหอม.jpg",
  "assets/images/ลาบไก่ทอด.jpg",
  "assets/images/ปีกไก่ทอด.jpg",
  "assets/images/ข้าวเหนียวไก่ทอด.png",
  "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
  "assets/images/ไก่ทอดสับ.jpg",
  "assets/images/ข้าวเหนียวไก่ทอด.png",
  "assets/images/ไก่ทอดคาราอาเกะ.jpg",
  "assets/images/ไก่ทอดบ้านๆ.jpg",
  "assets/images/ไก่ทอดซอสบาบีคิว.jpg",
  "assets/images/ไก่ทอดซอสน้ำปลา.jpg",
];

List<Map<String, dynamic>> demoMediumCardData = [
  {
    "name": "Nhà Gà Hàn Quốc",
    "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
    "location": "Bửu Long, Biên Hòa",
    "rating": 8.6,
    "delivertTime": 20,
  },
  {
    "name": "Gà Rán Đặc Biệt",
    "image": "assets/images/ไก่ทอดหาดใหญ่.jpg",
    "location": "Bửu Long, Biên Hòa",
    "rating": 9.1,
    "delivertTime": 35,
  },
  {
    "name": "Gà Rán Cô Tâm",
    "image": "assets/images/ไก่ทอดซอสน้ำปลา.png",
    "location": "Bửu Long, Biên Hòa",
    "rating": 7.3,
    "delivertTime": 25,
  },
  {
    "name": "Gà Rán Phát Tài",
    "image": "assets/images/ข้าวหมกไก่ทอด.jpg",
    "location": "Bửu Long, Biên Hòa",
    "rating": 8.4,
    "delivertTime": 30,
  },
  {
    "name": "Gà Rán Vỉa Hè",
    "image": "assets/images/ปีกไก่ทอด.jpg",
    "location": "Bửu Long, Biên Hòa",
    "rating": 9.5,
    "delivertTime": 15,
  }
];

final Map<String, List<Map<String, dynamic>>> restaurantMenu = {
  "Nhà Gà Hàn Quốc": [
    {
      "name": "Gà Rán Sốt Hàn Quốc",
      "location": "An Bình, Biên Hòa",
      "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
      "foodType": "Gà Rán Sốt Hàn Quốc",
      "price": 0,
    },
    {
      "name": "Gà Rán Sốt Hành Tây",
      "location": "Bình Đa, Biên Hòa",
      "image": "assets/images/ไก่ทอดซอสหัวหอม.jpg",
      "foodType": "Gà Rán Sốt Hành Tây",
      "price": 0,
    },
    {
      "name": "Gà Rán Karaage",
      "location": "Bửu Hòa, Biên Hòa",
      "image": "assets/images/ไก่ทอดคาราอาเกะ.jpg",
      "foodType": "Gà Rán Karaage",
      "price": 0,
    },
    {
      "name": "Gà Rán Sốt BBQ",
      "location": "Bửu Long, Biên Hòa",
      "image": "assets/images/ไก่ทอดซอสบาบีคิว.jpg",
      "foodType": "Gà Rán Sốt BBQ",
      "price": 0,
    },
  ],
  "Gà Rán Đặc Biệt": [
    {
      "name": "Gà Rán Hatyai",
      "location": "Hòa Bình, Biên Hòa",
      "image": "assets/images/ไก่ทอดหาดใหญ่.png",
      "foodType": "Gà Rán",
      "price": 0,
    },
    {
      "name": "Cơm Gà",
      "location": "Hóa An, Biên Hòa",
      "image": "assets/images/ข้าวหมกไก่ทอด.png",
      "foodType": "Cơm Gà",
      "price": 20,
    },
    {
      "name": "Cơm Gà Xối Mỡ",
      "location": "Hiệp Hòa, Biên Hòa",
      "image": "assets/images/ข้าวหมกไก่ทอด.png",
      "foodType": "Cơm Gà Xối Mỡ",
      "price": 0,
    },
  ],
  "Gà Rán Cô Tâm": [
    {
      "name": "Gà Rán Sốt Nước Mắm",
      "location": "Long Bình, Biên Hòa",
      "image": "assets/images/ไก่ทอดซอสน้ำปลา.png",
      "foodType": "Gà Rán Sốt Nước Mắm",
      "price": 0,
    },
    {
      "name": "Gà Rán Chặt",
      "location": "Long Bình Tân, Biên Hòa",
      "image": "assets/images/ไก่ทอดสับ.png",
      "foodType": "Gà Rán Chặt",
      "price": 20,
    },
    {
      "name": "Cánh Gà Rán",
      "location": "Tam Hiệp, Biên Hòa",
      "image": "assets/images/ปีกไก่ทอด.png",
      "foodType": "Cánh Gà Rán",
      "price": 0,
    },
  ],
  "Gà Rán Quán Phát Tài": [
    {
      "name": "Lạp Gà Rán",
      "location": "Tam Hòa, Biên Hòa",
      "image": "assets/images/ลาบไก่ทอด.png",
      "foodType": "Lạp Gà Rán",
      "price": 0,
    },
    {
      "name": "Gà Rán Ớt Indo",
      "location": "Tam Phước, Biên Hòa",
      "image": "assets/images/ไก่ทอดพริกอินโด.png",
      "foodType": "Gà Rán Ớt Indo",
      "price": 20,
    },
    {
      "name": "Gà Rán Sốt Chua Ngọt",
      "location": "Tân Biên, Biên Hòa",
      "image": "assets/images/ไก่ทอดผัดเปรี่ยวหวาน.png",
      "foodType": "Gà Rán Sốt Chua Ngọt",
      "price": 0,
    },
  ],
  "Gà Rán Vỉa Hè": [
    {
      "name": "Cơm Gà Rán",
      "location": "Tân Mai, Biên Hòa",
      "image": "assets/images/ข้าวเหนียวไก่ทอด.png",
      "foodType": "Cơm Gà Rán",
      "price": 20,
    },
    {
      "name": "Gà Rán Cơm Nếp",
      "location": "Trảng Dài, Biên Hòa",
      "image": "assets/images/ข้าวเหนียวไก่ทอด.png",
      "foodType": "Gà Rán Cơm Nếp",
      "price": 0,
    },
    {
      "name": "Gà Rán Cay",
      "location": "Thống Nhất, Biên Hòa",
      "image": "assets/images/ไก่ทอดซอสเผ็ด.png",
      "foodType": "Gà Rán Cay",
      "price": 20,
    },
  ]
};
