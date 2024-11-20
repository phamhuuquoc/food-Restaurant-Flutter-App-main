// Được tạo tự động bởi FlutterFire CLI, không cần chỉnh sửa trừ khi thêm nền tảng mới.
// ignore_for_file: type=lint -> Bỏ qua các cảnh báo về định dạng hoặc kiểu dữ liệu.

import 'package:firebase_core/firebase_core.dart'
    show
        FirebaseOptions; // FirebaseOptions định nghĩa các thông tin cấu hình Firebase.
import 'package:flutter/foundation.dart'
    show
        defaultTargetPlatform,
        kIsWeb,
        TargetPlatform; // Dùng để xác định nền tảng hiện tại của ứng dụng (Android, iOS, web, v.v.).

/// Cung cấp cấu hình mặc định [FirebaseOptions] cho từng nền tảng Firebase App.
///
/// Ví dụ sử dụng:
/// ```dart
/// import 'firebase_options.dart';
/// // Khởi tạo Firebase với cấu hình tương ứng nền tảng.
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  // Trả về cấu hình phù hợp với nền tảng hiện tại.
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      // Kiểm tra xem ứng dụng có đang chạy trên nền tảng web không.
      throw UnsupportedError(
        'DefaultFirebaseOptions chưa được cấu hình cho nền tảng web. '
        'Hãy chạy lại FlutterFire CLI để thêm cấu hình.',
      );
    }
    switch (defaultTargetPlatform) {
      // Xác định nền tảng hiện tại (Android, iOS, macOS, v.v.).
      case TargetPlatform.android:
        return android; // Nếu là Android, trả về cấu hình Android.
      // Các trường hợp chưa cấu hình sẽ ném lỗi.
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   throw UnsupportedError(
      //     'DefaultFirebaseOptions chưa được cấu hình cho macOS. '
      //     'Hãy chạy lại FlutterFire CLI để thêm cấu hình.',
      //   );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions chưa được cấu hình cho Windows. '
          'Hãy chạy lại FlutterFire CLI để thêm cấu hình.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions chưa được cấu hình cho Linux. '
          'Hãy chạy lại FlutterFire CLI để thêm cấu hình.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions không hỗ trợ nền tảng này.',
        );
    }
  }

  // Cấu hình Firebase cho Windows (nếu được thêm sau này).
  static const FirebaseOptions windows = FirebaseOptions(
      apiKey: "AIzaSyCDfRNwZgy5n41gUrXhvbftNLPE9Z_s3NE",
      authDomain: "foodlyui-655c3.firebaseapp.com",
      projectId: "foodlyui-655c3",
      storageBucket: "foodlyui-655c3.firebasestorage.app",
      messagingSenderId: "727592816527",
      appId: "1:727592816527:web:db8c206b43cb92690905fa");

  // Cấu hình Firebase cho Android.
  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyCDfRNwZgy5n41gUrXhvbftNLPE9Z_s3NE",
      authDomain: "foodlyui-655c3.firebaseapp.com",
      projectId: "foodlyui-655c3",
      storageBucket: "foodlyui-655c3.firebasestorage.app",
      messagingSenderId: "727592816527",
      appId: "1:727592816527:web:db8c206b43cb92690905fa");

  // Cấu hình Firebase cho iOS (bị ẩn, có thể thêm lại nếu cần).
  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: "AIzaSyA8Q3W5eQaMgcJOrAnCYQFM4TzMYI473Hs",
  //   authDomain: "foodli-d894c.firebaseapp.com",
  //   projectId: "foodli-d894c",
  //   storageBucket: "foodli-d894c.appspot.com",
  //   messagingSenderId: "204069579284",
  //   appId: "1:204069579284:web:8cd882a9eda06f4d225501"
  // );
}
