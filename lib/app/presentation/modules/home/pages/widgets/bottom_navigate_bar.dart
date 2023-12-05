import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lixtec/app/domain/entities/feature_entity.dart';
import 'package:lixtec/app/presentation/modules/home/home_state.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';

class BottomBarComponent extends StatefulWidget {
  const BottomBarComponent({Key? key, required this.onItemTapped})
      : super(key: key);

  final Function(int) onItemTapped;

  @override
  _BottomBarComponentState createState() => _BottomBarComponentState();
}

class _BottomBarComponentState extends State<BottomBarComponent> {
  int _selectedIndex = 0;

  final HomeState homeState = Modular.get<HomeState>();
  FeatureEntity featureEntity = FeatureEntity(featureType: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onItemTapped(index);
    });
  }

  Color _getIconColor(int index) {
    return _selectedIndex == index ? AppColors.linkColor : AppColors.whiteColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.darkColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: _getIconColor(0),
              ),
              onPressed: () => {_onItemTapped(0)},
            ),
            IconButton(
                icon: Icon(
                  Icons.star,
                  color: _getIconColor(1),
                ),
                onPressed: () => {_onItemTapped(1)}),
            IconButton(
              icon: Icon(
                Icons.qr_code_scanner,
                color: _getIconColor(2),
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
                icon: Icon(
                  Icons.restore_from_trash,
                  color: _getIconColor(3),
                ),
                onPressed: () =>
                    {_onItemTapped(3) /* , homeState.getTrashList() */}),
            IconButton(
              icon: Icon(
                Icons.recycling,
                color: _getIconColor(4),
              ),
              onPressed: () => {_onItemTapped(4)},
            ),
          ],
        ),
      ),
    );
  }
}
