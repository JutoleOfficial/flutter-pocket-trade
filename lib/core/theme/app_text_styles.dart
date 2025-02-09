import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BaseTextStyle {
  TextStyle style11Medium();
  TextStyle style11Bold();

  TextStyle style13Medium();
  TextStyle style13Bold();

  TextStyle style15Medium();
  TextStyle style15Bold();

  TextStyle style18Medium();
  TextStyle style18Bold();
}

class AppTextStyle {
  // 선택된 스타일을 저장할 변수
  static BaseTextStyle _selectedTextStyle = KoreanTextStyle();

  // 스타일을 설정하는 메서드
  static void setTextStyle(BaseTextStyle textStyle) {
    _selectedTextStyle = textStyle;
  }

  static TextStyle get style11Bold {
    return _selectedTextStyle.style11Bold();
  }

  static TextStyle get style11Medium {
    return _selectedTextStyle.style11Medium();
  }

  static TextStyle get style13Bold {
    return _selectedTextStyle.style13Bold();
  }

  static TextStyle get style13Medium {
    return _selectedTextStyle.style13Medium();
  }

  static TextStyle get style15Bold {
    return _selectedTextStyle.style15Bold();
  }

  static TextStyle get style15Medium {
    return _selectedTextStyle.style15Medium();
  }

  static TextStyle get style18Bold {
    return _selectedTextStyle.style18Bold();
  }

  static TextStyle get style18Medium {
    return _selectedTextStyle.style18Medium();
  }
}

class KoreanTextStyle extends BaseTextStyle {
  @override
  TextStyle style11Bold() {
    return GoogleFonts.notoSansKr(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      height: 1.363,
    );
  }

  @override
  TextStyle style11Medium() {
    return GoogleFonts.notoSansKr(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.363,
    );
  }

  @override
  TextStyle style13Bold() {
    return GoogleFonts.notoSansKr(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      height: 1.384,
    );
  }

  @override
  TextStyle style13Medium() {
    return GoogleFonts.notoSansKr(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.384,
    );
  }

  @override
  TextStyle style15Bold() {
    return GoogleFonts.notoSansKr(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.333,
    );
  }

  @override
  TextStyle style15Medium() {
    return GoogleFonts.notoSansKr(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 1.333,
    );
  }

  @override
  TextStyle style18Bold() {
    return GoogleFonts.notoSansKr(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.333,
    );
  }

  @override
  TextStyle style18Medium() {
    return GoogleFonts.notoSansKr(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.333,
    );
  }
}

class GlobalTextStyle extends BaseTextStyle {
  @override
  TextStyle style11Bold() {
    return GoogleFonts.mPlus1(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      height: 1.363,
    );
  }

  @override
  TextStyle style11Medium() {
    return GoogleFonts.mPlus1(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.363,
    );
  }

  @override
  TextStyle style13Bold() {
    return GoogleFonts.mPlus1(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      height: 1.384,
    );
  }

  @override
  TextStyle style13Medium() {
    return GoogleFonts.mPlus1(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.384,
    );
  }

  @override
  TextStyle style15Bold() {
    return GoogleFonts.mPlus1(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.333,
    );
  }

  @override
  TextStyle style15Medium() {
    return GoogleFonts.mPlus1(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 1.333,
    );
  }

  @override
  TextStyle style18Bold() {
    return GoogleFonts.mPlus1(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.333,
    );
  }

  @override
  TextStyle style18Medium() {
    return GoogleFonts.mPlus1(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.333,
    );
  }
}
