import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class TruckDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const TruckDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.sp),
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 4),
        Expanded(
          child: Container(
            height: 40.h,
            color: AppColors.mediumBlue,
            child: Center(
              child: Text(
                value,
                style: TextStyle(fontFamily: 'bahnschrift', fontSize: 16.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class ViewBranchInformationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Branch Information',
//         onBackPress: () => Navigator.pop(context),
//       ),
//       body: const BranchDetails(),
//     );
//   }
// }

// class BranchDetails extends StatelessWidget {
//   const BranchDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         children: const [
//           BranchDetailRow(label: 'Branch ID', value: 'BR-001'),
//           DividerBetweenListElements(),
//           BranchDetailRow(label: 'Branch Name', value: 'Al-Senaa'),
//           DividerBetweenListElements(),
//           BranchDetailRow(label: 'Location', value: 'Aleppo'),
//           DividerBetweenListElements(),
//           BranchDetailRow(label: 'Manager', value: 'Seba Taleaa'),
//           DividerBetweenListElements(),
//           BranchDetailRow(label: 'Status', value: 'Operational'),
//         ],
//       ),
//     );
//   }
// }

// class BranchDetailRow extends StatelessWidget {
//   final String label;
//   final String value;

//   const BranchDetailRow({super.key, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//               fontFamily: 'bahnschrift',
//               color: AppColors.darkBlue,
//               fontSize: 16.sp),
//         ),
//         SizedBox(width: MediaQuery.of(context).size.width / 4),
//         Expanded(
//           child: Container(
//             height: 40.h,
//             color: AppColors.mediumBlue,
//             child: Center(
//               child: Text(
//                 value,
//                 style: TextStyle(fontFamily: 'bahnschrift', fontSize: 16.sp),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }




class FinancialDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const FinancialDetailRow(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            elevation: 2.0,
            child: Column(
              children: [
                Text(label,
                    style: TextStyle(
                        fontFamily: 'bahnschrift',
                        color: AppColors.pureBlack,
                        fontSize: 16.sp)),
                SizedBox(height: 5.h),
                Text(value,
                    style: TextStyle(
                        fontFamily: 'bahnschrift',
                        color: AppColors.yellow,
                        fontSize: 16.sp)),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}



// class EditTripInvoiceScreen extends StatelessWidget {
//   const EditTripInvoiceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Edit Trip Invoice',
//         onBackPress: () => Navigator.pop(context),
//       ),
//       body: const Center(
//         child: Text('Edit Trip Invoice Screen'),
//       ),
//     );
//   }
// }