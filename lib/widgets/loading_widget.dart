import 'package:flutter/material.dart';

/// Widget hiển thị trạng thái đang tải
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.deepOrange,
            strokeWidth: 3,
          ),
          SizedBox(height: 16),
          Text(
            'Đang tải dữ liệu...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
