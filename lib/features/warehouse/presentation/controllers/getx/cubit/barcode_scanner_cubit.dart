import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'barcode_scanner_state.dart';
part 'barcode_scanner_cubit.freezed.dart';

@injectable
class BarcodeScannerCubit extends Cubit<BarcodeScannerState> {
  BarcodeScannerCubit() : super(const BarcodeScannerState.initial());

  bool _hasScanned = false;

  void onQrViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      if (!_hasScanned) {
        emit(BarcodeScannerState.success(scanData));
      }
    });
  }

  void resetScanState() {
    _hasScanned = false;
    emit(const BarcodeScannerState.initial());
  }

  void handleError(String message) {
    emit(BarcodeScannerState.error(message));
  }
}

