import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';

class ArabicFormSection extends StatefulWidget {
  const ArabicFormSection({super.key});

  @override
  State<ArabicFormSection> createState() => _ArabicFormSectionState();
}

class _ArabicFormSectionState extends State<ArabicFormSection> {
  bool keepPrescription = false;
  bool twonum = false;
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Checkbox(
              value: twonum,
              onChanged: (bool? newValue) {
                setState(() {
                  twonum = newValue ?? false;
                });
              },
              activeColor: appcolors.buttoncoloronboarding,
              side: BorderSide(color: Colors.grey[400]!),
            ),
            const Text(
              'لدي رقمين',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),

        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width:12.w),
            const Text(
              '  منشور',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SvgPicture.asset(AppIcons.questionMark, color: appcolors.grey66),

            Spacer(),
            TextButton.icon(
              onPressed: () {
                // Add functionality
              },
              icon: const Icon(Icons.add, size: 18, color: Colors.grey),
              label: const Text(
                'إضافة',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Checkbox
        Row(
          textDirection: TextDirection.rtl,
         
          children: [
            Checkbox(
              value: keepPrescription,
              onChanged: (bool? newValue) {
                setState(() {
                  keepPrescription = newValue ?? false;
                });
              },
              activeColor: appcolors.buttoncoloronboarding,
              side: BorderSide(color: Colors.grey[400]!),
            ),
            const Text(
              'احفظ الوصفة الطبية',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // "اترك رسالتك" section
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'اترك رسالتك ( اختياري )',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: messageController,
              textAlign: TextAlign.right,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'اكتب أي ملاحظة لك',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: appcolors.bottompartmanual,
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
