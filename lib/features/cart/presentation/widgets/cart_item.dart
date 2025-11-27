import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/features/cart/data/models/productmodel.dart';
import 'package:glasses/features/cart/presentation/cubit/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.item, required this.index});

  final int index;
  final CartItem item;

  Widget _buildOption(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.keyboard_arrow_down, size: 16.sp,color:  Colors.grey[500]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(

        padding: EdgeInsets.only(left:6.w,top: 6,bottom: 6),

        decoration: BoxDecoration(
          color: appcolors.whicolor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(width: 1, color: appcolors.border),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
 Transform.scale(
      scale: 0.9,
      child: Checkbox(
        value: item.isSelected,
        checkColor: appcolors.whicolor,
        activeColor: appcolors.buttoncoloronboarding,
        onChanged: (_) {
          context.read<CartCubit>().toggleItemSelection(index);
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),),
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
            SizedBox(width: 8.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.product.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildOption(item.selectedOption1),
                _buildOption(item.selectedOption2),
                _buildOption(item.selectedOption3),
              ],
            ),
SizedBox(width: 5.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                GestureDetector(
                  child: SvgPicture.asset(AppIcons.trash),
                  onTap: () {
                    context.read<CartCubit>().removeItem(index);
                  },
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 26.h,

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.add, size: 12.sp),
                        onPressed: () {
                          context.read<CartCubit>().updateQuantity(
                            index,
                            item.quantity + 1,
                          );
                        },
                      ),

                      Text(
                        '${item.quantity}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.remove, size: 12.sp),
                        onPressed: () {
                          context.read<CartCubit>().updateQuantity(
                            index,
                            item.quantity - 1,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  textDirection: TextDirection.rtl,
                  '${item.product.price.toStringAsFixed(0)} د.ع',
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

        // Quantity and Price Row
      ),
    );
  }
}
