import 'package:e_commerce/Home/home_screen_components/Image_slider.dart';
import 'package:e_commerce/Home/home_screen_components/Image_sliderSmall.dart';
import 'package:e_commerce/Home/home_screen_components/categories.dart';
import 'package:e_commerce/Home/home_screen_components/product_card.dart';
import 'package:e_commerce/data/add_Icon.dart';
import 'package:e_commerce/data/heart_icon.dart';
import 'package:e_commerce/data/star_icon.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/app_fonts.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenTab extends StatelessWidget {

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

        ),) ,
     body:
     SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start ,
         children: [
           ImageSlider(),
           SizedBox(height: 8.h,),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal:16.w ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
       
                      Text('Categories',style: AppFonts.appFont.bodyMedium!.copyWith(color: AppColors.primaryColor,fontSize: 18.sp)),
       
                      TextButton(
                          onPressed: (){},
                          child: Text('View all',style: AppFonts.appFont.bodySmall!.copyWith(color: AppColors.primaryColor,fontSize: 12.sp,fontWeight: FontWeight.bold)))
               ],
       
             ),
       
           ),
           SizedBox(height: 16.h,),
           SizedBox(
             height:176 .h,



             child:ListView.builder(

               itemCount: 8,
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context,index){
                 return Column(

                   children: [
                     ElevatedButton(

                         onPressed: () {  },
                         style: ElevatedButton.styleFrom(


                             shape: CircleBorder(),     // Circular shape
                             padding: EdgeInsets.symmetric(horizontal: 5.w , vertical: 16.h), // Padding inside the button
                             elevation: 0,
                             backgroundColor: Colors.blueAccent// Remove shadow if not needed
                         ),
                         child: SizedBox(
                           width: 100.w,
                           height: 100.h,




                         )),
                     Text('name',style: AppFonts.appFont.bodySmall!.copyWith(color: AppColors.primaryColor,fontSize: 14.sp,fontWeight: FontWeight.w400))

                   ],
                 );
               }),


     ),
           SizedBox(
         height:176 .h,



         child: ListView.builder(

             itemCount: 8,
             shrinkWrap: true,
             scrollDirection: Axis.horizontal,
             itemBuilder: (context,index){
               return Column(

                 children: [
                   ElevatedButton(

                     onPressed: () {  },
               style: ElevatedButton.styleFrom(


               shape: CircleBorder(),     // Circular shape
                   padding: EdgeInsets.symmetric(horizontal: 5.w , vertical: 16.h), // Padding inside the button
                   // Padding inside the button
               elevation: 0,
                 backgroundColor: Colors.blueAccent// Remove shadow if not needed
               ),
               child: SizedBox(
               width: 100.w,
               height: 100.h,




               )),
                   Text('name',style: AppFonts.appFont.bodySmall!.copyWith(color: AppColors.primaryColor,fontSize: 14.sp,fontWeight: FontWeight.w400))

                 ],
               );
             }),


       ),

           SizedBox(height: 10.h,),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 16.w),
             child: Text('Home Appliance',style: AppFonts.appFont.bodyMedium!.copyWith(color: AppColors.primaryColor,fontSize: 18.sp)),
           ),

          
           SizedBox(

    height: 327.h,
    child: ListView.builder(

      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return Padding(
          padding:EdgeInsets.symmetric(horizontal:0.w ,vertical:16.h ),
          child: ProductCard(),
        );
      }
    ),
  ),
           SizedBox(height: 8.h),
           ImageSlidersmall(),
           SizedBox(height: 16.h),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 16.w),
             child: Text('New Arrival',style: AppFonts.appFont.bodyMedium!.copyWith(color: AppColors.primaryColor,fontSize: 18.sp)),
           ),

           SizedBox(

             height: 327.h,
             child: ListView.builder(

                 itemCount: 3,
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index){
                   return Padding(
                     padding:EdgeInsets.symmetric(horizontal:0.w ,vertical:16.h ),
                     child: ProductCard(),
                   );
                 }
             ),
           ),
           SizedBox(height: 16.h),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 16.w),
             child: Text('Smart Watch',style: AppFonts.appFont.bodyMedium!.copyWith(color: AppColors.primaryColor,fontSize: 18.sp)),
           ),

           SizedBox(

             height: 327.h,
             child: ListView.builder(

                 itemCount: 3,
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index){
                   return Padding(
                     padding:EdgeInsets.symmetric(horizontal:0.w ,vertical:16.h ),
                     child: ProductCard(),
                   );
                 }
             ),
           ),






         ],
       ),
       
       

     ),



    );



  }
}























































