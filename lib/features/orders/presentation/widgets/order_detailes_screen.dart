import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/orders/data/models/order_model.dart';
import 'package:glasses/features/orders/presentation/widgets/reusable_widgets.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appcolors.gradient1,
appcolors.gradient2,
              appcolors.whicolor,
              appcolors.whicolor,
              
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                       "تفاصيل الطلب",
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
       Expanded(
         child: SingleChildScrollView(
           
          child: Container(
            color: appcolors.whicolor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                
                  Text(
                        "رقم الطلب #${order.id}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: appcolors.textMain,
                        ),
                      ),
                  SizedBox(height: 24.h),
              
                  // Personal Details
                  SectionCard(
                    title: "التفاصيل الشخصية",
                    children: [
                      InfoRow(label: "الاسم :", value: order.userName),
                      InfoRow(label: "العنوان :", value: order.address),
                      InfoRow(label: "رقم الهاتف :", value: order.phone),
                    ],
                  ),
              
                  // Product Info
                  SectionCard(
                    title: "معلومات المنتج",
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70.w,
                            height: 70.w,
                            decoration: BoxDecoration(
                              color: appcolors.divider,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child:Image.asset(  Appimage.productBrown,fit: BoxFit.contain,),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              children: [
                                InfoRow(label: "الإطار :", value: "إيبوني"),
                                InfoRow(label: "اللون :", value: "أسود"),
                                InfoRow(
                                  label: "الكمية :",
                                  value: "x${order.quantity}",
                                ),
                                InfoRow(
                                  label: "السعر :",
                                  value: "${order.total} د.ع",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              
                  // Medical Prescription
                  SectionCard(
                    title: "الوصفة الطبية",
                    children: const [
                      InfoRow(label:"نظارات شمسية طبية", value:'67.90 د.ع' ),
                      InfoRow(label: "ملون (رمادي داكن)", value:'67.90 د.ع' ),
                      InfoRow(label: "متوسط المؤشر 1.57", value: "67.90 د.ع"),
                      InfoRow(label: "طلاء مضاد للانعكاس", value: "67.90 د.ع"),
                    ],
                  ),
              
                  // Order Details
                  SectionCard(
                    title: "تفاصيل الطلب",
                    children: [
                      const InfoRow(label: "طريقة الشحن :", value: "الشحن القياسي"),
                      const InfoRow(label: "طريقة الدفع :", value: "بطاقة الائتمان"),
                      InfoRow(label: "وقت الإنشاء :", value: order.date),
                      InfoRow(label: "وقت التسليم :", value: order.deliveryTime),
                    ],
                  ),
              
                  // Price Summary
                  SectionCard(
                    title: "إجمالي السعر",
                    children: [
                      InfoRow(
                        label: "المجموع الفرعي",
                        value: "${order.subtotal} د.ع",
                      ),
                      InfoRow(label: "الشحن القياسي", value: "${order.shipping} د.ع"),
                      InfoRow(label: "الضرائب المقدرة", value: "${order.tax} د.ع"),
                      const InfoRow(label: "توصيل بدون قلق", value: "1.62 د.ع"),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: const Divider(),
                      ),
                     
                    ],
                  ),
              
                  // Points Banner
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: appcolors.promocodeshare,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        SvgPicture.asset(AppIcons.blend,
                          width: 20.w,
                          height: 20.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "لقد حصلت على 6 نقاط من هذا الطلب",
                          style: TextStyle(
                            fontFamily: Appstring.fontfamily,
                            color: appcolors.tagTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
               ),
       ),
            ],
          ),
        ),
      ),
    );

  }
}

        // Quantity and Price Row
    