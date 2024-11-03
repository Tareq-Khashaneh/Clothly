import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:ecommerce_clothing/core/constants/enum_state.dart';
import 'package:ecommerce_clothing/features/bottom_navigation/presentation/screens/custom_scaffold.dart';
import 'package:ecommerce_clothing/features/home/logic/home_controller.dart';
import 'package:ecommerce_clothing/features/home/presentation/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  final double height = 40.0;
  final double width = 28.0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _buildBody(context: context),
      pageIndex: 0,
      isHaveBottomNav: true,
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
                      "Welcome 👋",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Tareq Khashaneh",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: Dimensions.screenHeight * 0.038,
                  backgroundImage: AssetImage("assets/images/user.png"),
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
                    controller: controller.searchController,
                    onChanged: (value) => controller.search(value: value),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: " Search here...",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.screenHeight * 0.021),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SvgPicture.asset("assets/icons/Iconly.svg",color: AppColors.kSecondColorGrey,width: 30,),
                      ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                        decoration: BoxDecoration(
                            color: AppColors.kMainColorBlack,
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            shape: BoxShape.rectangle),
                        child: SvgPicture.asset(
                          "assets/icons/Filter.svg",
                          height: 35,
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            DefaultTabController(
                length: 5,
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
                                borderRadius: BorderRadius.all(Radius.circular(
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
                              tabs: [
                                _buildTab(
                                    icon: "assets/icons/category.svg",
                                    text: "All",
                                    context: context),
                                _buildTab(
                                    icon:
                                        "assets/icons/laptop-electronics-svgrepo-com.svg",
                                    text: controller.categories[0],
                                    context: context),
                                _buildTab(
                                    icon:
                                        "assets/icons/dimond-alt-svgrepo-com.svg",
                                    text: controller.categories[1],
                                    context: context),
                                _buildTab(
                                    icon:
                                        "assets/icons/men-clothes-svgrepo-com.svg",
                                    text: controller.categories[2],
                                    context: context),
                                _buildTab(
                                    icon:
                                        "assets/icons/women-dress-svgrepo-com.svg",
                                    text: controller.categories[3],
                                    context: context),
                              ],
                              onTap: (index) =>
                                  controller.getProductsCategory(index: index));
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
                      child: TabBarView(children: [
                        GetBuilder<HomeController>(builder: (controller) {
                          switch (controller.state) {
                            case Status.loading:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case Status.failed:
                              return const Center(
                                child: Text("Some Error was ocuuered"),
                              );
                            case Status.success:
                              return CustomGridView(
                                  products: controller.filterProducts);
                          }
                        }),
                        GetBuilder<HomeController>(builder: (controller) {
                          switch (controller.state) {
                            case Status.loading:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case Status.failed:
                              return const Center(
                                child: Text("Some Error was ocuuered"),
                              );
                            case Status.success:
                              return CustomGridView(
                                  products: controller.filterProducts);
                          }
                        }),
                        GetBuilder<HomeController>(builder: (controller) {
                          switch (controller.state) {
                            case Status.loading:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case Status.failed:
                              return const Center(
                                child: Text("Some Error was ocuuered"),
                              );
                            case Status.success:
                              return CustomGridView(
                                  products: controller.filterProducts);
                          }
                        }),
                        GetBuilder<HomeController>(builder: (controller) {
                          switch (controller.state) {
                            case Status.loading:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case Status.failed:
                              return const Center(
                                child: Text("Some Error was ocuuered"),
                              );
                            case Status.success:
                              return CustomGridView(
                                  products: controller.filterProducts);
                          }
                        }),
                        GetBuilder<HomeController>(builder: (controller) {
                          switch (controller.state) {
                            case Status.loading:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case Status.failed:
                              return const Center(
                                child: Text("Some Error was ocuuered"),
                              );
                            case Status.success:
                              return CustomGridView(
                                  products: controller.filterProducts);
                          }
                        }),
                      ]),
                    ),
                  ],
                )),
          ],
        ),
      );
  _buildTab(
          {required String icon,
          double width = 35.0,
          required String text,
          required BuildContext context}) =>
      Tab(
        icon: SvgPicture.asset(
          icon,
          width: width,
          color: AppColors.kSecondColorGrey,
        ),
        text: text,
      );
}
