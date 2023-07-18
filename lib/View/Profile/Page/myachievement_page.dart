import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_card.dart';
import 'package:coursia/UIDesign/custom_profile_card.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAchievementPage extends StatelessWidget {
  const MyAchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'My Achievement', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        children: [
          CustomFunction.customSpace(height: 15),
          const CustomCard(text: 'C O M P E T E N C Y   T E S T'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                //CustomFunction.navigatePage(const CartPage(), context);
              },
              prefixIcon: Icons.batch_prediction,
              text: 'Competency Result',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          const CustomCard(text: 'D I S C   T E S T'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                //CustomFunction.navigatePage(const CartPage(), context);
              },
              prefixIcon: Icons.batch_prediction,
              text: 'DISC Result',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          const CustomCard(text: 'I Q   T E S T'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                //CustomFunction.navigatePage(const CartPage(), context);
              },
              prefixIcon: Icons.batch_prediction,
              text: 'IQ Result',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          const CustomCard(text: 'P O S T   T E S T'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                //CustomFunction.navigatePage(const CartPage(), context);
              },
              prefixIcon: Icons.batch_prediction,
              text: 'Result',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          const CustomCard(text: 'P R E   T E S T'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {
                //CustomFunction.navigatePage(const CartPage(), context);
              },
              prefixIcon: Icons.batch_prediction,
              text: 'Result',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }
}
