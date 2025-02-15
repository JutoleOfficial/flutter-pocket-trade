import 'package:logger/logger.dart';

class AppLogger {
  // 싱글턴 인스턴스
  static final AppLogger _instance = AppLogger._internal();
  final Logger logger = Logger();

  // private 생성자
  AppLogger._internal();

  // 인스턴스 접근
  factory AppLogger() {
    return _instance;
  }
}
