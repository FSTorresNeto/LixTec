// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/presentation/modules/home/pages/widgets/body.dart';
import 'package:lixtec/app/presentation/modules/home/pages/widgets/bottom_navigate_bar.dart';
import 'package:lixtec/app/presentation/shared/widgets/app_bar.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({
    Key? key,
    required this.userEntity,
  }) : super(key: key);

  final UserEntity userEntity;

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavigateBar(
        userName: widget.userEntity.name,
        googleUserImageUrl: widget.userEntity.profileUrl,
      ),
      body: Stack(
        children: [
          BodyComponent(
            userId: widget.userEntity.uid,
            selectedIndex: _selectedIndex,
          ),
        ],
      ),
      bottomNavigationBar: BottomBarComponent(
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
