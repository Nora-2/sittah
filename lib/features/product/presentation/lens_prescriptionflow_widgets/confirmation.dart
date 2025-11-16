

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/features/product/data/models/prescription_data.dart';

class ConfirmationScreen extends StatelessWidget {
  final PrescriptionData prescriptionData;
  
  const ConfirmationScreen({
    super.key,
    required this.prescriptionData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'هل هذا يناسب وصفتك الطبية؟',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '-SPH+ هي اي قيمة تكون بجوار قبل علامة +SPH+',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  Text(
                    '-SPH+ هي اي قيمة تكون بجوار قبل علامة -SPH+',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            _buildConfirmationTable(),
            SizedBox(height: 24.h),
            Row(
              children: [
                // Expanded(
                //   child: PrimaryButton(
                //     text: 'تأكيد',
                //     onPressed: () {
                //       // Handle confirmation
                //     },
                //   ),
                // ),
                SizedBox(width: 12.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'تعديل',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          _buildTableRow('SPH', 'OD', '-0.25'),
          _buildTableRow('', 'OS', '+1.00'),
          _buildTableRow('CYL', 'OD', '-0.50'),
          _buildTableRow('', 'OS', '-0.75'),
          _buildTableRow('SPH', 'OD', '-0.75'),
          _buildTableRow('', 'OS', '+1.25'),
          _buildTableRow('RX', 'OD', '+1.25'),
          _buildTableRow('', 'OS', '+2.00'),
          _buildTableRow('PD', '(R) 30.50', '(L) 30.50'),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'AXIS',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'CYL',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'SPH',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'RX',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String col1, String col2, String col3) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              col1,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              col2,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              col3,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
