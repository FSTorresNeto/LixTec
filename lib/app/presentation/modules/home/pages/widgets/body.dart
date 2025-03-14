// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'package:lixtec/app/domain/entities/trash_list.dart';
import 'package:lixtec/app/presentation/modules/home/map.dart';
import 'package:lixtec/app/presentation/modules/home/pages/widgets/qr_code_scanner_screen.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class BodyComponent extends StatelessWidget {
  BodyComponent({super.key, required this.selectedIndex, required this.userId});

  final List trashList = [];
  final int selectedIndex;
  final String userId;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Seja bem-vindo',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Nesta tela, você pode encontrar tutoriais sobre diferentes recursos do aplicativo. '
                'Escolha uma opção abaixo para aprender mais:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TutorialButton(
                      buttonText: 'Sobre o Ranking',
                      onPressed: () {
                        rankingTutorial(context);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TutorialButton(
                      buttonText: 'Sobre o QrCode',
                      onPressed: () {
                        qrCodeTutorial(context);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TutorialButton(
                      buttonText: 'Sobre as Listas de Lixeiras',
                      onPressed: () {
                        trashListTutorial(context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      case 1:
        return FutureBuilder<double>(
          future: _getDepositsTotalValue(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao obter valor: ${snapshot.error}'),
              );
            } else {
              double depositsTotalValue = snapshot.data ?? 0.0;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Valor total de depósitos em Kg:',
                      style: AppTextStyles.textTheme.bodySmall!.apply(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: CircularProgressIndicator(
                        value: depositsTotalValue,
                        color: Colors.green,
                        backgroundColor: Colors.grey,
                        strokeWidth: 8.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      depositsTotalValue > 0
                          ? '$depositsTotalValue KG'
                          : 'Valor inexistente',
                      style: AppTextStyles.textTheme.bodySmall!.apply(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        );
      case 2:
        return QRCodeScannerScreen(
          userId: userId,
        );
      case 3:
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Endereços das lixeiras',
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<List<TrashListEntity>>(
                    future: getTrashList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Erro: ${snapshot.error}',
                              style:
                                  const TextStyle(color: AppColors.whiteColor)),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('Nenhum item encontrado.',
                              style: TextStyle(color: AppColors.whiteColor)),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final item = snapshot.data![index];
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
                                onTap: () async {
                                  var status = await Permission.location.status;

                                  if (status.isGranted) {
                                    // ignore: use_build_context_synchronously
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
                                    showMapPermissionPopup();
                                  }
                                },
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      case 4:
        return SingleChildScrollView(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Um pouquinho sobre nós',
                        style: AppTextStyles.textTheme.titleSmall!.apply(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Somos uma iniciativa para transformar a maneira como encaramos o descarte de lixo eletrônico. Conscientes do impacto ambiental causado pelo descarte inadequado de dispositivos eletrônicos, criamos uma solução inovadora que não apenas incentiva, mas também recompensa a reciclagem responsável',
                        style: AppTextStyles.textTheme.bodyLarge!.apply(
                          color: AppColors.whiteColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'A reciclagem no GreenTechRecycle não é apenas uma ação positiva para o planeta, mas também para o usuário. Ao reciclar, os usuários acumulam pontos que podem ser trocados por descontos em produtos sustentáveis, ingressos para eventos eco-friendly e muito mais. Transformamos a reciclagem em uma experiência gratificante!',
                        style: AppTextStyles.textTheme.bodyLarge!.apply(
                          color: AppColors.whiteColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Somos um movimento para criar um futuro mais verde e sustentável. Junte-se a nós na jornada para reduzir o impacto ambiental do lixo eletrônico e promover práticas de consumo responsáveis.',
                        style: AppTextStyles.textTheme.bodyLarge!.apply(
                          color: AppColors.whiteColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      default:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seja bem vindo',
                style: AppTextStyles.textTheme.bodySmall!.apply(
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        );
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

  Future<double> _getDepositsTotalValue() async {
    String uid = userId;

    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('deposits')
          .where('uid', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var depositsData = querySnapshot.docs.first.data();
        var depositsTotalValue = depositsData['depositsTotalValue'];

        if (depositsTotalValue is num) {
          return depositsTotalValue.toDouble();
        } else {
          print('O valor não é um número.');
          return 0.0;
        }
      } else {
        return 0.0;
      }
    } catch (e) {
      print('Erro ao obter valor: $e');
      return 0.0;
    }
  }
}

void showMapPermissionPopup() {
  Fluttertoast.showToast(
    msg: 'Habilite a permissão de mapa nas configurações do dispositivo.',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void rankingTutorial(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TutorialScreen(
        title: 'Ranking',
        content:
            'A medida que você escaneia os QrCodes é realizado o acrécimo de acordo com o valor colocado no seu Ranking.',
        iconInfoList: [
          IconInfo(
            icon: Icons.star,
            textBelowIcon: '',
          ),
        ],
        imagePath: 'assets/tutorial/ranking.png',
      ),
    ),
  );
}

void qrCodeTutorial(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TutorialScreen(
        title: 'QrCode',
        content:
            'Ao usar o Scanner pela balança para contabilizar os quilos pesados para o seu Ranking, esses QrCodes podem são gerados por uma balança que irá pesar o lixo eletrônico.',
        iconInfoList: [
          IconInfo(
            icon: Icons.qr_code_scanner,
            textBelowIcon: '',
          ),
        ],
        imagePath: 'assets/tutorial/QrCodeExample.png',
      ),
    ),
  );
}

void trashListTutorial(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TutorialScreen(
        title: 'Listagem de lixeiras',
        content:
            'Aqui temos uma lista das lixeiras da cidade onde podemos ter sua localização por meio do Google Maps. Cada endereço é registrado pelo administrador do projeto.',
        iconInfoList: [
          IconInfo(
            icon: Icons.star,
            textBelowIcon: '',
          ),
        ],
        imagePath: 'assets/tutorial/trashList.png',
      ),
    ),
  );
}

class TutorialButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  TutorialButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
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
