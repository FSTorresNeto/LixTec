import 'package:flutter/material.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lixtec/app/presentation/modules/home/home_state.dart';

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  late QRViewController controller;
  bool isProcessing = false;
  final HomeState homeState = Modular.get<HomeState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          buildResultContainer(),
          if (isLoading) buildLoadingIndicator(),
        ],
      ),
    );
  }

  Widget buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  Widget buildResultContainer() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return CircularProgressIndicator();
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;

    await _handleCameraPermission();

    controller.scannedDataStream.listen((scanData) async {
      if (!isProcessing) {
        setState(() {
          isProcessing = true;
        });

        double qrCodeValue = double.tryParse(scanData.code!) ?? 0.0;

        await updateDepositsTotalValueFromQRCode(qrCodeValue);

        _showConfirmationPopup(qrCodeValue);

        controller.pauseCamera();

        await Future.delayed(Duration(seconds: 2));
        controller.resumeCamera();

        setState(() {
          isProcessing = false;
        });
      }
    });
  }

  Future<void> _handleCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;

    if (status.isGranted) {
      controller.resumeCamera();
    } else {
      await Permission.camera.request();
      if (await Permission.camera.status.isGranted) {
        controller.resumeCamera();
      } else {
        print('Acesso negado');
      }
    }
  }

  Future<void> updateDepositsTotalValueFromQRCode(double qrCodeValue) async {
    String uid = widget.userId;

    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('deposits')
          .where('uid', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        await FirebaseFirestore.instance
            .collection('deposits')
            .doc(documentId)
            .update({
          'depositsTotalValue': FieldValue.increment(qrCodeValue),
        });
      } else {
        await FirebaseFirestore.instance.collection('deposits').add({
          'uid': uid,
          'depositsTotalValue': qrCodeValue,
        });
      }
    } catch (e) {
      print('Erro ao atualizar o valor do depósito: $e');
    }
  }

  void _showConfirmationPopup(double qrCodeValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: Text(
            'Confirmado!',
            style: AppTextStyles.textTheme.labelSmall!.apply(
              color: AppColors.linkColor,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Valor do peso: $qrCodeValue KG',
            style: AppTextStyles.textTheme.labelSmall!.apply(
              color: AppColors.linkColor,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.resumeCamera();
              },
              child: Text(
                'Escanear Novamente',
                style: AppTextStyles.textTheme.labelSmall!.apply(
                  color: AppColors.linkColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
