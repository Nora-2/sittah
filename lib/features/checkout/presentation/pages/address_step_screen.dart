import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/checkout/data/models/shippingaddress.dart';
import 'package:glasses/features/checkout/presentation/cubit/checkout_cubit.dart';

class AddressStepScreen extends StatefulWidget {
  const AddressStepScreen({super.key});

  @override
  State<AddressStepScreen> createState() => AddressStepScreenState();
}

class AddressStepScreenState extends State<AddressStepScreen> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _apartmentController = TextEditingController();
  String? _selectedCity;
  bool _isDefault = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'الحقول المطلوبة',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily:Appstring.fontfamily
            ),
          ),
          SizedBox(height: 24.h),
          _buildTextField(
            controller: _fullNameController,
            label: 'الاسم بالكامل',
            hint: 'ادخل اسمك بالكامل',
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _phoneController,
            label: 'رقم الهاتف',
            hint: 'ادخل رقم الهاتف',
            isRequired: true,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 16.h),
          _buildDropdown(
            label: 'المدينة',
            value: _selectedCity,
            hint: 'ادخل مدينتك',
            isRequired: true,
            onChanged: (value) => setState(() => _selectedCity = value),
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _addressController,
            label: 'العنوان بالكامل',
            hint: 'ادخل العنوان بالكامل',
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _apartmentController,
            label: 'شقة، جناح، إلخ (اختياري)',
            hint: 'ادخل رقم المنزل',
            isRequired: false,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تعيين كعنوان أساسي',
                style: TextStyle(fontSize: 14.sp,fontFamily: Appstring.fontfamily),
              ),
              SizedBox(width: 8.w),
              Checkbox(
                value: _isDefault,
                onChanged: (value) => setState(() => _isDefault = value!),
                activeColor:  appcolors.buttoncoloronboarding,
              ),
            ],
          ),
        ],
      ),
    );
  }
// Update the saveAddressToCubit method in AddressStepScreen:

void saveAddressToCubit() {


  // Validation check
  if (_fullNameController.text.trim().isEmpty ||
      _phoneController.text.trim().isEmpty ||
      _selectedCity == null ||
      _addressController.text.trim().isEmpty) {
  
    return;
  }



  final address = ShippingAddress(
    fullName: _fullNameController.text.trim(),
    phoneNumber: _phoneController.text.trim(),
    city: _selectedCity!,
    fullAddress: _addressController.text.trim(),
    apartmentNumber: _apartmentController.text.trim(),
    isDefault: _isDefault,
  );


  
  context.read<CheckoutCubit>().updateAddress(address);

}

// Also add this method to validate and show errors:
bool validateFields(BuildContext context) {
  if (_fullNameController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('يرجى إدخال الاسم بالكامل')),
    );
    return false;
  }
  
  if (_phoneController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('يرجى إدخال رقم الهاتف')),
    );
    return false;
  }
  
  if (_selectedCity == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('يرجى اختيار المدينة')),
    );
    return false;
  }
  
  if (_addressController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('يرجى إدخال العنوان بالكامل')),
    );
    return false;
  }
  
  return true;
}

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isRequired,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600,fontFamily: Appstring.fontfamily),
            ),
            if (isRequired)
              Text(' *', style: TextStyle(color: Colors.red, fontSize: 18.sp)),
          ],
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          textAlign: TextAlign.right,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14.sp,fontFamily: Appstring.fontfamily),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color:appcolors.buttoncoloronboarding),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required String hint,
    required bool isRequired,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600,fontFamily: Appstring.fontfamily),
            ),
            if (isRequired)
              Text(' *', style: TextStyle(color: Colors.red, fontSize: 18.sp)),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButton<String>(
                isExpanded: true,
                value: value,
                hint: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      hint,
                      style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                    ),
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child:  Icon(Icons.keyboard_arrow_down,color:Colors.grey[400] ,size: 30.sp,),
                ),
                onChanged: onChanged,
                items: ['القاهرة', 'الإسكندرية', 'الجيزة']
                    .map((city) => DropdownMenuItem(
                          value: city,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: Text(city, style: TextStyle(fontSize: 14.sp)),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _apartmentController.dispose();
    super.dispose();
  }
}
