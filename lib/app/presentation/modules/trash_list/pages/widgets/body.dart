// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'package:lixtec/app/domain/entities/trash_list.dart';
import 'package:lixtec/app/presentation/modules/home/map.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class BodyComponent extends StatelessWidget {
  BodyComponent({super.key, required this.selectedIndex, required this.userId});

  final List trashList = [];
  final int selectedIndex;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildTitle(),
          const SizedBox(height: 10),
          _buildTrashListCard(context),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Endereços das lixeiras',
      style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTrashListCard(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<TrashListEntity>>(
          future: getTrashList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return _buildEmptyListWidget();
            } else {
              return _buildTrashList(snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Text(
        'Erro ao carregar os dados: $error',
        style: const TextStyle(color: AppColors.whiteColor),
      ),
    );
  }

  Widget _buildEmptyListWidget() {
    return const Center(
      child: Text('Nenhum item encontrado.',
          style: TextStyle(color: AppColors.whiteColor)),
    );
  }

  Widget _buildTrashList(List<TrashListEntity> data) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return _buildTrashListItem(context, item);
      },
    );
  }

  Widget _buildTrashListItem(BuildContext context, TrashListEntity item) {
    return Card(
      color: Colors.grey[800],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          '${item.street}, ${item.number}, ${item.complement}',
          style: const TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        onTap: () => _onTrashListItemTap(context, item),
      ),
    );
  }

  Future<void> _onTrashListItemTap(
      BuildContext context, TrashListEntity item) async {
    var status = await Permission.location.status;

    if (status.isGranted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapScreen(
            street: item.street,
            number: item.number,
            state: item.state,
            city: item.city,
            country: item.country,
            latitude: item.latitude,
            longitude: item.longitude,
          ),
        ),
      );
    } else {
      _showLocationPermissionPopup(context);
    }
  }

  Future<List<TrashListEntity>> getTrashList() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('trash_list').get();

      return querySnapshot.docs.map((doc) {
        return TrashListEntity(
          street: doc['street'],
          number: doc['number'],
          state: doc['state'],
          city: doc['city'],
          country: doc['country'],
          complement: doc['complement'],
          longitude: doc['longitude'],
          latitude: doc['latitude'],
        );
      }).toList();
    } catch (e) {
      print('Erro ao obter a lista de lixeiras: $e');
      return [];
    }
  }

  void _showLocationPermissionPopup(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Habilite a permissão de localização nas configurações.',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class IconInfo {
  final IconData icon;
  final String textBelowIcon;

  IconInfo({
    required this.icon,
    required this.textBelowIcon,
  });
}

class TutorialScreen extends StatelessWidget {
  final String title;
  final String content;
  final List<IconInfo> iconInfoList;
  final String imagePath;

  TutorialScreen({
    required this.title,
    required this.content,
    required this.iconInfoList,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppTextStyles.textTheme.bodyLarge!.apply(
            color: AppColors.whiteColor,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              content,
              style: AppTextStyles.textTheme.bodyLarge!.apply(
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Container(
              width: 400.0,
              height: 400.0,
              child: Image.asset(imagePath),
            ),
          ],
        ),
      ),
    );
  }
}