//     return Scaffold(
//
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar( toolbarHeight: MediaQuery.of(context).size.height*0.1,
//           automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         title:
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Style.smallAppLogo,
//             SizedBox(height: 8,),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//
//                     decoration: InputDecoration(
//                         labelText: "what do you search for?",
//                         prefixIcon:Icon(Icons.search_rounded, color: AppColors.primaryColor,) ,
//                         suffix: Icon(Icons.shopping_cart_outlined),
//
//                         enabledBorder: OutlineInputBorder(
//
//                           borderRadius: BorderRadius.circular(120),
//                           borderSide: BorderSide(color: AppColors.primaryColor, width: 1,style: BorderStyle.solid),
//
//
//
//
//                         )
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: (){},
//                   icon: Icon(Icons.shopping_cart_outlined),color: AppColors.primaryColor,)
//               ],
//             ),
//
//
//           ]
//
//         ),) ,
//
//

//       body:
//
//
//       SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//
//              width: MediaQuery.of(context).size.width*1,
//               child: Padding(
//                 padding:  EdgeInsets.only(top: 16.h),
//                 child: ImageSlider(),
//               ),
//             ),
//             SizedBox(height: 12.h,)
//             ,Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 16.h,vertical: 2),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//
//                   Text('Categories',style: AppFonts.appFont.bodyMedium!.copyWith(color: AppColors.primaryColor,fontSize: 18)),
//
//                   TextButton(
//                       onPressed: (){},
//                       child: Text('View all',style: AppFonts.appFont.bodySmall!.copyWith(color: AppColors.primaryColor,fontSize: 12,fontWeight: FontWeight.bold)))
//                 ],
//               ),
//             ),
//                 SizedBox(height: 16.h),
//
//                 SizedBox( height: 120.h,
//                     width: 30.w,
//                     child: Padding(
//                       padding:  EdgeInsets.only(left: 16.0.w),
//                       child: Categories(categories:[Category(name: 'name', image: 'assets/Frame 79.png'),
//                         Category(name: 'name', image: 'assets/Frame 79.png'),
//                         Category(name: 'name', image: 'assets/Frame 79.png'),
//                         Category(name: 'name', image: 'assets/Frame 79.png'),
//                         Category(name: 'name', image: 'assets/Frame 79.png'),
//                       ],),
//
//                     )),
//             SizedBox(height: 30.h),
//
//             SizedBox( height: 100.h,
//             width: 30.w,
//             child: Padding(
//             padding:  EdgeInsets.only(left: 16.0.w),
//             child: Categories(categories:
//             [Category(name: 'name', image: 'assets/Frame 79.png'),
//         Category(name: 'name', image: 'assets/Frame 79.png'),
//             Category(name: 'name', image: 'assets/Frame 79.png'),
//             Category(name: 'name', image: 'assets/Frame 79.png'),
//         Category(name: 'name', image: 'assets/Frame 79.png'),]))
//
//
//             ),
//           SizedBox(height: 24.h,),
//
//             Padding(
//               padding:  EdgeInsets.only(left: 16.h),
//               child: Text('Home Appliance',style: AppFonts.appFont.bodyMedium!.copyWith(color: AppColors.primaryColor,fontSize: 18)),
//             ),
//             ProductCard()
//
//
//           ],
//
//
//         ),
//
//       ),
//
//
//     );
//   }
// }
