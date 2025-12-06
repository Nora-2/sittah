import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

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

              appcolors.whicolor,
              appcolors.whicolor,
              appcolors.whicolor,
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
                      "تفاصيل العنوان",
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                 
                  ],
                ),
              ), Expanded(
                child: SingleChildScrollView(
            
                        child: Container(color: appcolors.whicolor,
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildLabel('الاسم بالكامل', isRequired: true),
                              CustomTextField(hintText: 'عبدالله احمد'),
                              
                              SizedBox(height: 16.h),
                              _buildLabel('رقم الهاتف', isRequired: true),
                              CustomTextField(hintText: '+20 01155856594'),
                                          
                              SizedBox(height: 16.h),
                              _buildLabel('المدينة', isRequired: true),
                              // Mock Dropdown look
                              Container(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey.shade300),
                                            borderRadius: BorderRadius.circular(8.r),
                                          ),
                                          child: Row(
                                            textDirection: TextDirection.rtl, 
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('القاهرة', style: TextStyle(fontSize: 14.sp)),
                                              Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20.sp),
                                            ],
                                          ),
                              ),
                                          
                              SizedBox(height: 16.h),
                              _buildLabel('العنوان بالكامل', isRequired: true),
                              CustomTextField(hintText: '30 شارع مصطفى حامد - شبرا مصر - القاهرة - الشقة الثانية'),
                                          
                              SizedBox(height: 16.h),
                              _buildLabel('شقة، جناح، إلخ', isRequired: false, isOptionalLabel: '(اختياري)'),
                              CustomTextField(hintText: '11'),
                            ],
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

  Widget _buildLabel(String text, {required bool isRequired, String? isOptionalLabel}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        textDirection: TextDirection.rtl,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(width: 4.w),
          if (isRequired)
            Text(' *', style: TextStyle(color: Colors.red, fontSize: 18.sp)),
          if (isOptionalLabel != null)
             Text(' $isOptionalLabel', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
        ],
      ),
    );
  }
}

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  
  // Simulated API Call
  Future<List<Map<String, dynamic>>> fetchAddresses() async {
    await Future.delayed(const Duration(seconds: 1)); // Network delay
    return [
      {
        "title": "المنزل",
        "tag": "اساسي",
        "tagColor": Color(0xffE8FAFC),
        "tagTextColor": appcolors.buttoncoloronboarding,
        "address": "30 شارع مصطفى حامد - شبرا مصر - القاهرة - الشقة الثانية",
        "phone": "+20 01155856594"
      },
      {
        "title": "العمل",
        "tag": "فرعي",
        "tagColor": Color(0xffF9FFE5), // Lime color
        "tagTextColor": Color(0xff506600),
        "address": "30 شارع مصطفى حامد - شبرا مصر - القاهرة - الشقة الثانية",
        "phone": "+20 01155856594"
      }
    ];
  }

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

              appcolors.whicolor,
              appcolors.whicolor,
              appcolors.whicolor,
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
                      "العناوين",
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                 
                  ],
                ),
              ),
 Expanded(
   child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchAddresses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFF004D4D)));
            }
            
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("لا توجد عناوين"));
            }
   
            final addresses = snapshot.data!;
   
            return Container(
              color: appcolors.whicolor,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 80.h),
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        return AddressCard(data: addresses[index]);
                      },
                    ),
                  ),
                  
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: CustomButton(
                        text: 'اضف عنوان جديد',
                        icon: AppIcons.addlocation,
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddressDetailsScreen(),
                            ),
                          );},
                      ),
                    ),
                  
                ],
              ),
            );
          },
        ),
 ),],
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const AddressCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: data['tagColor'],
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Text(
                  data['tag'],
                  style: TextStyle(color: data['tagTextColor'], fontSize: 12.sp, fontWeight: FontWeight.w500,fontFamily:Appstring.fontfamily),
                ),
              ),
              Text(
                data['title'],
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,fontFamily: Appstring.fontfamily),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.location),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  textDirection: TextDirection.rtl,
                  data['address'],
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey[700], height: 1.4,fontFamily:Appstring.fontfamily),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(AppIcons.call),
              SizedBox(width: 8.w),
              Text(
                data['phone'],
                style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
                textAlign: TextAlign.left, // Phone numbers usually LTR
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          
          Row(

            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [         _buildActionButton(AppIcons.edit, 'تعديل'),
              _buildActionButton(AppIcons.trash, 'حذف'),
           
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButton(String icon, String label) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(icon,color: Colors.grey, width: 16.w, height: 16.h),
        SizedBox(width: 4.w),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
      ],
    );
  }
}


class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        
        hintText: hintText,
hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(color: Colors.black, fontSize: 12.sp,),
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xFF004D4D)),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final String? icon;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: appcolors.buttoncoloronboarding ,// Dark Green
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
            SvgPicture.asset(icon!),
              SizedBox(width: 8.w),
            ],
            Text(
              text,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color:appcolors.primarycolor),
            ),
          ],
        ),
      ),
    );
  }
}