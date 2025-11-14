import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glasses/core/constants.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/authantication/presentation/widgets/auth_button.dart';

class GlassesFilterSheet extends StatefulWidget {
  const GlassesFilterSheet({super.key});

  static Future<Map<String, dynamic>?> show(BuildContext context) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const GlassesFilterSheet(),
    );
  }

  @override
  State<GlassesFilterSheet> createState() => _GlassesFilterSheetState();
}

class _GlassesFilterSheetState extends State<GlassesFilterSheet> {
  void toggleFilter(String category, String item) {
    setState(() {
      if (Constants.selectedFilters[category]!.contains(item)) {
        Constants.selectedFilters[category]!.remove(item);
      } else {
        Constants.selectedFilters[category]!.add(item);
      }
    });
  }

  void toggleColor(Color color) {
    setState(() {
      if (Constants.selectedColors.contains(color)) {
        Constants.selectedColors.remove(color);
      } else {
        Constants.selectedColors.add(color);
      }
    });
  }

  void resetFilters() {
    setState(() {
      Constants.selectedFilters.forEach((key, value) => value.clear());
      Constants.selectedColors.clear();
      Constants.priceRange = const RangeValues(200, 2000);
    });
  }

  void applyFilters() {
    Navigator.pop(context, {
      'filters': Constants.selectedFilters,
      'colors': Constants.selectedColors,
      'priceRange': Constants.priceRange,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: appcolors.whicolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),

                    _buildCheckboxRowSection(Appstring.type, 'type'),
                    _divider(),
                    _buildCheckboxRowSection(Appstring.size, 'size'),
                    _divider(),
                    _buildCheckboxRowSection(Appstring.material, 'material'),
                    _divider(),
                    _buildCheckboxRowSection(Appstring.frame, 'frame'),
                    _divider(),
                    _buildPriceSection(),
                    _divider(),
                    _buildColorSection(),
                    _divider(),
                    _buildCheckboxRowSection(Appstring.medicaldrug, 'features'),
                    SizedBox(height: 60.h),

                    // _buildActionButtons(),
                    AuthButton(
                      text: Appstring.customization,
                      onPressed: applyFilters,
                      color: appcolors.primarycolor,
                      icon: MyFlutterApp.filter_horizontal__3_,
                      backgroundColor: appcolors.buttoncoloronboarding,
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: resetFilters,
                      child: Container(
                        decoration: BoxDecoration(
                          color: appcolors.buttoncoloronboarding,
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: appcolors.whicolor,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.close,
                              height: 20.h,
                              width: 20.w,
                              color: appcolors.primarycolor,
                            ),
                            SizedBox(width: 7.w),
                            Text(
                              Appstring.ignore,
                              style: TextStyle(
                                color: appcolors.primarycolor,
                                fontSize: 14.sp,
                                fontFamily: Appstring.fontfamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _divider() => Divider(height: 20.h, color: Colors.grey.shade300);

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            Appstring.filter,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: appcolors.black,
              fontFamily: Appstring.fontfamily,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxRowSection(String title, String key) {
    final items = Constants.filterCategories[key]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: Appstring.fontfamily,
              color: appcolors.graylinethrough,
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 10.w,
          runSpacing: 4.h,
          children: items.map((item) {
            final isSelected = Constants.selectedFilters[key]!.contains(item);
            return InkWell(
              onTap: () => toggleFilter(key, item),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (_) => toggleFilter(key, item),
                    activeColor: appcolors.buttoncoloronboarding,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                  ),
                  Text(
                    item,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: Appstring.fontfamily,
                      color: appcolors.black2.withOpacity(.8),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Appstring.price,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text(
              'متوسط',

              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: appcolors.black,
                fontFamily: Appstring.fontfamily,
              ),
            ),
            Spacer(),
            Text(
              '${Constants.priceRange.end.toInt() - Constants.priceRange.start.toInt()} د.ع',

              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: appcolors.black,
                fontFamily: Appstring.fontfamily,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: Constants.priceRange,
          min: 0,
          max: 3000,

          activeColor: appcolors.buttoncoloronboarding,
          inactiveColor: Colors.grey.shade300,
          onChanged: (values) => setState(() => Constants.priceRange = values),
        ),
      ],
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Appstring.colors,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Wrap(
          alignment: WrapAlignment.end,
          spacing: 10.w,
          runSpacing: 10.h,
          children: Constants.colors.map((color) {
            final isSelected = Constants.selectedColors.contains(color);
            return GestureDetector(
              onTap: () => toggleColor(color),
              child: Container(
                width: 35.w,
                height: 35.w,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? appcolors.buttoncoloronboarding
                        : Colors.grey.shade300,
                    width: isSelected ? 3 : 2,
                  ),
                ),
                child: isSelected
                    ? Icon(Icons.check, color: appcolors.whicolor, size: 18)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
