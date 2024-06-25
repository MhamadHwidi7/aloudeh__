import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_good_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/add_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/get_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/inventory_good_params.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/add_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_all_good_paginated_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/getx/barcode_scan_list_controller.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/getx/cubit/barcode_scanner_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/getx/cubit/cubit/barcode_scanner_list_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/inventory_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/receiving_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/screens/good_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ReceivingGoodScreen extends StatefulWidget {
  const ReceivingGoodScreen({super.key});

  @override
  _ReceivingGoodScreenState createState() => _ReceivingGoodScreenState();
}

class _ReceivingGoodScreenState extends State<ReceivingGoodScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;
  bool _hasScanned = false;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!_hasScanned) {
        _hasScanned = true;
        FlutterBeep.beep();
        context
            .read<ReceivingGoodCubit>()
            .handleQrCodeScanned(scanData.code!);
      }
    });
  }

  void toggleFlash() async {
    if (controller != null) {
      await controller!.toggleFlash();
      setState(() {
        isFlashOn = !isFlashOn;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (GetPlatform.isAndroid) {
        controller!.pauseCamera();
      } else if (GetPlatform.isIOS) {
        controller!.resumeCamera();
      }
    }
    context.read<ReceivingGoodCubit>().resetScanState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  isFlashOn ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: toggleFlash,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<ReceivingGoodCubit, PostState<BaseEntity>>(
                listener: (context, state) {
                  state.whenOrNull(
                    error: (NetworkExceptions exception) {
                      Fluttertoast.showToast(
                        msg: NetworkExceptions.getErrorMessage(exception),
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      _resetScanner();
                    },
                    success: (data) {
                      Fluttertoast.showToast(
                        msg: data.message,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      context
                          .read<GetAllGoodsPaginatedCubit>()
                          .emitGetAllGoods();
                      _resetScanner();
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => Text(
                      'Scan a code',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    loading: () => const CupertinoActivityIndicator(),
                    idle: () => Text(
                      'Scan a code',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _resetScanner() {
    _hasScanned = false;
    controller?.dispose(); // Dispose the controller
    context.read<ReceivingGoodCubit>().resetScanState();
    Navigator.pop(context);
  }
}
class AddGoodBarcodeScannerScreen extends StatefulWidget {
  const AddGoodBarcodeScannerScreen({super.key});

  @override
  _AddGoodBarcodeScannerScreenState createState() =>
      _AddGoodBarcodeScannerScreenState();
}

class _AddGoodBarcodeScannerScreenState
    extends State<AddGoodBarcodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;
  bool _hasScanned = false;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!_hasScanned) {
        _hasScanned = true;
        FlutterBeep.beep();
        context
            .read<AddGoodCubit>()
            .emitAddGood(addGoodParams: AddGoodParams(barcode: scanData.code!));
      }
    });
  }

  void toggleFlash() async {
    if (controller != null) {
      await controller!.toggleFlash();
      setState(() {
        isFlashOn = !isFlashOn;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (GetPlatform.isAndroid) {
        controller!.pauseCamera();
      } else if (GetPlatform.isIOS) {
        controller!.resumeCamera();
      }
    }
    context.read<BarcodeScannerCubit>().resetScanState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  isFlashOn ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: toggleFlash,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<AddGoodCubit, PostState<BaseEntity>>(
                listener: (context, state) {
                  state.whenOrNull(
                    error: (NetworkExceptions exception) {
                      Fluttertoast.showToast(
                        msg: NetworkExceptions.getErrorMessage(exception),
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      _resetScanner();
                    },
                    success: (data) {
                      Fluttertoast.showToast(
                        msg: data.message,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      context
                          .read<GetAllGoodsPaginatedCubit>()
                          .emitGetAllGoods();
                      _resetScanner();
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => Text(
                      'Scan a code',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    loading: () => const CupertinoActivityIndicator(),
                    idle: () => Text(
                      'Scan a code',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _resetScanner() {
    _hasScanned = false;
    controller?.dispose(); // Dispose the controller
    context.read<BarcodeScannerCubit>().resetScanState();
    Navigator.pop(context);
  }
}
class GetGoodBarcodeScannerScreen extends StatefulWidget {
  const GetGoodBarcodeScannerScreen({super.key});

  @override
  _GetGoodBarcodeScannerScreenState createState() =>
      _GetGoodBarcodeScannerScreenState();
}

class _GetGoodBarcodeScannerScreenState
    extends State<GetGoodBarcodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (GetPlatform.isAndroid) {
        controller!.pauseCamera();
      } else if (GetPlatform.isIOS) {
        controller!.resumeCamera();
      }
    }
    context.read<BarcodeScannerCubit>().resetScanState();
  }

  void toggleFlash() async {
    if (controller != null) {
      await controller!.toggleFlash();
      setState(() {
        isFlashOn = !isFlashOn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: (ctrl) {
              controller = ctrl;
              context.read<BarcodeScannerCubit>().onQrViewCreated(ctrl);
            },
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  isFlashOn ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: toggleFlash,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<BarcodeScannerCubit, BarcodeScannerState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (barcode) {
                      FlutterBeep.beep();
                      context.read<GetGoodCubit>().emitGetGood(
                          getGoodParams: GetGoodParams(barcode: barcode.code!));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => GoodDataScreen(
                                    barcode: barcode.code!,
                                  )));
                      context.read<BarcodeScannerCubit>().resetScanState();
                                            controller?.dispose(); // Dispose the controller

                    },
                    error: (message) {
                      Fluttertoast.showToast(
                        msg: message,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return state.when(
                    initial: () => Text(
                      'Scan a code',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    scanning: () => const CupertinoActivityIndicator(),
                    success: (barcode) => Text(
                      'Barcode Type: ${describeEnum(barcode.format)}\nData: ${barcode.code}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    error: (message) => Text(
                      'Error: $message',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BarcodeScannerListCubit(),
        child: BlocConsumer<BarcodeScannerListCubit, BarcodeScannerListState>(
          listener: (context, state) {
            state.whenOrNull(
              alreadyScanned: (barcodes) {
                Fluttertoast.showToast(
                  msg: "This barcode has already been scanned.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              error: (message) {
                Fluttertoast.showToast(
                  msg: message,
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
            );
          },
          builder: (context, state) {
            bool isFlashOn = false;
            final barcodes = state.maybeWhen(
              barcodeListUpdated: (barcodes) => barcodes,
              alreadyScanned: (barcodes) => barcodes,
              flashStatusChanged: (flashStatus) {
                isFlashOn = flashStatus;
                return context.read<BarcodeScannerListCubit>().scannedBarcodes;
              },
              orElse: () =>
                  context.read<BarcodeScannerListCubit>().scannedBarcodes,
            );

            return Stack(
              children: <Widget>[
                QRView(
                  key: GlobalKey(debugLabel: 'QR'),
                  onQRViewCreated:
                      context.read<BarcodeScannerListCubit>().onQrViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      icon: Icon(
                        isFlashOn ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        context.read<BarcodeScannerListCubit>().toggleFlash();
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200,
                    color: Colors.black54,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: barcodes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  barcodes[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                        BlocConsumer<InventoryGoodCubit, PostState<BaseEntity>>(
                          listener: (context, state) {
state.whenOrNull(
          error: (NetworkExceptions exception) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(exception),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
          success: (data) {
                        context.read<GetAllGoodsPaginatedCubit>().emitGetAllGoods();

            Navigator.pop(context);
          },
        );                          },
                          builder: (context, state) {
                         return   state.maybeWhen(idle: () => ElevatedButton(
                              onPressed: () {
context.read<InventoryGoodCubit>() .emitInventoryGood(inventoryGoodsParams: InventoryGoodsParams(barcodes: barcodes))                             ;},
                              child: Text('Inventory Scanned Barcodes'),
                            ),loading: () => const Center(child: CupertinoActivityIndicator(),),orElse: () =>  ElevatedButton(
                              onPressed: () {
context.read<InventoryGoodCubit>() .emitInventoryGood(inventoryGoodsParams: InventoryGoodsParams(barcodes: barcodes))                             ;},
                              
                              child: Text('Inventory Scanned Barcodes')),);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
