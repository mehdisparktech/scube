import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/features/dashboard/presentation/provider/dashboard_providers.dart';
import 'package:scube/app/features/dashboard/presentation/widget/dashboard_second_widgets.dart';
import 'package:scube/app/shared/component/app_bar/common_appbar.dart';
import 'package:scube/app/shared/component/image/common_image.dart';
import 'package:scube/app/shared/component/text/common_text.dart';

class DashboardSecondScreen extends ConsumerWidget {
  const DashboardSecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardSecondProvider);
    final notifier = ref.read(dashboardSecondProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFE3EBF4), // Light blue-ish background
      appBar: CommonAppBar(
        title: "2nd Page",
        actions: [
          IconButton(
            onPressed: () {},
            icon: CommonImage(imageSrc: AppImages.bell, size: 24.sp),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          if (state.data == null) {
            return const SizedBox.shrink();
          }

          final data = state.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                children: [
                  // 1st Page Navigate Banner
                  GestureDetector(
                    onTap: () => context.pop(), // Assuming navigating back
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor, // Cyan-ish color
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText(
                            text: "1st Page Navigate",
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Main Card (Tabs + Chart + List)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.border, width: 2.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Tab Bar
                        DashboardTabBar(
                          selectedIndex: state.selectedTabIndex,
                          onTap: notifier.setTab,
                        ),

                        // Chart Section
                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            children: [
                              DonutChartSection(totalPower: data.totalPower),
                              SizedBox(height: 20.h),
                              SourceLoadToggle(
                                isSourceSelected: state.isSourceSelected,
                                onToggle: notifier.toggleSource,
                              ),
                              SizedBox(height: 20.h),
                              Divider(color: AppColors.border, thickness: 2.w),
                              SizedBox(height: 10.h),

                              // Data List
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: data.dataList.map((item) {
                                        return DataListCard(
                                          title: item.title,
                                          status: item.status,
                                          iconSrc: _getIconForType(item.type),
                                          iconColor: _getColorForType(
                                            item.type,
                                          ),
                                          data1: item.data1,
                                          data2: item.data2,
                                          statusColor: item.status == "Active"
                                              ? Colors.blue
                                              : Colors.red,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    flex: 2,
                                    child: CommonImage(
                                      imageSrc: AppImages.scroll,
                                      size: 250.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Bottom Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 3.5, // Flattened aspect ratio
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    children: [
                      ActionGridItem(
                        title: "Analysis Pro",
                        iconSrc: AppImages.chart,
                        iconColor: Colors.orange,
                      ),
                      ActionGridItem(
                        title: "G. Generator",
                        iconSrc: AppImages.generator, // Placeholder
                        iconColor: Colors.amber,
                      ),
                      ActionGridItem(
                        title: "Plant Summery",
                        iconSrc: AppImages.charge,
                        iconColor: Colors.orangeAccent,
                      ),
                      ActionGridItem(
                        title: "Natural Gas",
                        iconSrc: AppImages.fire,
                        iconColor: Colors.red,
                      ),
                      ActionGridItem(
                        title: "D. Generator",
                        iconSrc: AppImages.power,
                        iconColor: Colors.brown,
                      ),
                      ActionGridItem(
                        title: "Water Process",
                        iconSrc: AppImages.faucet,
                        iconColor: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getIconForType(String type) {
    switch (type) {
      case 'solar':
        return AppImages.solarCell;
      case 'asset':
        return AppImages.asset;
      case 'power':
        return AppImages.power;
      default:
        return AppImages.solarCell;
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'solar':
        return Colors.blue;
      case 'asset':
        return Colors.orange;
      case 'power':
        return Colors.blueAccent;
      default:
        return Colors.grey;
    }
  }
}
