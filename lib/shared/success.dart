import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/shared/utils.dart';
import 'package:lottie/lottie.dart';
import '../component/buttons.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_routes.dart';
import 'pdf/interface.dart';
import 'pdf/model/model.dart';
import 'pdf/widget.dart';


class Success extends StatelessWidget {
  String head = 'Success';
  String body='Your sale offer has been successfully listed on the trafiat marketplace';

  String buttonText='back to dashboard';
  Success({required this.head, required this.body,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(255, 6, 44, 116),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset(
             
              AppImages.success,
            ),
            Column(
              children: [
                Text(head,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                      body,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      style:AppFonts.body1.copyWith(fontSize: 14)),
                ),
              ],
            ),

            Column(children: [Text('Download transaction reciept',style: AppFonts.bodyText.copyWith(fontSize: 16,color:Color.fromARGB(212, 255, 255, 255)),),
            SizedBox(height: 8,) ,
            GestureDetector(child: Image.asset('assets/images/icons/reciept.png',height: 50,color: Color.fromARGB(255, 235, 213, 14),),
            onTap: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      supplier: Supplier(
                        name: 'Sarah Field',
                        address: 'Sarah Street 9, Beijing, China',
                        paymentInfo: 'https://paypal.me/sarahfieldzz',
                      ),
                      customer: Customer(
                        name: 'Apple Inc.',
                        address: 'Apple Street, Cupertino, CA 95014',
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'Transfer from BNB to NGN bank account',
                        number: '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Transaction Type',
                          itemValue: 'Bank',
                         
                        ),
                        InvoiceItem(
                          description: 'Transaction Date',
                        
                            itemValue:Utils.formatDate(DateTime.now()),
                        ),
                      
                        InvoiceItem(
                          description: 'Beneficiary',
                            itemValue: 'Musa',
                        
                        ),
                        InvoiceItem(
                          description: 'Narration',
                             itemValue: 'Bank',
                        
                        ),
                        InvoiceItem(
                          description: 'Status',
                            itemValue: 'Success',
                        ),
                          InvoiceItem(
                          description: 'Credit Amount',
                            itemValue: '5,000',
                        
                        ),
                       
                      ],
                    );

                    final pdfFile = await PdfInvoiceApi.generate(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
           ],),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Button(text: buttonText.toUpperCase(), onPressed: AppRoutes.navbar)
            ),


          ],
        ),
      ),
    );
  }
}
