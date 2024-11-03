
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clothing/features/profile/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../bottom_navigation/presentation/screens/custom_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _buildBody(context: context),
      pageIndex: 3,
      isHaveBottomNav: true,
    );
  }

  Widget _buildBody({required BuildContext context}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //header
          Stack(
            children: [
              // Container(
              //   height: Dimensions.screenHeight * 0.4,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.only(
              //         bottomRight: Radius.circular(Dimensions.radius05),
              //         bottomLeft: Radius.circular(Dimensions.radius05),
              //       ),
              //       image: DecorationImage(
              // CachedNetworkImage(
              //   imageUrl: "https://picsum.photos/800",
              //   progressIndicatorBuilder: (context, url, downloadProgress) =>
              //       CircularProgressIndicator(value: downloadProgress.progress),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              CachedNetworkImage(
                imageUrl: 'https://via.placeholder.com/300x150',
                imageBuilder: (context, imageProvider) => Container(
                  height: Dimensions.screenHeight * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(Dimensions.radius05),
                        bottomLeft: Radius.circular(Dimensions.radius05),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(
                              0.5), // Adjust opacity to control darkness
                          BlendMode
                              .difference, // Blend mode to make the background darker
                        ),
                      ),
                      color: AppColors.kMainColorBlack),
                ),
              ),
              //         image: NetworkImage("https://picsum.photos/800"),
              //         fit: BoxFit.cover,
              //         colorFilter: ColorFilter.mode(
              //           Colors.black.withOpacity(
              //               0.5), // Adjust opacity to control darkness
              //           BlendMode
              //               .difference, // Blend mode to make the background darker
              //         ),
              //       ),
              //       color: AppColors.kMainColorBlack),
              // ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: Dimensions.screenHeight * 0.05,
                        left: Dimensions.screenHeight * 0.05,
                        top: Dimensions.screenHeight * 0.27,
                        bottom: Dimensions.screenHeight * 0.04),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: Dimensions.screenHeight * 0.06,
                          ),
                          child: CustomCard(
                              child: _buildContentProfile(
                                  context: context,
                                  username: "Tareq",
                                  email: "tareq4534@gmail.com")),
                        ),
                        // image
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 5, color: AppColors.kSecondColorGrey2),
                              // borderRadius: BorderRadius.all(Radius.circular(100),)
                            ),
                            child: CircleAvatar(
                              radius: Dimensions.screenHeight * 0.06,
                              backgroundImage: const NetworkImage(
                                  "https://picsum.photos/800"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          )
          //body hosepipes list
          // Padding(
          //   padding: EdgeInsets.only(
          //     right: Dimensions.padding05,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         children: [
          // CustomTitle(title: "الصلاحيات"),
          // SizedBox(
          //   width: Dimensions.screenWidth * 0.3,
          // ),
          // TextButton(
          //     onPressed: () => Get.toNamed(AppRoutes.permissionRoute),
          //     child: Text("رؤية الكل",
          //         style: Theme.of(context)
          //             .textTheme
          //             .bodyLarge!
          //             .copyWith(
          //             fontSize: Dimensions.screenHeight * 0.025,
          //             fontWeight: FontWeight.w400)))
          // ],
          // ),
          // SizedBox(
          //   height: Dimensions.height01,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(5),
          //   child: _buildListView(context: context, hosepipes: hosepipes),
          // ),
          //     ],
          //   ),
          // ),
        ],
      );
  Widget _buildContentProfile({
    required BuildContext context,
    required String username,
    required String email,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            username,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            email,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ],
      );
}
