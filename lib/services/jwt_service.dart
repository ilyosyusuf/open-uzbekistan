import 'package:get_storage/get_storage.dart';

class JwtService {
  static final JwtService _instance = JwtService._init();
  static JwtService get instance => _instance;
  JwtService._init();

  late bool isExpired;
}