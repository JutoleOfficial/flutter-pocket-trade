import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_trade/core/theme/app_text_styles.dart';

final textStyleProvider = Provider<BaseTextStyle>((ref) {
  return KoreanTextStyle();
});
