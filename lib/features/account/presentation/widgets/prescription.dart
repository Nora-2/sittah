import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/product/presentation/lens_prescriptionflow_widgets/pdproperity.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  // --- STATE VARIABLES ---

  // RX Values
  String odSph = '+0.75';
  String odCyl = '-1.00';
  String odAxis = '5';
  String osSph = '+1.25';
  String osCyl = '-0.50';
  String osAxis = '3';

  // PD Values
  String pdRight = '+1.25';
  String pdLeft = '+1.25';
  bool hasTwoNumbers = true;

  // Prism Horizontal
  String hPrismOdVal = '+0.75';
  String hPrismOdDir = 'اختار'; // "Select"
  String hPrismOsVal = '+0.75';
  String hPrismOsDir = 'اختار';

  // Prism Vertical
  String vPrismOdVal = '+0.75';
  String vPrismOdDir = 'اختار';
  String vPrismOsVal = '+0.75';
  String vPrismOsDir = 'اختار';

  // --- DATA LISTS ---
  final List<String> sphOptions = [
    '+2.00',
    '+1.75',
    '+1.50',
    '+1.25',
    '+1.00',
    '+0.75',
    '+0.50',
    '+0.25',
    '0.00',
    '-0.25',
    '-0.50',
    '-0.75',
    '-1.00',
  ];
  final List<String> axisOptions = List.generate(
    180,
    (index) => (index + 1).toString(),
  );
  final List<String> prismDirOptions = [
    'In',
    'Out',
    'Up',
    'Down',
  ]; // Or Arabic equivalents

  // --- BOTTOM SHEET ---
  void _showBottomSheet({
    required String title,
    required String currentValue,
    required List<String> options,
    required Function(String) onSelect,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'حفظ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: appcolors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    final isSelected = option == currentValue;
                    return InkWell(
                      onTap: () {
                        onSelect(option);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected ? Colors.black : Colors.grey[400],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  appcolors.gradient1,
                  appcolors.gradient2,
                  appcolors.whicolor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    height: 80.h,
          
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
                          color: appcolors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'الوصفة الطبية',
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
                  Padding(
                      padding: EdgeInsets.only(top: height * 0.1),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            _buildSectionContainer(
                              children: [
                                _buildHeaderRow(['RX', 'SPH', 'CYL', 'AXIS']),
                                _buildDataRow(
                                  label: 'OD',
                                  subLabel: '(يمين)',
                                  val1: odSph,
                                  val2: odCyl,
                                  val3: odAxis,
                                  onTap1: () => _openPicker(
                                    'SPH OD',
                                    odSph,
                                    sphOptions,
                                    (v) => setState(() => odSph = v),
                                  ),
                                  onTap2: () => _openPicker(
                                    'CYL OD',
                                    odCyl,
                                    sphOptions,
                                    (v) => setState(() => odCyl = v),
                                  ),
                                  onTap3: () => _openPicker(
                                    'AXIS OD',
                                    odAxis,
                                    axisOptions,
                                    (v) => setState(() => odAxis = v),
                                  ),
                                ),
                                _buildDataRow(
                                  label: 'OS',
                                  subLabel: '(يسار)',
                                  val1: osSph,
                                  val2: osCyl,
                                  val3: osAxis,
                                  isLast: true,
                                  onTap1: () => _openPicker(
                                    'SPH OS',
                                    osSph,
                                    sphOptions,
                                    (v) => setState(() => osSph = v),
                                  ),
                                  onTap2: () => _openPicker(
                                    'CYL OS',
                                    osCyl,
                                    sphOptions,
                                    (v) => setState(() => osCyl = v),
                                  ),
                                  onTap3: () => _openPicker(
                                    'AXIS OS',
                                    osAxis,
                                    axisOptions,
                                    (v) => setState(() => osAxis = v),
                                  ),
                                ),
                              ],
                            ),
          
                            const SizedBox(height: 20),
          
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  'المسافة الحدقية',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: Appstring.fontfamily,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset(
                                  AppIcons.questionMark,
                                  color: appcolors.grey66,
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: PDSelector(),
                            ),
          
                            // Checkbox
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: hasTwoNumbers,
                                      activeColor: appcolors.buttonColor,
                                      onChanged: (val) =>
                                          setState(() => hasTwoNumbers = val!),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'لدي رقمين',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
          
                            const SizedBox(height: 20),
          
                            // 3. PRISM HEADER
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'منشور',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    SvgPicture.asset(
                                      AppIcons.questionMark,
                                      color: appcolors.grey66,
                                    ),
                                  ],
                                ),
                                TextButton.icon(
                                  iconAlignment: IconAlignment.end,
                                  onPressed: () {
                                    // Reset logic here
                                  },
                                  icon: SvgPicture.asset(
                                    AppIcons.trash,
                                    color: Colors.red,
                                    width: 16,
                                    height: 16,
                                  ),
                                  label: const Text(
                                    'مسح',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
          
                            // 4. PRISM HORIZONTAL TABLE
                            _buildSectionContainer(
                              children: [
                                _buildHeaderRow(
                                  ['RX', 'المنشور الأفقي', 'اتجاه القاعدة'],
                                  columnFlex: [1, 2, 2],
                                ),
                                _buildDataRow(
                                  label: 'OD',
                                  subLabel: '(يمين)',
                                  val1: hPrismOdVal,
                                  val2: hPrismOdDir,
                                  val3: null, // null val3 means only 2 dropdowns
                                  columnFlex: [1, 2, 2],
                                  onTap1: () => _openPicker(
                                    'Prism H OD',
                                    hPrismOdVal,
                                    sphOptions,
                                    (v) => setState(() => hPrismOdVal = v),
                                  ),
                                  onTap2: () => _openPicker(
                                    'Dir OD',
                                    hPrismOdDir,
                                    prismDirOptions,
                                    (v) => setState(() => hPrismOdDir = v),
                                  ),
                                  onTap3: null,
                                ),
                                _buildDataRow(
                                  label: 'OS',
                                  subLabel: '(يسار)',
                                  val1: hPrismOsVal,
                                  val2: hPrismOsDir,
                                  val3: null,
                                  isLast: true,
                                  columnFlex: [1, 2, 2],
                                  onTap1: () => _openPicker(
                                    'Prism H OS',
                                    hPrismOsVal,
                                    sphOptions,
                                    (v) => setState(() => hPrismOsVal = v),
                                  ),
                                  onTap2: () => _openPicker(
                                    'Dir OS',
                                    hPrismOsDir,
                                    prismDirOptions,
                                    (v) => setState(() => hPrismOsDir = v),
                                  ),
                                  onTap3: null,
                                ),
                              ],
                            ),
          
                            const SizedBox(height: 15),
          
                            // 5. PRISM VERTICAL TABLE
                            _buildSectionContainer(
                              children: [
                                _buildHeaderRow(
                                  ['RX', 'المنشور الرأسي', 'اتجاه القاعدة'],
                                  columnFlex: [1, 2, 2],
                                ),
                                _buildDataRow(
                                  label: 'OD',
                                  subLabel: '(يمين)',
                                  val1: vPrismOdVal,
                                  val2: vPrismOdDir,
                                  val3: null,
                                  columnFlex: [1, 2, 2],
                                  onTap1: () => _openPicker(
                                    'Prism V OD',
                                    vPrismOdVal,
                                    sphOptions,
                                    (v) => setState(() => vPrismOdVal = v),
                                  ),
                                  onTap2: () => _openPicker(
                                    'Dir OD',
                                    vPrismOdDir,
                                    prismDirOptions,
                                    (v) => setState(() => vPrismOdDir = v),
                                  ),
                                  onTap3: null,
                                ),
                                _buildDataRow(
                                  label: 'OS',
                                  subLabel: '(يسار)',
                                  val1: vPrismOsVal,
                                  val2: vPrismOsDir,
                                  val3: null,
                                  isLast: true,
                                  columnFlex: [1, 2, 2],
                                  onTap1: () => _openPicker(
                                    'Prism V OS',
                                    vPrismOsVal,
                                    sphOptions,
                                    (v) => setState(() => vPrismOsVal = v),
                                  ),
                                  onTap2: () => _openPicker(
                                    'Dir OS',
                                    vPrismOsDir,
                                    prismDirOptions,
                                    (v) => setState(() => vPrismOsDir = v),
                                  ),
                                  onTap3: null,
                                ),
                              ],
                            ),
          
                            const SizedBox(height: 25),
          
                            Row(
                              children: [
                                const Text(
                                  'صورة الوصفة الطبية:',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Row(
                                  children: List.generate(
                                    4,
                                    (index) => Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      width: 40,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Image.asset(Appimage.productBrown),
                                    ),
                                  ),
                                ),
                              ],
                            ),
          
                            const SizedBox(height: 30),
          
                            // 7. SUBMIT BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 54,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      appcolors.buttoncoloronboarding,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'اضافة وصفة جديدة',
                                  style: TextStyle(
                                    color: appcolors.primarycolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- HELPER METHODS ---

  void _openPicker(
    String title,
    String current,
    List<String> opts,
    Function(String) onSet,
  ) {
    _showBottomSheet(
      title: title,
      currentValue: current,
      options: opts,
      onSelect: onSet,
    );
  }

  Widget _buildSectionContainer({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildHeaderRow(List<String> titles, {List<int>? columnFlex}) {
    // Default flex is 1 for all columns if not provided
    columnFlex ??= List.filled(titles.length, 1);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [appcolors.headerGradientStart, appcolors.headerGradientEnd],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(titles.length, (index) {
            return Expanded(
              flex: columnFlex![index],
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  border: index < titles.length - 1
                      ? const Border(
                          left: BorderSide(color: appcolors.borderGray),
                        )
                      : null,
                ),
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: appcolors.textDark,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildDataRow({
    required String label,
    required String subLabel,
    required String val1,
    required String val2,
    required String? val3,
    required VoidCallback onTap1,
    required VoidCallback onTap2,
    required VoidCallback? onTap3,
    List<int>? columnFlex,
    bool isLast = false,
  }) {
    // Structure: [Label, Val1, Val2, Val3] (RTL visual flow)
    // But in code (LTR), the first item is the Label (RX column), then values.

    // If the header was [RX, SPH, CYL, AXIS]
    // The Row children should be [_buildSideLabel, _buildDropdown, _buildDropdown, _buildDropdown]

    // Default flex logic for 4 columns: [1, 1, 1, 1]
    columnFlex ??= [1, 1, 1, 1];

    return Container(
      decoration: BoxDecoration(
        border: const Border(top: BorderSide(color: appcolors.borderGray)),
        borderRadius: isLast
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            : null,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // 1. Label Column (RX)
            Expanded(
              flex: columnFlex[0],
              child: _buildSideLabel(label, subLabel, isLast: isLast),
            ),

            // 2. Value 1
            Expanded(
              flex: columnFlex[1],
              child: _buildDropdownCell(value: val1, onTap: onTap1),
            ),

            // 3. Value 2
            Expanded(
              flex: columnFlex[2],
              child: _buildDropdownCell(value: val2, onTap: onTap2),
            ),

            // 4. Value 3 (Optional)
            if (val3 != null && onTap3 != null)
              Expanded(
                flex: columnFlex[3],
                child: _buildDropdownCell(
                  value: val3,
                  onTap: onTap3,
                  isLastCell: true,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideLabel(
    String label,
    String subLabel, {
    bool isLast = false,
    bool isSingleLine = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [appcolors.headerGradientStart, appcolors.headerGradientEnd],
        ),
        borderRadius: isSingleLine
            ? const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            : isLast
            ? const BorderRadius.only(bottomRight: Radius.circular(12))
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: appcolors.textDark,
            ),
          ),
          if (subLabel.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              subLabel,
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDropdownCell({
    required String value,
    required VoidCallback onTap,
    bool isLastCell = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: isLastCell
              ? null
              : const Border(left: BorderSide(color: appcolors.borderGray)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: appcolors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
