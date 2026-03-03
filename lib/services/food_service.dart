import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_item.dart';

/// Service lấy dữ liệu món ăn từ Firebase Firestore
class FoodService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Lấy danh sách tất cả món ăn từ collection 'food_items'
  /// Sử dụng try-catch để bắt ngoại lệ an toàn
  Future<List<FoodItem>> fetchFoodItems() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection('food_items').get();

      return snapshot.docs
          .map((doc) => FoodItem.fromFirestore(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw Exception('Lỗi Firebase: ${e.message}');
    } catch (e) {
      throw Exception('Không thể tải dữ liệu. Vui lòng kiểm tra kết nối mạng.');
    }
  }
}
