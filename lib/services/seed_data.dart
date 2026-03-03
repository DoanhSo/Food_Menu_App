import 'package:cloud_firestore/cloud_firestore.dart';

/// Hàm seed dữ liệu mẫu vào Firestore để demo
/// Chạy 1 lần duy nhất để tạo dữ liệu
Future<void> seedFoodData() async {
  final firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('food_items');

  // Kiểm tra nếu đã có dữ liệu thì không seed lại
  final existing = await collection.limit(1).get();
  if (existing.docs.isNotEmpty) {
    return; // Đã có dữ liệu, không cần seed
  }

  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Phở Bò Hà Nội',
      'description': 'Phở bò truyền thống với nước dùng ninh xương 12 tiếng, thịt bò tái chín mềm, hành lá và rau thơm tươi.',
      'price': 55000,
      'imageUrl': 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=400',
      'category': 'Món chính',
    },
    {
      'name': 'Bún Chả Hà Nội',
      'description': 'Bún chả nướng than hoa thơm lừng, ăn kèm bún tươi, rau sống và nước mắm chua ngọt.',
      'price': 50000,
      'imageUrl': 'https://images.unsplash.com/photo-1569058242567-93de6f36f8eb?w=400',
      'category': 'Món chính',
    },
    {
      'name': 'Cơm Tấm Sườn Bì Chả',
      'description': 'Cơm tấm Sài Gòn đầy đủ sườn nướng, bì, chả trứng, đồ chua và nước mắm pha.',
      'price': 60000,
      'imageUrl': 'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=400',
      'category': 'Món chính',
    },
    {
      'name': 'Bánh Mì Thịt Nướng',
      'description': 'Bánh mì giòn rụm với thịt nướng, đồ chua, rau mùi, dưa leo và tương ớt.',
      'price': 30000,
      'imageUrl': 'https://images.unsplash.com/photo-1600688640154-9619e002df30?w=400',
      'category': 'Ăn vặt',
    },
    {
      'name': 'Gỏi Cuốn Tôm Thịt',
      'description': 'Gỏi cuốn tươi mát với tôm, thịt ba chỉ luộc, bún, rau sống, chấm nước mắm pha hoặc tương đậu.',
      'price': 35000,
      'imageUrl': 'https://images.unsplash.com/photo-1562967916-eb82221dfb44?w=400',
      'category': 'Khai vị',
    },
    {
      'name': 'Bò Lúc Lắc',
      'description': 'Thịt bò Úc xào với tỏi, tiêu đen, hành tây, ớt chuông, ăn kèm cơm trắng.',
      'price': 85000,
      'imageUrl': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400',
      'category': 'Món chính',
    },
    {
      'name': 'Chè Bưởi',
      'description': 'Chè bưởi thơm ngọt với cùi bưởi, đậu xanh, nước cốt dừa béo ngậy.',
      'price': 25000,
      'imageUrl': 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400',
      'category': 'Tráng miệng',
    },
    {
      'name': 'Trà Đào Cam Sả',
      'description': 'Trà đào thơm ngát kết hợp với cam tươi và sả, vị thanh mát, giải nhiệt.',
      'price': 35000,
      'imageUrl': 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400',
      'category': 'Đồ uống',
    },
    {
      'name': 'Cà Phê Sữa Đá',
      'description': 'Cà phê phin truyền thống Việt Nam, đậm đà, thêm sữa đặc béo ngọt và đá lạnh.',
      'price': 29000,
      'imageUrl': 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400',
      'category': 'Đồ uống',
    },
    {
      'name': 'Bánh Xèo Miền Tây',
      'description': 'Bánh xèo giòn rụm nhân tôm, thịt, giá đỗ, ăn kèm rau sống và nước mắm chua ngọt.',
      'price': 45000,
      'imageUrl': 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400',
      'category': 'Món chính',
    },
    {
      'name': 'Nem Rán (Chả Giò)',
      'description': 'Nem rán vàng giòn với nhân thịt heo, miến, mộc nhĩ, cà rốt băm nhuyễn.',
      'price': 40000,
      'imageUrl': 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400',
      'category': 'Khai vị',
    },
    {
      'name': 'Sinh Tố Bơ',
      'description': 'Sinh tố bơ béo ngậy, thêm sữa đặc ngọt, nước đá xay mịn, mát lạnh.',
      'price': 32000,
      'imageUrl': 'https://images.unsplash.com/photo-1638176066666-ffb2f013c7dd?w=400',
      'category': 'Đồ uống',
    },
  ];

  // Thêm dữ liệu vào Firestore
  final batch = firestore.batch();
  for (var item in foodItems) {
    final docRef = collection.doc();
    batch.set(docRef, item);
  }
  await batch.commit();
}
