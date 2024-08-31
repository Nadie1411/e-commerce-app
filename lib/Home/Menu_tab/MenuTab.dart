import 'package:e_commerce/Home/home_screen_components/product_card.dart';
import 'package:e_commerce/data/add_Icon.dart';
import 'package:e_commerce/data/heart_icon.dart';
import 'package:e_commerce/data/star_icon.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar : AppBar( toolbarHeight:140.h,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title:
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Style.smallAppLogo,
        SizedBox(height: 18.h,),
    Row(
    children: [
    Expanded(
    child: TextField(

    decoration: InputDecoration(
    labelText: "what do you search for?",
    labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300,color:AppColors.purpleColor ),

    prefixIcon:ImageIcon(AssetImage('assets/icon _search_.png'), color: AppColors.primaryColor,size:24.sp ,) ,

    enabledBorder: OutlineInputBorder(

    borderRadius: BorderRadius.circular(25),




    )
    ),
    ),
    ),
    IconButton(
    onPressed: (){},
    icon: Icon(Icons.shopping_cart_outlined),color: AppColors.primaryColor,)
    ],
    ),


    ]

    ),),

   body: Padding(
     padding: const EdgeInsets.all(8.0),
     child: GridView.builder(
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.9),

       itemBuilder: (context,child){
         return
           MenuProductCard();},

     ),
   ),

    ) ;


  }
}

