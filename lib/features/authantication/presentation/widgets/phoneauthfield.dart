import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/authantication/data/models/countryflag_model.dart';

class Phoneauthwidget extends StatelessWidget {
  const Phoneauthwidget({
    super.key,
    required this.value,
    required this.controller,
    this.onchanged,
  });
  final CountryCode value;
  final TextEditingController? controller;
  final Function(CountryCode?)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Country Code Dropdown with Flag
        Container(
          height: 42.h,
          
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
          
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<CountryCode>(
              value: value,
              icon: const Icon(Icons.keyboard_arrow_down, size: 20),
              dropdownColor: Colors.white,
              items: countries.map((country) {
                return DropdownMenuItem<CountryCode>(
                  value: country,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CountryFlag.fromCountryCode(
                        country.code,
                        width: 20.w,
                        height: 20.h,
                        shape: Circle(),
                      ),
                      // Text(country.flag, style: const TextStyle(fontSize: 22)),
                    ],
                  ),
                );
              }).toList(),
              selectedItemBuilder: (context) {
                return countries.map((country) {
                  return Row(
                    textDirection: TextDirection.rtl,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CountryFlag.fromCountryCode(
                        country.code,
                        width: 20.w,
                        height: 20.h,
                        shape: Circle(),
                      ),
                      // Text(country.flag, style: const TextStyle(fontSize: 22)),
                    ],
                  );
                }).toList();
              },
              onChanged: onchanged,
            ),
          ),
        ),

        Expanded(
          child: TextFormField(
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            obscureText: false,

            keyboardType: TextInputType.phone,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return Appstring.signupPhoneEmptyError;
              }
              String digitsOnly = v.replaceAll(RegExp(r'\D'), '');
              if (digitsOnly.length < 9 || digitsOnly.length > 10) {
                return Appstring.signupPhoneEmptyError;
              }
              return null;
            },
            cursorColor: appcolors.buttoncoloronboarding,
            decoration: InputDecoration(
              hintText: Appstring.enterPhone,
              hintStyle: TextStyle(color: appcolors.graylinethrough),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
                borderSide: BorderSide(
                  color: appcolors.textfieldborder,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
                borderSide: BorderSide(
                  color: appcolors.buttoncoloronboarding,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
