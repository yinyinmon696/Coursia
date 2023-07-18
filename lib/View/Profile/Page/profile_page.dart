// ignore_for_file: must_be_immutable, override_on_non_overriding_member

import 'package:coursia/Model/static_data.dart';
import 'package:coursia/Repository/get_storage.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_card.dart';
import 'package:coursia/UIDesign/custom_profile_card.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Auth/Page/login_page.dart';
import 'package:coursia/View/Cart/Page/cart_page.dart';
import 'package:coursia/View/Profile/Page/edit_profile_page.dart';
import 'package:coursia/View/Profile/Page/myachievement_page.dart';
import 'package:coursia/View/Profile/Page/mycertificate_page.dart';
import 'package:coursia/View/Profile/Page/mylearning_page.dart';
import 'package:coursia/View/Profile/Page/termandpolicy_page.dart';
import 'package:coursia/View/Profile/Page/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  /*getData() async {
    var box = Hive.box("library_db");
    final userData = await box.get('user');
    name = userData?['data']['user']['name'];
    log('Token - ${userData?['data']['user']['name']}');
  }*/

  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppTheme.black,
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: CustomFunction.customBody(context,
            isProfile: true, columnData: bodyData(context)));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        children: [
          CustomFunction.customSpace(height: 40),
          CustomText(
            text: StaticData.dataResponse?.userInfo?.user?.name ?? "",
            // StaticData.dataResponse?.userInfo?.user?.name ?? "",
            textColor: AppTheme.black,
            size: 17.sp,
          ),
          CustomFunction.customSpace(height: 10),
          CustomText(
            text: StaticData.dataResponse?.userInfo?.user?.email ?? "",
            textColor: AppTheme.blackLight,
            size: 12.sp,
          ),
          CustomFunction.customSpace(height: 15),
          CustomButton(
              bgcolor: AppTheme.orange,
              text: 'Edit Profile',
              fontSize: 12.sp,
              onTap: () {
                CustomFunction.navigatePage(EditProfilePage(), context);
              },
              width: 90.w,
              height: 25.h,
              borderRadius: 20.r),
          CustomFunction.customSpace(height: 10),
          const CustomCard(text: 'P U R C H A S E'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                CustomFunction.navigatePage(const CartPage(), context);
              },
              prefixIcon: Icons.shopping_cart,
              text: 'Cart',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                CustomFunction.navigatePage(const WishListPage(), context);
              },
              prefixIcon: Icons.favorite,
              text: 'Wishlist',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          const CustomCard(text: 'L E A R N I N G / A C H I E V E M E N T'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                CustomFunction.navigatePage(const MyLearningPage(), context);
              },
              prefixIcon: Icons.auto_stories,
              text: 'My Learning',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                CustomFunction.navigatePage(const MyAchievementPage(), context);
              },
              prefixIcon: Icons.pie_chart,
              text: 'My Achievement',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                CustomFunction.navigatePage(const MyCertificatePage(), context);
              },
              prefixIcon: Icons.assignment,
              text: 'My Certificate',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          const CustomCard(text: 'S E T T I N G'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                CustomFunction.navigatePage(const TermAndPolicyPage(), context);
              },
              prefixIcon: Icons.article,
              text: 'Term and Policy',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          // CustomProfileCard(
          //     onTap: () {},
          //     prefixIcon: Icons.auto_awesome_mosaic,
          //     text: 'Version',
          //     surffixIcon: Icons.keyboard_arrow_right_outlined),
          InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.auto_awesome_mosaic,
                  color: AppTheme.blackLight,
                ),
                CustomText(
                  text: '     Version',
                  textColor: AppTheme.black,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CustomText(
                      text: '     1.2.1',
                      textColor: AppTheme.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.notifications_active,
              text: 'Notification',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                // StaticData.loginResponseModel = null;
                // CustomFunction.navigatePage(LoginPage(), context);
                GetStorages.clear();
                StaticData.dataResponse = null;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    ModalRoute.withName("/Login"));
              },
              prefixIcon: Icons.logout,
              text: 'Sign Out',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 40)
        ],
      ),
    );
  }
}
