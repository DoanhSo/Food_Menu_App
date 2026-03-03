import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../services/food_service.dart';
import '../widgets/food_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

/// Màn hình chính - hiển thị danh sách menu món ăn
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FoodService _foodService = FoodService();

  // 3 trạng thái: loading, success, error
  bool _isLoading = true;
  String? _errorMessage;
  List<FoodItem> _foodItems = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Gọi dữ liệu từ Firestore
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final items = await _foodService.fetchFoodItems();
      setState(() {
        _foodItems = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'TH3 - Nguyễn Quốc Doanh - 2351060429',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: _buildBody(),
    );
  }

  /// Xây dựng body dựa trên trạng thái
  Widget _buildBody() {
    // Trạng thái 1: Đang tải
    if (_isLoading) {
      return const LoadingWidget();
    }

    // Trạng thái 3: Lỗi
    if (_errorMessage != null) {
      return ErrorRetryWidget(
        errorMessage: _errorMessage!,
        onRetry: _loadData,
      );
    }

    // Trạng thái 2: Thành công - hiển thị danh sách
    if (_foodItems.isEmpty) {
      return const Center(
        child: Text(
          'Chưa có món ăn nào trong menu.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      color: Colors.deepOrange,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemCount: _foodItems.length,
          itemBuilder: (context, index) {
            return FoodCard(foodItem: _foodItems[index]);
          },
        ),
      ),
    );
  }
}
