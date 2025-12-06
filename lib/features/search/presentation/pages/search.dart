import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glasses/core/utils/appcolors/app_colors.dart';
import 'package:glasses/core/utils/appicons/app_icons.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';
import 'package:glasses/core/utils/widgets/custom_button.dart';
import 'package:glasses/core/utils/widgets/my_flutter_app_icons.dart';
import 'package:glasses/features/search/data/models/search_product_model.dart';
import 'package:glasses/features/search/presentation/cubit/search_cubit.dart';

// Main Screen
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().loadInitialData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                     Appstring.search,
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
              SingleChildScrollView(
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
                    child: Column(
                      children: [
                        _buildSearchBar(),
                        Expanded(
                          child: BlocBuilder<SearchCubit, SearchState>(
                            builder: (context, state) {
                              if (state is SearchInitial ||
                                  state is SearchSuccess) {
                                return _buildDefaultState(state);
                              } else if (state is SearchLoading) {
                                return _buildActiveState();
                              } else if (state is SearchEmpty) {
                                return _buildEmptyState();
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Container(
          height: 40.h,

          decoration: BoxDecoration(
            color: appcolors.whicolor,
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          child: TextField(
            controller: _searchController,
            focusNode: _focusNode,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: Appstring.searchtext,
              hintStyle: TextStyle(
                color: Color(0xffB3B3B3).withOpacity(.6),
                fontSize: 13.sp,
                fontFamily: 'Montserrat',
              ),
              prefixIcon: IconButton(
                icon: SvgPicture.asset(AppIcons.search),
                onPressed: () {
                  _searchController.clear();
                  context.read<SearchCubit>().searchProducts('');
                },
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: SvgPicture.asset(
                        AppIcons.close,
                        color: appcolors.black,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        context.read<SearchCubit>().searchProducts('');
                      },
                    )
                  : null,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide(color: appcolors.black),
              ),
            ),
            onChanged: (value) {
              setState(() {});
              context.read<SearchCubit>().searchProducts(value);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultState(SearchState state) {
    final List<Productsearch> products = state is SearchSuccess ? state.products : [];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppIcons.trash),
                Text(
                  Appstring.recentSearch,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: Appstring.fontfamily,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xffE8FAFC),
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(color: appcolors.buttoncoloronboarding),
            ),
            child: Text(
             Appstring.kidsGlasses,
              style: TextStyle(
                color: appcolors.buttoncoloronboarding,
                fontFamily: Appstring.fontfamily,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          _buildProductGrid(products),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
              Appstring.more ,
                style: TextStyle(fontFamily: Appstring.fontfamily),
              ),
              Icon(MyFlutterApp.arrow_left),
            ],
          ),
          SizedBox(height: 35.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
             Appstring.trendingSearches,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12.h),
          _buildPopularSearches(),
          SizedBox(height: 12.h),
          _buildPopularSearches(),
        ],
      ),
    );
  }

  Widget _buildProductGrid(List<Productsearch> products) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 75.w,
            margin: EdgeInsets.only(left: 12.w),
            child: Column(
              children: [
                Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      product.image,
                      width: 50.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 13.sp),
                  textAlign: TextAlign.center,
                ),
                Text(
                  product.price,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: appcolors.buttoncoloronboarding,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularSearches() {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSearchItem(Appstring.catEye),
        _buildSearchItem(Appstring.drivingLensesSearch),
        _buildSearchItem(Appstring.readingGlassesSearch),
      ],
    );
  }

  Widget _buildSearchItem(String title) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Text(title),
    );
  }

  Widget _buildActiveState() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildCategoryItem('نظارية'),
          _buildCategoryItem('فلوسيت'),
          _buildCategoryItem('اكسسوارا'),
          _buildCategoryItem('فلوسيت'),
          _buildCategoryItem('شنطو'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              IconButton(
                icon: SvgPicture.asset(AppIcons.search),
                onPressed: () {},
              ),
              Text(title, style: TextStyle(fontSize: 14.sp)),
            ],
          ),
        ),
        Divider(height: .5.h, color: appcolors.borderColor),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Image.asset(
              Appimage.emptysearch,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 150.h,
            ),

            SizedBox(height: 24.h),
            Text(
             Appstring.noResultsFound,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontFamily: Appstring.fontfamily,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
            Appstring.noResultsDescription,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[400],
                fontFamily: Appstring.fontfamily,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Custombutton(
              text: Appstring.searchAgain,
              onPressed: () {
                _searchController.clear();
                context.read<SearchCubit>().loadInitialData();
              },
              color: appcolors.primarycolor,
              backgroundColor: appcolors.buttoncoloronboarding,
              icon: AppIcons.search,
            ),
          ],
        ),
      ),
    );
  }
}
