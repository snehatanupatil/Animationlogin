import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class About extends StatefulWidget {
  @override
  _About createState() => _About();
}

class _About extends State<About> {
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/sample.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aboutt')),
      body:
      PdfView(
        controller: pdfController,
      ),
    );
  }
}
