import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class EvaluacionPredios {
  generateAndSavePDF(BuildContext context, Map<String, String> data) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          _buildTableRow("Nombre","Detalle",
              color: PdfColors.blueGrey, 
              font: font),
          ...data.keys.map((x) => _buildTableRow(x,data[x].toString(),font: font)).toList()
        ],
      ),
    );

    final output = await getExternalStorageDirectory();
    final pathPDF = "${output!.path}/reporte.pdf";
    final file = File(pathPDF!);
    final path = await pdf.save();
    await file.writeAsBytes(path);
    await OpenFile.open(pathPDF);
  }
  pw.Container _buildTableRow(String nombre, String detalle, {PdfColor? color, required pw.Font font}){

    return pw.Container(
      decoration: pw.BoxDecoration(
        color: color,
      ),
      child: pw.Row(
        children: [
          pw.Expanded(
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                nombre,
                style: pw.TextStyle(color: color != null ? PdfColors.white : null, font: font),
              ),
            ),
          ),
          pw.Expanded(
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                detalle,
                style: pw.TextStyle(color: color != null ? PdfColors.white : null, font: font),
              ),
            ),
          )
        ]
      ),
    );
  }


}