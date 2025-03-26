import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:clothly/core/constants/enum_state.dart';
import 'package:clothly/features/home/logic/home_controller.dart';
import 'package:clothly/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/shared/custom_scaffold.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  final double height = 40.0;
  final double width = 28.0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _buildBody(context: context),
      pageIndex: 0,

    );
  }

  Widget _buildBody({required BuildContext context}) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,${controller.user?.fullName ?? 'no data'}👋",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: Dimensions.screenHeight * 0.038,
                  backgroundImage: const AssetImage("assets/images/p1.jpg"),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    onChanged: (value) => controller.searchProducts(value,
                        categoryId: controller.selectedIndex.toString()),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: " Search here...",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.screenHeight * 0.021),
                      prefixIcon: const Icon(Icons.search_rounded),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: AppColors.kSecondColorGrey2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: AppColors.kSecondColorGrey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Flexible(
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 13),
                          decoration: BoxDecoration(
                              color: AppColors.kMainColorBlack,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              shape: BoxShape.rectangle),
                          child: SizedBox(
                            child: Icon(
                              Icons.filter_list,
                              color: AppColors.kSecondColorGrey2,
                            ),
                          ))),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            GetBuilder<HomeController>(builder: (controller) {
              // Handle the loading state
              if (controller.stateCategories == Status.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              // Handle the failure state
              if (controller.stateCategories == Status.failed) {
                return const Center(child: Text("Some error occurred"));
              }

              // If categories are available, proceed with the DefaultTabController
              if (controller.categories.isEmpty) {
                return const Center(child: Text("No categories available"));
              }
              return DefaultTabController(
                  length: controller.categories.length,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GetBuilder<HomeController>(builder: (controller) {
                        switch (controller.stateCategories) {
                          case Status.loading:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case Status.success:
                            return ButtonsTabBar(
                                height: Dimensions.screenHeight * 0.05,
                                unselectedDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius05)),
                                  color: AppColors.kSecondColorGrey2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          Dimensions.screenHeight * 0.035)),
                                  color: AppColors.kMainColorBlack2,
                                ),
                                borderColor: AppColors.kSecondColorGrey,
                                buttonMargin: const EdgeInsets.only(
                                  right: 40,
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.screenHeight * 0.025,
                                    fontWeight: FontWeight.w400),
                                labelSpacing: 10,
                                unselectedLabelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: Dimensions.screenHeight * 0.025,
                                    fontWeight: FontWeight.w400),
                                tabs: controller.categories
                                    .map((c) => _buildTab(
                                          text: c.name,
                                        ))
                                    .toList(),
                                onTap: (index) {
                                  controller.selectedIndex = index;
                                  if (index == 0) {
                                    controller.getAllProducts();
                                  } else {
                                    controller.getProductsForCategory(
                                        id: controller.categories[index].id);
                                  }
                                });
                          case Status.failed:
                            return const Center(
                              child: Text("Some Error was ocuuered"),
                            );
                        }
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.8,
                        width: double.infinity,
                        child: TabBarView(
                            children: controller.categories
                                .map(
                                  (c) => GetBuilder<HomeController>(
                                      builder: (controller) {
                                    switch (controller.state) {
                                      case Status.loading:
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      case Status.failed:
                                        return const Center(
                                          child:
                                              Text("Some Error was ocuuered"),
                                        );
                                      case Status.success:
                                        return CustomGridView(
                                            products: controller.filterProducts);
                                    }
                                  }),
                                )
                                .toList()),
                      ),
                    ],
                  ));
            }),
          ],
        ),
      );
  Widget _buildTab({
    required String text,
  }) =>
      Tab(
        text: text,
      );
}
