import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrPagetate();
}

class _QrPagetate extends State<QrPage> {
  Barcode? result;
  QRViewController? controller;
  bool _flashturnon = false;
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (result != null)
                    Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                      style: TextStyle(color: Colors.white),
                    )
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: IconButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {
                                _flashturnon = !_flashturnon;
                              });
                            },
                            icon: Icon(
                              _flashturnon
                                  ? Icons.flashlight_off_sharp
                                  : Icons.flashlight_on_sharp,
                              color: Colors.white,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: Size(10, 30),
                              maximumSize: Size(200, 50)),
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: Size(10, 30),
                              maximumSize: Size(200, 50)),
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
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

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
