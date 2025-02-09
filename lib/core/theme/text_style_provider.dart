import 'package:pocket_trade/core/theme/app_text_styles.dart';
import 'package:riverpod/riverpod.dart';

final textStyleProvider = Provider<BaseTextStyle>((ref) {
  return KoreanTextStyle();
});
