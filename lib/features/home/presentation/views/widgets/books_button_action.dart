import 'package:bookly_app/core/widgets/Custom_Button.dart';
import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksButtonAction extends StatelessWidget {
  const BooksButtonAction({super.key, required this.booksModel});
final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
       const   Expanded(
              child: CustomButton(
                
            text: "Free",
            backgoundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          )),
          Expanded(
              child: CustomButton(
                onPressed:() async {
                  //url_luncher بستخدم دى عشان اقدر افتح الكتاب من خلال لينك واستخدمت مكتبة 
                  Uri uri=Uri.parse(booksModel.volumeInfo.previewLink!);
                      if (await canLaunchUrl(uri) ) {
                       await launchUrl(uri);
                        }
                },
            text: getText(booksModel),
            backgoundColor:const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius:const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          )),
        ],
      ),
    );
  }
  
 String getText(BooksModel booksModel) {
    if(booksModel.volumeInfo.previewLink==null){
        return 'Not Available';
    }else{
      return 'Preview';
    }
  }
}
 