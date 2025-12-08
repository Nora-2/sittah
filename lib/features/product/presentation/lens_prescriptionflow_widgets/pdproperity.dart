import 'package:flutter/material.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';

class PDSelector extends StatefulWidget {
  const PDSelector({super.key});

  @override
  State<PDSelector> createState() => _PDSelectorState();
}

class _PDSelectorState extends State<PDSelector> {
  String pdRight = '+1.25';
  String pdLeft = '+1.25';

  final List<String> pdOptions = [
    '+0.00', '+0.25', '+0.50', '+0.75', '+1.00', '+1.25', '+1.50', 
    '+1.75', '+2.00', '+2.25', '+2.50', '+2.75', '+3.00', '+3.25', 
    '+3.50', '+3.75', '+4.00'
  ];

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
                      child: const Text(
                        'حفظ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: appcolors.pdsave,
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
    return Container(
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
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Right PD
            _buildDropdownCell(
              value: pdRight,
              onTap: () => _showBottomSheet(
                title: 'PD Right',
                currentValue: pdRight,
                options: pdOptions,
                onSelect: (value) => setState(() => pdRight = value),
              ),
            ),
            
            // Left PD
            _buildDropdownCell(
              value: pdLeft,
              onTap: () => _showBottomSheet(
                title: 'PD Left',
                currentValue: pdLeft,
                options: pdOptions,
                onSelect: (value) => setState(() => pdLeft = value),
              ),
            ),
            
            // PD Label
            _buildLabelCell('PD', isLast: true),
          ],
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
          borderRadius: isLast 
              ? null 
              : const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: isLast 
              ? null 
              : const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
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

  Widget _buildLabelCell(String label, {bool isLast = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan[50]!,
              Colors.blue[50]!,
            ],
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
