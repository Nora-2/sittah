import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/features/cart/data/models/productmodel.dart';
import 'package:glasses/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:glasses/features/cart/presentation/widgets/cart_item.dart';
import 'package:glasses/features/cart/presentation/widgets/ordersummary.dart';

void showCustomDialogseecart(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BlocProvider(
        create: (context) =>
            CartCubit()..loadDemoData(), 
        child: _SizeSelectorSheet(),
      );
    },
  );
}

class _SizeSelectorSheet extends StatefulWidget {
  const _SizeSelectorSheet();

  @override
  State<_SizeSelectorSheet> createState() => _SizeSelectorSheetState();
}

class _SizeSelectorSheetState extends State<_SizeSelectorSheet> {
  List items = [
    CartItem(
      product: Product(
        id: '1',
        name: 'نظارات ويستيل',
        image: '👓',
        price: 500.0,
        options: ['الأسود', 'جاحب الضوء الأزرق', 'نظارات غير طبية'],
      ),
      selectedOption1: 'الأسود',
      selectedOption2: 'جاحب الضوء الأزرق',
      selectedOption3: 'نظارات غير طبية',
    ),

    CartItem(
      product: Product(
        id: '2',
        name: 'نظارات ويستيل',
        image: '👓',
        price: 500.0,
        options: ['الأسود', 'جاحب الضوء الأزرق', 'نظارات غير طبية'],
      ),
      selectedOption1: 'الأسود',
      selectedOption2: 'جاحب الضوء الأزرق',
      selectedOption3: 'نظارات غير طبية',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.3,
      maxChildSize: 0.8,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CartItemWidget(item: items[index], index: index),
                      );
                    },
                  ),

                  SizedBox(height: 20.h),

                  Directionality(textDirection: TextDirection.rtl, child: OrderSummaryWidget(color: appcolors.whicolor)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
