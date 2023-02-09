import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izinto/pages/Home/specialty_page_body.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/small_text.dart';

class MainSpecialtyPage extends StatelessWidget {
  const MainSpecialtyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 4),
                  elevation: 8,
                  backgroundColor: Color(0xff9A9483),
                  behavior: SnackBarBehavior.floating,
                  content: const Text('Please login to proceed'),
                  action: SnackBarAction(
                    label: 'LOGIN',
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    onPressed: () {
                      Get.to(() => const SpecialtyPageBody(),
                          transition: Transition.fade,
                          duration: Duration(seconds: 1));
                    },
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width10 + Dimensions.screenWidth / 70,
                right: Dimensions.width10 + Dimensions.screenWidth / 70,
                top: Dimensions.height45 + Dimensions.height10,
              ),
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.screenWidth / 20,
                  right: Dimensions.screenWidth / 40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.5,
                    offset: Offset(1, 2),
                  ),
                ],
                borderRadius:
                    BorderRadius.circular(Dimensions.height10 * 8 / 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 4),
                          elevation: 8,
                          backgroundColor: Color(0xff9A9483),
                          behavior: SnackBarBehavior.floating,
                          content: const Text('Please login to proceed '),
                          action: SnackBarAction(
                            label: 'LOGIN',
                            disabledTextColor: Colors.white,
                            textColor: Colors.white,
                            onPressed: () {
                              Get.to(() => const SpecialtyPageBody(),
                                  transition: Transition.fade,
                                  duration: Duration(seconds: 1));
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             Wrapper()));
                            },
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: SmallText(
                                    text: 'Delivering to?',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    size: Dimensions.font16,
                                    height: 1.4,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Row(
                                    children: [
                                      SmallText(
                                        text: 'Mika',
                                        maxLines: 1,
                                        color: AppColors.titleColor,
                                        height: 1.5,
                                        size: Dimensions.font16 / 1.1,
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10 / 2,
                                      ),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 3),
                                          child: SmallText(
                                            text: '.',
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w700,
                                            height: 0.7,
                                          )),
                                      SizedBox(
                                        width: Dimensions.width10 / 2,
                                      ),
                                      SmallText(
                                        text: 'Volta',
                                        maxLines: 1,
                                        color: AppColors.titleColor,
                                        height: 1.5,
                                        size: Dimensions.font16 / 1.1,
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10 / 2,
                                      ),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 3),
                                          child: SmallText(
                                            text: '.',
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w700,
                                            height: 0.7,
                                          )),
                                      SizedBox(
                                        width: Dimensions.width10 / 2,
                                      ),
                                      SmallText(
                                        text: 'Kaafontein',
                                        maxLines: 1,
                                        color: AppColors.titleColor,
                                        height: 1.5,
                                        size: Dimensions.font16 / 1.1,
                                        overFlow: TextOverflow.clip,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfffefafa),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffB09B71),
                            blurRadius: 2.0,
                            offset: Offset(1, 1),
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(Dimensions.height10 * 5),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffB09B71),
                        ),
                      ),
                      child: AppIcon(
                        icon: (MdiIcons.pail),
                        backgroundColor: Colors.white,
                        iconSize: Dimensions.height20 + Dimensions.height10,
                        size: Dimensions.height10 + Dimensions.height30,
                        iconColor: const Color(0xFFB09B71),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          //showing the body
          const Expanded(
            child: SingleChildScrollView(
              child: SpecialtyPageBody(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavigateButton() => FloatingActionButton.extended(
        extendedIconLabelSpacing: 2.6,
        extendedTextStyle: TextStyle(
            fontSize: Dimensions.font20 * 1.1, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius30 * 2),
        ),
        backgroundColor: const Color(0xffB09B78),
        foregroundColor: Colors.white,
        icon: const Icon(MdiIcons.drawPen),
        label: const Text('Subscribe'),
        onPressed: () {
          Get.toNamed(RouteHelper.getSplashScreen());
        },
      );
}
