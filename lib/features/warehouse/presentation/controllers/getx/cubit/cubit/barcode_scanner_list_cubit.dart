import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';

part 'barcode_scanner_list_state.dart';
part 'barcode_scanner_list_cubit.freezed.dart';

@injectable
class BarcodeScannerListCubit extends Cubit<BarcodeScannerListState> {
  BarcodeScannerListCubit() : super(const BarcodeScannerListState.initial());

  final List<String> scannedBarcodes = [];
  QRViewController? controller;

  void onQrViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final barcodeValue = scanData.code!;
      if (!scannedBarcodes.contains(barcodeValue)) {
        scannedBarcodes.add(barcodeValue);
        emit(BarcodeScannerListState.success(scanData));
        emit(BarcodeScannerListState.barcodeListUpdated(List.from(scannedBarcodes)));
        FlutterBeep.beep();
      } else {
        emit(BarcodeScannerListState.alreadyScanned(List.from(scannedBarcodes)));
      }
    });
  }

  void toggleFlash() async {
    if (controller != null) {
      await controller!.toggleFlash();
      final flashStatus = await controller!.getFlashStatus() ?? false;
      emit(BarcodeScannerListState.flashStatusChanged(flashStatus));
    }
  }

  void resetScanState() {
    scannedBarcodes.clear();
    emit(const BarcodeScannerListState.initial());
  }

  void handleError(String message) {
    emit(BarcodeScannerListState.error(message));
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
