import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';
class QRScannerController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var scannedBarcodes = <String>[].obs;  // Store barcode strings instead of Barcode objects
  QRViewController? controller;
  var isFlashOn = false.obs;
  var result = Rx<Barcode?>(null);

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      String barcodeValue = scanData.code!;
      if (!scannedBarcodes.contains(barcodeValue)) {
        scannedBarcodes.add(barcodeValue);
        result.value = scanData;
        FlutterBeep.beep();
      } else {
        Fluttertoast.showToast(
          msg: "This barcode has already been scanned.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );
      }
    });
  }

  void toggleFlash() async {
    if (controller != null) {
      await controller!.toggleFlash();
      isFlashOn.value = await controller!.getFlashStatus() ?? false;
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }

  void reassemble() {
    if (GetPlatform.isAndroid) {
      controller?.pauseCamera();
    } else if (GetPlatform.isIOS) {
      controller?.resumeCamera();
    }
  }
}