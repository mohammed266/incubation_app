import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class CustomPDFViewer extends StatefulWidget {
  final String url;
  CustomPDFViewer({this.url});
  @override
  _CustomPDFViewerState createState() => _CustomPDFViewerState();
}

class _CustomPDFViewerState extends State<CustomPDFViewer> {
  bool _isLoading = true;
  PDFDocument doc;
  void getPdf()async{
    doc = await PDFDocument.fromURL(widget.url ?? 'http://www.africau.edu/images/default/sample.pdf');
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void initState() {
    getPdf();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Text('Loading') : PDFViewer(document: doc),
    );
  }
}
