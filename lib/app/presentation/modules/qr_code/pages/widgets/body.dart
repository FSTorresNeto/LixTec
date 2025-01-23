// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/presentation/modules/home/pages/widgets/qr_code_scanner_screen.dart';

class BodyComponent extends StatelessWidget {
  BodyComponent({super.key, required this.selectedIndex, required this.userId});

  final List trashList = [];
  final int selectedIndex;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return QRCodeScannerScreen(
      userId: userId,
    );
  }
}
