// import 'package:aloudeh_company/features/warehouse/presentation/controllers/receiving_good_cubit.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:flutter_beep/flutter_beep.dart';

// class QRScannerOController extends GetxController {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   var result = Rx<Barcode?>(null);
//   QRViewController? controller;
//   var isFlashOn = false.obs;
//   late ReceivingGoodCubit receivingGoodCubit;

//   @override
//   void onInit() {
//     super.onInit();
//     receivingGoodCubit = Get.put<ReceivingGoodCubit>();
//     result.listen((barcode) {
//       if (barcode != null) {
//         receivingGoodCubit.handleQrCodeScanned(barcode.code!);
//       }
//     });
//   }

//   void onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       result.value = scanData;
//       FlutterBeep.beep();
//     });
//   }

//   void toggleFlash() async {
//     if (controller != null) {
//       await controller!.toggleFlash();
//       isFlashOn.value = await controller!.getFlashStatus() ?? false;
//     }
//   }

//   @override
//   void onClose() {
//     controller?.dispose();
//     super.onClose();
//   }

//   void reassemble() {
//     if (GetPlatform.isAndroid) {
//       controller?.pauseCamera();
//     } else if (GetPlatform.isIOS) {
//       controller?.resumeCamera();
//     }
//   }
// }
