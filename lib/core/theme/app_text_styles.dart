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
