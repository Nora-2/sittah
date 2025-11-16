
import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';

class PrescriptionSelector extends StatefulWidget {
  const PrescriptionSelector({super.key});

  @override
  State<PrescriptionSelector> createState() => _PrescriptionSelectorState();
}

class _PrescriptionSelectorState extends State<PrescriptionSelector> {
  // OD (Right Eye) values
  String odSph = '-0.75';
  String odCyl = '-1.00';
  String odAxis = '5';

  // OS (Left Eye) values
  String osSph = '+1.25';
  String osCyl = '-0.50';
  String osAxis = '3';

  // Options for dropdowns
  final List<String> sphOptions = [
    '+4.00', '+3.50', '+3.00', '+2.50', '+2.00', '+1.50', '+1.25', '+1.00',
    '+0.75', '+0.50', '+0.25', '0.00', '-0.25', '-0.50', '-0.75', '-1.00',
    '-1.25', '-1.50', '-2.00', '-2.50', '-3.00', '-3.50', '-4.00'
  ];

  final List<String> cylOptions = [
    '+2.00', '+1.50', '+1.00', '+0.75', '+0.50', '+0.25', '0.00',
    '-0.25', '-0.50', '-0.75', '-1.00', '-1.50', '-2.00', '-2.50', '-3.00'
  ];

  List<String> get axisOptions =>
      List.generate(180, (index) => (index + 1).toString());

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
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, size: 24),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child:  Text(
                        'حفظ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: appcolors.buttoncoloronboarding
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              
              
              // Options List
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isSelected 
                                ? FontWeight.bold 
                                : FontWeight.normal,
                            color: isSelected 
                                ? Colors.black 
                                : Colors.grey[400],
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
    return  Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 8),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.cyan[50]!,
                        Colors.blue[50]!,
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        _buildHeaderCell('AXIS'),
                        _buildHeaderCell('CYL'),
                        _buildHeaderCell('SPH'),
                        _buildHeaderCell('RX', isLast: true),
                      ],
                    ),
                  ),
                ),

                // OD Row
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        _buildDropdownCell(
                          value: odAxis,
                          onTap: () => _showBottomSheet(
                            title: 'AXIS OD',
                            currentValue: odAxis,
                            options: axisOptions,
                            onSelect: (value) => setState(() => odAxis = value),
                          ),
                        ),
                        _buildDropdownCell(
                          value: odCyl,
                          onTap: () => _showBottomSheet(
                            title: 'CYL OD',
                            currentValue: odCyl,
                            options: cylOptions,
                            onSelect: (value) => setState(() => odCyl = value),
                          ),
                        ),
                        _buildDropdownCell(
                          value: odSph,
                          isLast: true,
                          onTap: () => _showBottomSheet(
                            title: 'SPH OD',
                          
                            currentValue: odSph,
                            options: sphOptions,
                            onSelect: (value) => setState(() => odSph = value),
                          ),
                        ),
                        _buildLabelCell('OD', '(يمين)', isLast: true),
                      ],
                    ),
                  ),
                ),

                // OS Row
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey[200]!),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        _buildDropdownCell(
                          value: osAxis,
                          onTap: () => _showBottomSheet(
                            title: 'AXIS OS',
                            currentValue: osAxis,
                            options: axisOptions,
                            onSelect: (value) => setState(() => osAxis = value),
                          ),
                        ),
                        _buildDropdownCell(
                          value: osCyl,
                          onTap: () => _showBottomSheet(
                            title: 'CYL OS',
                            currentValue: osCyl,
                            options: cylOptions,
                            onSelect: (value) => setState(() => osCyl = value),
                          ),
                        ),
                        _buildDropdownCell(
                          value: osSph,
                          isLast: true,
                          onTap: () => _showBottomSheet(
                            title: 'SPH OS',
                            currentValue: osSph,
                            options: sphOptions,
                            onSelect: (value) => setState(() => osSph = value),
                          ),
                        ),
                        _buildLabelCell('OS', '(يسار)', isLast: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
     
    );
  }

  Widget _buildHeaderCell(String text, {bool isLast = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            right: isLast
                ? BorderSide.none
                : BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownCell({
    required String value,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: isLast
                ? BorderSide.none
                : BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.keyboard_arrow_down, 
                     size: 18, 
                     color: Colors.grey[600]),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabelCell(String label, String subtitle, {bool isLast = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
       decoration: BoxDecoration( gradient: LinearGradient(
                      colors: [
                        Colors.cyan[50]!,
                        Colors.blue[50]!,
                      ],
                    ),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}