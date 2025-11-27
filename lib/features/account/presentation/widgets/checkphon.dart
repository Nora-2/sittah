import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/authantication/data/models/countryflag_model.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';
import 'package:glasses/features/authantication/presentation/widgets/phoneauthfield.dart';

void showCustomDialogphone(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return _SizeSelectorSheet();
    },
  );
}

class _SizeSelectorSheet extends StatefulWidget {
  const _SizeSelectorSheet();

  @override
  State<_SizeSelectorSheet> createState() => _SizeSelectorSheetState();
}

class _SizeSelectorSheetState extends State<_SizeSelectorSheet> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.3,
      maxChildSize: 0.35,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(8.0),
              child: Column(
              
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                     
                   'التحقق من رقم هاتفك',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: Appstring.fontfamily,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'رقم الهاتف',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: Appstring.fontfamily,
                    ),
                  ),
                  SizedBox(height: 20.h),
               Phoneauthwidget(value: countries[0], controller: phone),
                  SizedBox(height: 20.h),
                  AuthButton(
                    text: 'ارسال',
                    onPressed: () {},
                    icon: MyFlutterApp.arrow_left,
                    color: appcolors.primarycolor,
                    backgroundColor: appcolors.buttoncoloronboarding,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
