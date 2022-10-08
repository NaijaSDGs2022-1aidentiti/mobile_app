import 'dart:io';
import 'dart:ui';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../utils.dart';
import 'model/model.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        Container(
            height: 2.5 * PdfPageFormat.cm,
            width: double.infinity,
            color: PdfColor.fromHex('#0260ff'),
            child: Center(
              child: Text(
                'Cashflakes',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromHex('#ffffff')),
              ),
            )),
        buildHeader(invoice),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoice),
        buildInvoice(invoice),
        Divider(
          height: 0.04,
        ),
        buildTotal(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'Cashflakes_reciept.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoice.supplier),
              Container(
                height: 50,
                width: 50,
                child: BarcodeWidget(
                  color: PdfColors.purple400,
                  barcode: Barcode.qrCode(),
                  data: invoice.info.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer),
              buildInvoiceInfo(invoice.info),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(Customer customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customer.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Text(customer.address)
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info) {
    final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Transaction ID:',
      'Transaction Date:',
      'Payment Status:',
      'Due Date:'
    ];
    final data = <String>[
      info.number,
      Utils.formatDate(info.date),
      paymentTerms,
      Utils.formatDate(info.dueDate),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildSupplierAddress(Supplier supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.address),
        ],
      );

  static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transaction Receipt',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: PdfColor.fromHex('#0260ff')),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(invoice.info.description),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final data = invoice.items.map((item) {
      final total = item.itemValue;

      return [
        item.description,
        '\ ${item.itemValue}',
      ];
    }).toList();

    return Table.fromTextArray(
      // headers: headers,
      data: data,
      border: null,
      //headerStyle: TextStyle(fontWeight: FontWeight.bold),
      //headerDecoration: BoxDecoration(color: PdfColors.blue700),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerLeft,
        3: Alignment.centerLeft,
        4: Alignment.centerLeft,
        5: Alignment.centerLeft,
      },
    );
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.items
        .map((item) => item.itemValue)
        .reduce((item1, item2) => item1 + item2);
    final vatPercent = invoice.items[5].itemValue;

    final total = vatPercent;

    return Container(
      //color: PdfColor.fromHex('#0260ff'),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildText(
                //   title: 'Net total',
                //   value: Utils.formatPrice(netTotal),
                //   unite: true,
                // ),
                // buildText(
                //   title: 'Vat ${vatPercent * 100} %',
                //   value: Utils.formatPrice(vat),
                //   unite: true,
                // ),
                // Divider(),
                buildText(
                  title: 'Amount',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: total.toString(),
                  unite: true,
                ),
                // SizedBox(height: 2 * PdfPageFormat.mm),
                // Container(height: 1, color: PdfColors.grey400),
                // SizedBox(height: 0.5 * PdfPageFormat.mm),
                // Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: 37 * PdfPageFormat.mm,
              color: PdfColor.fromHex('#0260ff'),
              child: Row(children: [
                SizedBox(
                  width: 3 * PdfPageFormat.mm,
                ),
                SizedBox(
                  width: 169 * PdfPageFormat.mm,
                  child: pw.Text(
                      'Disclaimer: Your transfer has been successful and beneficiary/ account will be credited.However this those not serve as confirmation of credit to the reciever factors such as internet connectivity efficiency/ blackout/ incorrect data/ delays may cause transaction interruption Cashflaskes is not liable to any such causes or any form related. All transactions are subject to AML checks',
                      style: TextStyle(color: PdfColors.white)),
                ),
                SizedBox(
                  width: 5 * PdfPageFormat.mm,
                )
              ]))

          // SizedBox(height: 2 * PdfPageFormat.mm),

          // Text('Disclaimer: Your transfer has beensuccessfulandbeneficiary/accountwillbecredited.However this those not serve as confirmation of credit to the reciever factors such as internet connectivity efficiency/blackout/incorrect data/delays may cause transaction interruption Cashflaskes is not liable to any such causes or any form related. All transactions are subject to AML checks'),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(
        fontWeight: FontWeight.bold, color: PdfColor.fromHex('#466371'));

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        Text(title, style: style),
        SizedBox(width: 0.5 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = TextStyle(
        fontWeight: FontWeight.normal, color: PdfColor.fromHex('#466371'));

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
