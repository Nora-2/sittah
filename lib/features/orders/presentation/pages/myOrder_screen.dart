import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/orders/data/models/order_model.dart';
import 'package:glasses/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:glasses/features/orders/presentation/cubit/orders_state.dart';
import 'package:glasses/features/orders/presentation/widgets/order_detailes_screen.dart';
import 'package:glasses/features/orders/presentation/widgets/reusable_widgets.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appcolors.gradient1,

              appcolors.whicolor,
              appcolors.whicolor,
              appcolors.whicolor,
              appcolors.whicolor,
              appcolors.whicolor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // -------------------- HEADER --------------------
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      "طلباتي",
                      style: TextStyle(
                        fontFamily: Appstring.fontfamily,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    final selected = state is OrdersLoaded
                        ? state.selectedFilter
                        : "all";

                    return SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.down,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(right: 16.w),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          _buildTab(context, "كل الطلبات", "all", selected),
                          _buildTab(context, "غير مدفوع", "unpaid", selected),
                          _buildTab(
                            context,
                            "قيد المعالجة",
                            "processing",
                            selected,
                          ),
                          _buildTab(
                            context,
                            "تم التوصيل",
                            "delivered",
                            selected,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: appcolors.whicolor,
                  child: BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) {
                      if (state is OrdersLoaded) {
                        return ListView.separated(
                          padding: EdgeInsets.all(8.w),
                          itemCount: state.orders.length,
                          separatorBuilder: (_, __) => SizedBox(height: 16.h),
                          itemBuilder: (context, index) {
                            return _OrderListItem(order: state.orders[index]);
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(
    BuildContext context,
    String text,
    String filterKey,
    String selected,
  ) {
    final isSelected = filterKey == selected;

    return GestureDetector(
      onTap: () {
        context.read<OrderCubit>().fetchOrders(filter: filterKey);
      },
      child: Container(
        width: 115.w, // <<< FIXED WIDTH — prevents infinite constraints
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected
                    ? appcolors.buttoncoloronboarding
                    : appcolors.graylinethrough,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),

            SizedBox(height: 12.h),

            // UNDERLINE – SAFE
            Container(
              width: double.infinity, // fills its fixed parent width
              height: 2.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? appcolors.buttoncoloronboarding
                    : appcolors.graylinethrough,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderListItem extends StatefulWidget {
  final OrderModel order;
  const _OrderListItem({required this.order});

  @override
  State<_OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<_OrderListItem> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "رقم الطلب: #${widget.order.id}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: appcolors.textMain,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      widget.order.date,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: appcolors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Center(child: StatusBadge(status: widget.order.status)),
              Padding(
                padding: EdgeInsets.only(top: 8.h, left: 10, right: 20),
                child: GestureDetector(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                  behavior: HitTestBehavior.opaque,
                  child: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: appcolors.textGrey,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: const Divider(thickness: 1, color: appcolors.divider),
          ),
          if (_isExpanded) ...[
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 68.w,
                  height: 80.h,

                  decoration: BoxDecoration(
                    color: appcolors.graylinethrough.withOpacity(.2),
                    image: DecorationImage(
                      image: AssetImage(Appimage.productBrown),
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                SizedBox(width: 5.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.order.productName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      textAlign: TextAlign.end,
                      widget.order.productDetails,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: appcolors.textGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(AppIcons.trash),
                      onTap: () {},
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textDirection: TextDirection.rtl,
                      'X1',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: Appstring.fontfamily,
                        color: appcolors.buttoncoloronboarding,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textDirection: TextDirection.rtl,
                      '${widget.order.total.toStringAsFixed(0)} د.ع',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: Appstring.fontfamily,
                        color: appcolors.buttoncoloronboarding,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              OrderDetailsScreen(order: widget.order),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: appcolors.borderColor, borderRadius: BorderRadius.circular(25.r)),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'تفاصيل الطلب',
                            style: TextStyle(
                              color: appcolors.black,
                              fontFamily: Appstring.fontfamily,
                              
                            ),
                          ),
                          Icon(MyFlutterApp.arrow_left,color: appcolors.black,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: AppButton(
                    title: "اعادة الطلب",
                    bgColor: appcolors.buttoncoloronboarding,
                    textColor: appcolors.primarycolor,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

