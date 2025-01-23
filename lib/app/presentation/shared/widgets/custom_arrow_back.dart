// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget CustomArrowBack({
  EdgeInsets? margin,
  void Function()? onTap,
}) {
  return Container(
    margin: margin ?? const EdgeInsets.only(top: 50),
    child: GestureDetector(
      child: SvgPicture.asset(
        "assets/icons/arrow_back.svg",
        height: 16,
        width: 16,
      ),
      onTap: () => onTap ?? Modular.to.pop(),
    ),
  );
}
