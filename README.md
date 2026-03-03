# Food Menu App - Flutter & Firebase Firestore

Ứng dụng hiển thị menu món ăn, được phát triển bằng Flutter và tích hợp Firebase Firestore để quản lý dữ liệu thời gian thực. Đây là sản phẩm hoàn thiện cho bài tập Thực hành số 3 (TH3).

## 👨‍🎓 Thông tin Sinh viên
- **Họ và tên**: Nguyễn Quốc Doanh
- **Mã sinh viên**: 2351060429
- **Lớp**: ClassProject

## 🚀 Tính năng nổi bật
Ứng dụng đáp ứng đầy đủ các yêu cầu kỹ thuật:
- **Gọi dữ liệu từ Firebase**: Dữ liệu món ăn được lấy trực tiếp từ Cloud Firestore.
- **Xử lý 3 trạng thái giao diện**:
  - **Loading (Đang tải)**: Hiển thị `CircularProgressIndicator` kèm thông báo khi đang truy vấn dữ liệu.
  - **Success (Thành công)**: Hiển thị danh sách món ăn dưới dạng GridView với các thẻ Card tinh tế, ảnh minh họa và thông tin chi tiết.
  - **Error (Lỗi & Thử lại)**: Giao diện thông báo lỗi thân thiện khi mất kết nối mạng, tích hợp nút **"Thử lại" (Retry)** để gọi lại API.
- **Tổ chức Code chuẩn**: Tách biệt rõ ràng các lớp Model, Service, Screen và Widget. Sử dụng `try-catch` để bắt ngoại lệ an toàn.

## 🛠 Công nghệ sử dụng
- **Framework**: Flutter
- **Backend**: Firebase Firestore
- **State Management**: StatefulWidget (Logic xử lý trạng thái Loading/Error)
- **UI Components**: Material 3, GridView, Card, RefreshIndicator.

## 📂 Cấu trúc mã nguồn
- `lib/models/`: Định nghĩa FoodItem model.
- `lib/services/`: Chứa `FoodService` gọi Firebase và `SeedData` khởi tạo dữ liệu.
- `lib/screens/`: Màn hình chính `HomeScreen` điều phối giao diện.
- `lib/widgets/`: Các thành phần giao diện dùng chung (FoodCard, LoadingWidget, ErrorWidget).

## 📥 Hướng dẫn cài đặt
1. Clone repository:
   ```bash
   git clone https://github.com/DoanhSo/Food_Menu_App.git
   ```
2. Cài đặt dependencies:
   ```bash
   flutter pub get
   ```
3. Chạy ứng dụng:
   ```bash
   flutter run
   ```

---
*Ghi chú: Ứng dụng tự động khởi tạo dữ liệu mẫu (12 món ăn Việt Nam) trên Firestore trong lần chạy đầu tiên.*
