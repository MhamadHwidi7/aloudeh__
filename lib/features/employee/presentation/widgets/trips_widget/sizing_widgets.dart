

import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class SpaceItem extends StatelessWidget {
//   const SpaceItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(height: MediaQuery.of(context).size.height / 50);
//   }
// }

class DividerSpaceItem extends StatelessWidget {
  const DividerSpaceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SpaceItem(),
        Divider(color: AppColors.darkBlue),
        SpaceItem(),
      ],
    );
  }
}

class DividerBetweenListElements extends StatelessWidget {
  const DividerBetweenListElements({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.darkBlue);
  }
}