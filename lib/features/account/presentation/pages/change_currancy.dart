import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';
import 'package:glasses/features/account/data/models/change_currancy.dart';

class CurrencyCubit extends Cubit<int> {
  CurrencyCubit() : super(0);

  void selectCurrency(int id) => emit(id);
}

class ChangeCurrencyScreen extends StatelessWidget {
  ChangeCurrencyScreen({super.key});

  final List<CurrencyModel> currencies = [
    CurrencyModel(0, "د.ع", Appimage.flag1),
    CurrencyModel(1, "ريال سعودي", Appimage.flag2),
    CurrencyModel(2, "EUR", Appimage.flag3),
    CurrencyModel(3, "AUD", Appimage.flag4),
    CurrencyModel(4, "CAD", Appimage.flag5),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => CurrencyCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appcolors.gradient1,
                // appcolors.gradient2,
                appcolors.whicolor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: 100.h,

                  alignment: Alignment.center,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios, size: 18.sp),
                        color: appcolors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'تغيير العملة',
                        style: TextStyle(
                          fontFamily: Appstring.fontfamily,
                          fontSize: 17.sp,
                          color: appcolors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // balance right spacing
                    ],
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Container(
                      width: double.infinity,
                      height: height * 1.08,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 25,
                      ),
                      decoration: BoxDecoration(color: appcolors.whicolor),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: BlocBuilder<CurrencyCubit, int>(
                                builder: (context, selectedId) {
                                  return ListView.separated(
                                    itemCount: currencies.length,
                                    separatorBuilder: (c, i) => Divider(
                                      color: Colors.grey.shade200,
                                      height: 30.h,
                                    ),
                                    itemBuilder: (context, index) {
                                      final currency = currencies[index];
                                      final isSelected =
                                          selectedId == currency.id;
                                      return Padding(
                                        padding: EdgeInsets.only(top: 30.h),
                                        child: InkWell(
                                          onTap: () => context
                                              .read<CurrencyCubit>()
                                              .selectCurrency(currency.id),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                Colors.transparent,
                                              ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 24.w,
                                                height: 24.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: isSelected
                                                        ? appcolors
                                                              .buttoncoloronboarding
                                                        : Colors.grey.shade300,
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: isSelected
                                                    ? Center(
                                                        child: Container(
                                                          width: 16.w,
                                                          height: 16.w,
                                                          decoration: BoxDecoration(
                                                            color: appcolors
                                                                .buttoncoloronboarding,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              const Spacer(),
                                              // Currency Name
                                              Text(
                                                currency.name,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              SizedBox(width: 12.w),
                                              // Flag (Right Side)
                                              Container(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  currency.code,
                                                  fit: BoxFit.fill,
                                                  width: 60.w,
                                                  height: 60.w,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Custombutton(
                              text: "تغيير العملة",
                              onPressed: () {},
                              icon: AppIcons.moneyChange,
                              color: appcolors.primarycolor,
                              backgroundColor: appcolors.buttoncoloronboarding,
                            ),
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
      ),
    );
  }
}
