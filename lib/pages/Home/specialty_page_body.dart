import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izinto/controllers/laundry_specialty_controller.dart';
import 'package:izinto/controllers/recommended_specialty_controller.dart';
import 'package:izinto/utils/colors.dart';
import 'package:izinto/utils/dimensions.dart';
import 'package:izinto/widgets/App_column.dart';
import 'package:izinto/widgets/big_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/popular_specialty_controller.dart';
import '../../models/cart_model.dart';
import '../../models/popular_specialty_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/small_text.dart';

class SpecialtyPageBody extends StatefulWidget {
  const SpecialtyPageBody({Key? key}) : super(key: key);

  @override
  State<SpecialtyPageBody> createState() => _SpecialtyPageBodyState();
}

class _SpecialtyPageBodyState extends State<SpecialtyPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  String? superhero;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Top Slider Section
        GetBuilder<RecommendedSpecialtyController>(
            builder: (recommendedSpecialties) {
          return recommendedSpecialties.isLoaded
              ? SizedBox(
                  height: Dimensions.pageView - Dimensions.height45 * 1.5,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: recommendedSpecialties
                          .recommendedSpecialtyList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position,
                            recommendedSpecialties
                                .recommendedSpecialtyList[position]);
                      }),
                )
              : Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                );
        }),
        SizedBox(
          height: Dimensions.height20,
        ),
        //Dots Indicator
        GetBuilder<RecommendedSpecialtyController>(
            builder: (recommendedSpecialties) {
          return DotsIndicator(
            dotsCount: recommendedSpecialties.recommendedSpecialtyList.isEmpty
                ? 1
                : recommendedSpecialties.recommendedSpecialtyList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: const Color(0xff966C3B),
              size: const Size.square(7),
              activeSize: const Size(7, 7),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        }),

        //laundry text
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(
                text: 'Wash by Category',
                fontWeight: FontWeight.w500,
                color: AppColors.mainColor,
                size: Dimensions.font20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height10 / 2,
        ),

        // Laundry Categories
        // list of services and images
        GetBuilder<LaundrySpecialtyController>(
          builder: (laundrySpecialties) {
            var _specialty = laundrySpecialties.laundrySpecialtyList;
            return laundrySpecialties.isLoaded
                ? SizedBox(
                    height: Dimensions.screenWidth / 3,
                    width: Dimensions.screenWidth / 1.10,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: laundrySpecialties.laundrySpecialtyList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getLaundrySpecialties(
                                index, 'home'));
                          },
                          child: Container(
                            //color: Colors.red,
                            margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.screenWidth / 100),
                            width: Dimensions.screenWidth / 3.4,
                            height: Dimensions.screenHeight / 2.8,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: Dimensions.screenWidth / 3.8,
                                      height: Dimensions.screenHeight / 8,
                                      // margin: EdgeInsets.only(
                                      //     bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          // image: AssetImage(laundrySpecialties
                                          //     .laundrySpecialtyList[index]
                                          //     .img!),
                                          image: NetworkImage(laundrySpecialties
                                              .laundrySpecialtyList[index]
                                              .img!),
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                Dimensions.radius15),
                                            topRight: Radius.circular(
                                                Dimensions.radius15)),
                                        //color: Colors.white54,
                                        // gradient: const LinearGradient(
                                        //   begin: Alignment.topRight,
                                        //   end: Alignment.bottomLeft,
                                        //   colors: [
                                        //     Colors.white,
                                        //     Colors.white,
                                        //   ],
                                        // ),
                                      ),
                                    ),

                                    /* Take care of this lovely incart item count part if you can
                                    *
                                    * if you can't it's okay
                                    *
                                    * leave it
                                    *
                                    * we need to ship
                                    *
                                    * good love
                                    *
                                    * all love
                                    *
                                    *
                                    // GetBuilder<
                                    //         RecommendedSpecialtyController>(
                                    //     builder: (controller) {
                                    //   return (Container(
                                    //     child: Positioned(
                                    //       right: 1,
                                    //       top: 1,
                                    //       child: GetBuilder<CartController>(
                                    //           builder: (cartController) {
                                    //         var _cartList =
                                    //             cartController.getItems;
                                    //         if (cartController.totalItems >=
                                    //             1) {
                                    //           return Container(
                                    //             width: 25,
                                    //             height: 25,
                                    //             decoration: BoxDecoration(
                                    //               color: Colors.white,
                                    //               boxShadow: const [
                                    //                 BoxShadow(
                                    //                   color:
                                    //                       Color(0xffB09B71),
                                    //                   blurRadius: 2.0,
                                    //                   offset: Offset(1, 1),
                                    //                 ),
                                    //               ],
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       Dimensions
                                    //                               .height10 *
                                    //                           5),
                                    //               border: Border.all(
                                    //                 width: 1,
                                    //                 color: const Color(
                                    //                     0xffB09B71),
                                    //               ),
                                    //             ),
                                    //             child: Center(
                                    //               child: SmallText(
                                    //                 size: Dimensions.font16,
                                    //                 text: _cartList[index]
                                    //                     .quantity
                                    //                     .toString(),
                                    //                 fontWeight:
                                    //                     FontWeight.w400,
                                    //                 color: const Color(
                                    //                     0xff966C3B),
                                    //               ),
                                    //             ),
                                    //             // AppIcon(
                                    //             //   size: Dimensions.iconSize26 + 2,
                                    //             //   iconSize: Dimensions.iconSize24,
                                    //             //   backgroundColor: Colors.white,
                                    //             //   iconColor: const Color(0xffB09B71),
                                    //             //   icon: Icons.add,
                                    //             // ),
                                    //           );
                                    //         } else {
                                    //           return Container(
                                    //             // padding: EdgeInsets.symmetric(
                                    //             //   horizontal: Dimensions.width10,
                                    //             //   vertical: Dimensions.height10 / 2),
                                    //             decoration: BoxDecoration(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       20),
                                    //               border: Border.all(
                                    //                   width: 1,
                                    //                   color: const Color(
                                    //                       0xffB09B71)),
                                    //             ),
                                    //             child: Container(
                                    //               width: 25,
                                    //               height: 25,
                                    //               decoration: BoxDecoration(
                                    //                   borderRadius:
                                    //                       BorderRadius
                                    //                           .circular(
                                    //                               40 / 2),
                                    //                   color: Colors.white),
                                    //               child:
                                    //                   // Center(
                                    //                   //   child: SmallText(
                                    //                   //     size: Dimensions.font16,
                                    //                   //     text: '4',
                                    //                   //     fontWeight: FontWeight.w400,
                                    //                   //     color: const Color(0xff966C3B),
                                    //                   //   ),
                                    //                   // ),
                                    //                   AppIcon(
                                    //                 size: Dimensions
                                    //                         .iconSize26 +
                                    //                     2,
                                    //                 iconSize:
                                    //                     Dimensions.iconSize24,
                                    //                 backgroundColor:
                                    //                     Colors.white,
                                    //                 iconColor: const Color(
                                    //                     0xffB09B71),
                                    //                 icon: Icons.add,
                                    //               ),
                                    //             ),
                                    //           );
                                    //         }
                                    //       }),
                                    //     ),
                                    //   ));
                                    // }
                                    //     // GetBuilder<
                                    //     //         RecommendedSpecialtyController>(
                                    //     //     builder: (controller) {
                                    //     //   return Container(
                                    //     //     child: controller.totalItems >= 1
                                    //     //         ? Positioned(
                                    //     //             right: 1,
                                    //     //             top: 1,
                                    //     //             child: Container(
                                    //     //               width: 25,
                                    //     //               height: 25,
                                    //     //               decoration: BoxDecoration(
                                    //     //                 color: Colors.white,
                                    //     //                 boxShadow: const [
                                    //     //                   BoxShadow(
                                    //     //                     color:
                                    //     //                         Color(0xffB09B71),
                                    //     //                     blurRadius: 2.0,
                                    //     //                     offset: Offset(1, 1),
                                    //     //                   ),
                                    //     //                 ],
                                    //     //                 borderRadius: BorderRadius
                                    //     //                     .circular(Dimensions
                                    //     //                             .height10 *
                                    //     //                         5),
                                    //     //                 border: Border.all(
                                    //     //                   width: 1,
                                    //     //                   color: const Color(
                                    //     //                       0xffB09B71),
                                    //     //                 ),
                                    //     //               ),
                                    //     //               child: Center(
                                    //     //                 child: SmallText(
                                    //     //                   size: Dimensions.font16,
                                    //     //                   text: '4',
                                    //     //                   fontWeight:
                                    //     //                       FontWeight.w400,
                                    //     //                   color: const Color(
                                    //     //                       0xff966C3B),
                                    //     //                 ),
                                    //     //               ),
                                    //     //               // AppIcon(
                                    //     //               //   size: Dimensions.iconSize26 + 2,
                                    //     //               //   iconSize: Dimensions.iconSize24,
                                    //     //               //   backgroundColor: Colors.white,
                                    //     //               //   iconColor: const Color(0xffB09B71),
                                    //     //               //   icon: Icons.add,
                                    //     //               // ),
                                    //     //             ),
                                    //     //           )
                                    //     //         : Container(),
                                    //     //   );
                                    //     // }),
                                    //     // Positioned(
                                    //     //   right: 0,
                                    //     //   left: 0,
                                    //     //   bottom: 0,
                                    //     //   child: Container(
                                    //     //     width: Dimensions.screenWidth / 4,
                                    //     //     decoration:
                                    //     //         BoxDecoration(color: Colors.white),
                                    //     //     child: Center(
                                    //     //       child: SmallText(
                                    //     //         text:
                                    //     //             'R ${laundrySpecialties.laundrySpecialtyList[index].price!.toString()}.00',
                                    //     //         fontWeight: FontWeight.w600,
                                    //     //         color: const Color(0xffCFC5A5),
                                    //     //       ),
                                    //     //     ),
                                    //     //   ),
                                    //     // )
                                    //     ),

                                    *
                                    *
                                    *
                                    *
                                    *
                                    * */
                                  ],
                                ),
                                Container(
                                  width: Dimensions.screenWidth / 3.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              Dimensions.radius15),
                                          bottomRight: Radius.circular(
                                              Dimensions.radius15)),
                                      // gradient: const LinearGradient(
                                      //   begin: Alignment.bottomRight,
                                      //   end: Alignment.topLeft,
                                      //   colors: [
                                      //     Color(0xff966C3B),
                                      //     Color(0xffCFC5A5),
                                      //   ],
                                      // ),
                                      color: Colors.white),
                                  child: Center(
                                    child: SmallText(
                                      text: laundrySpecialties
                                          .laundrySpecialtyList[index].name!,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Transform.scale(
                    scale: 0.5,
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  );
          },
        ),

        SizedBox(
          height: Dimensions.height20,
        ),

        //popular specialties
        //list of services and images
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Row(
                children: [
                  BigText(
                    text: 'Popular',
                    weight: FontWeight.normal,
                    color: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigText(
                      text: '.',
                      color: Colors.black26,
                      weight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 1),
                    child: SmallText(
                      text: 'Services',
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
            GetBuilder<PopularSpecialtyController>(
              builder: (popularSpecialties) {
                return popularSpecialties.isLoaded
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            popularSpecialties.popularSpecialtyList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              // boxShadow: const [
                              //   BoxShadow(
                              //     color: Colors.black12,
                              //     blurRadius: 1.0,
                              //     offset: Offset(1, 2),
                              //   ),
                              // ],
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            height: Dimensions.screenHeight / 7.8,
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.screenHeight / 100),
                            margin: EdgeInsets.only(
                              left: Dimensions.screenWidth / 25,
                              right: Dimensions.screenWidth / 70,
                              bottom: Dimensions.height20,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.getPopularSpecialties(
                                    index, 'home'));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //image section
                                  Container(
                                    margin: const EdgeInsets.only(left: 6),
                                    padding: const EdgeInsets.all(8),
                                    width: Dimensions.height20 * 4.5,
                                    height: Dimensions.height20 * 4.5,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.white,
                                            spreadRadius: 1.5,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(popularSpecialties
                                                .popularSpecialtyList[index]
                                                .img!)),
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: Dimensions.width10),
                                  //text container
                                  Expanded(
                                    child: SizedBox(
                                      height: Dimensions.listViewTextContSize,
                                      // margin: EdgeInsets.symmetric(
                                      //     horizontal: Dimensions.width15),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.width10),
                                        child: Stack(
                                          children: [
                                            SmallText(
                                              size: Dimensions.font16,
                                              text: popularSpecialties
                                                  .popularSpecialtyList[index]
                                                  .name,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.mainColor2,
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              top: 25,
                                              child: SmallText(
                                                overFlow: TextOverflow.ellipsis,
                                                text: popularSpecialties
                                                        .popularSpecialtyList[
                                                            index]
                                                        .provider +
                                                    ', Bryanston',
                                                color: AppColors.titleColor,
                                                size: Dimensions.font16,
                                              ),
                                            ),
                                            Positioned(
                                              top: 50,
                                              child: SmallText(
                                                text:
                                                    'R ${popularSpecialties.popularSpecialtyList[index].price!.toString()}.00',
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.mainColor,
                                                size: Dimensions.font16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Container(
                                      // padding: EdgeInsets.symmetric(
                                      //   horizontal: Dimensions.width10,
                                      //   vertical: Dimensions.height10 / 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffB09B71)),
                                      ),
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40 / 2),
                                            color: Colors.white),
                                        child:
                                            // Center(
                                            //   child: SmallText(
                                            //     size: Dimensions.font16,
                                            //     text: '4',
                                            //     fontWeight: FontWeight.w400,
                                            //     color: const Color(0xff966C3B),
                                            //   ),
                                            // ),
                                            AppIcon(
                                          size: Dimensions.iconSize26 + 2,
                                          iconSize: Dimensions.iconSize24,
                                          backgroundColor: Colors.white,
                                          iconColor: const Color(0xffB09B71),
                                          icon: Icons.add,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Transform.scale(
                          scale: 0.5,
                          child: CircularProgressIndicator(
                            color: AppColors.mainColor,
                          ),
                        ),
                      );
              },
            ),
            SizedBox(
              height: Dimensions.screenHeight / 10,
            )
          ],
        )
      ],
    );
  }

  Widget _buildPageItem(int index, SpecialtyModel recommendedSpecialty) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currScale, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currScale, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currScale, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(
                  // RouteHelper.getRecommendedSpecialities(index, 'home'),
                  RouteHelper.getRecommendedSpecialtyGridView());
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Colors.white60 : Colors.white70,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(recommendedSpecialty.img!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer - Dimensions.height20,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ],
              ),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Brand and turnaround time
                      GetBuilder<RecommendedSpecialtyController>(
                          builder: (recommendedSpecialties) {
                        return recommendedSpecialties.isLoaded
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      // BigText(
                                      //   text: text,
                                      //   size: Dimensions.font16 * 1.2,
                                      //   weight: FontWeight.w500,
                                      //   color: AppColors.mainColor,
                                      // ),

                                      Row(
                                        children: [
                                          // SizedBox(
                                          //   width: 8,
                                          // ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    recommendedSpecialty
                                                        .provider!),
                                                width: recommendedSpecialty
                                                            .provider ==
                                                        'assets/image/court.png'
                                                    ? 100
                                                    : 140,
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(left: 3.0),
                                              //   child: SmallText(
                                              //     text: 'Waterfall Corner',
                                              //     maxLines: 1,
                                              //     color: AppColors.mainColor,
                                              //     fontWeight: FontWeight.bold,
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: Dimensions.height45 * 1.6,
                                    height: Dimensions.height45 * 1.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius15),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xff966C3B),
                                          Color(0xffA0937D),
                                        ],
                                      ),

                                      // color: AppColors.titleColor)
                                    ),
                                    child: Column(
                                      children: [
                                        SmallText(
                                          text: 'ETA',
                                          size: 13.0,
                                          maxLines: 1,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SmallText(
                                          text: '24 - 48hrs',
                                          size: 10.0,
                                          maxLines: 1,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Container();
                      })
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
