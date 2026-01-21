import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube/app/core/constants/app_colors.dart';
import 'package:scube/app/core/constants/app_images.dart';
import 'package:scube/app/core/constants/app_strings.dart';
import 'package:scube/app/features/dashboard/presentation/provider/dashboard_providers.dart';
import 'package:scube/app/features/dashboard/presentation/widget/dashboard_banner.dart';
import 'package:scube/app/features/dashboard/presentation/widget/data_list_widget.dart';
import 'package:scube/app/features/dashboard/presentation/widget/detailed_info_grid.dart';
import 'package:scube/app/features/dashboard/presentation/widget/info_cards_widget.dart';
import 'package:scube/app/features/dashboard/presentation/widget/stats_grid.dart';
import 'package:scube/app/features/dashboard/presentation/widget/weather_card.dart';
import 'package:scube/app/shared/component/app_bar/common_appbar.dart';
import 'package:scube/app/shared/component/card/lt_card.dart';
import 'package:scube/app/shared/component/image/common_image.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: AppStrings.dashboardTitle,
        isBackButton: true,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: CommonImage(imageSrc: AppImages.bell, size: 24.sp),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SafeArea(
        child: Builder(
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),

                  // Banner
                  const DashboardBanner(),
                  SizedBox(height: 16.h),

                  // Stats Grid
                  StatsGrid(data: data),
                  SizedBox(height: 16.h),

                  // Weather Card
                  WeatherCard(data: data),
                  SizedBox(height: 16.h),

                  // Data List (Yesterday vs Today)
                  DataListWidget(data: data),
                  SizedBox(height: 16.h),

                  // Info Cards (Total Num of PV Module)
                  const InfoCardsWidget(),
                  SizedBox(height: 16.h),

                  // Detailed Info Grid (Total AC Capacity etc)
                  const DetailedInfoGrid(),
                  SizedBox(height: 16.h),

                  // LT_01 Card 1
                  LTCard(
                    title: AppStrings.lt01,
                    capacityText: "495.505 kWp / 440 kW",
                    items: const [
                      LTItemData(
                        iconSrc: AppImages.lifetimeEnergy,
                        label: AppStrings.lifetimeEnergy,
                        value: "352.96 MWh",
                      ),
                      LTItemData(
                        iconSrc: AppImages.todayEnergy,
                        label: AppStrings.todayEnergy,
                        value: "273.69 kWh",
                      ),
                      LTItemData(
                        iconSrc: AppImages.prevMeterEnergy,
                        label: AppStrings.prevMeterEnergy,
                        value: "0.00 MWh",
                      ),
                      LTItemData(
                        iconSrc: AppImages.livePower,
                        label: AppStrings.livePower,
                        value: "352.96 MWh",
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // LT_01 Card 2 (Duplicate for demo as per image logic implied)
                  LTCard(
                    title: AppStrings.lt01,
                    capacityText: "495.505 kWp / 440 kW",
                    items: const [
                      LTItemData(
                        iconSrc: AppImages.lifetimeEnergy,
                        label: AppStrings.lifetimeEnergy,
                        value: "352.96 MWh",
                      ),
                      LTItemData(
                        iconSrc: AppImages.todayEnergy,
                        label: AppStrings.todayEnergy,
                        value: "273.69 kWh",
                      ),
                      LTItemData(
                        iconSrc: AppImages.prevMeterEnergy,
                        label: AppStrings.prevMeterEnergy,
                        value: "0.00 MWh",
                      ),
                      LTItemData(
                        iconSrc: AppImages.livePower,
                        label: AppStrings.livePower,
                        value: "352.96 MWh",
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
