import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  Barcode? result;
  String qrcode = '';
  QRViewController? controller;
  bool _flashOn = false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: buildQrView(context)),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent.withOpacity(1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                          child: IconButton(
                              onPressed: () async {
                                await controller!.toggleFlash();
                                setState(() {
                                  _flashOn = !_flashOn;
                                });
                              },
                              icon: Icon(
                                _flashOn
                                    ? Icons.flashlight_on_sharp
                                    : Icons.flashlight_on_sharp,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Center(
                          child:  (result != null)
                              ?Text("Result: ${result!.code}")
                              :Text("Scan a code",
                            style: TextStyle(color: Colors.red),)
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (qrcode.isEmpty){
        qrcode = scanData.code!;
        if(qrcode.isNotEmpty){
          this.controller?.pauseCamera();
          print(qrcode);
        }
      }
    });
  }
}