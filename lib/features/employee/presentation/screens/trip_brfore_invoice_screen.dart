// import 'package:aloudeh_company/core/constants/colors_constants.dart';
// import 'package:aloudeh_company/features/employee/presentation/screens/edit_trip_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

// class ViewTripBeforeInvoiceEmployee extends StatelessWidget {
//   final String tripId = "DM-135";
//   final String manifestId = "DM-1-7071";
//   final String truckId = "Aleppo-1234566432";
//   final String driverName = "Mohammed Suliman";
//   final String tripDate = "25/07/2023";
//   final String source = "Damascus";
//   final String sourceDesk = "Al_Senaa";
//   final String destination = "Homs";
//   final String destinationDesk = "Homs";
//   final String status = "Temporary";

//   const ViewTripBeforeInvoiceEmployee({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Align(
//           alignment: Alignment.centerRight,
//           child: TripRecordText(),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.chevron_left,
//             color: AppColors.darkBlue,
//           ),
//         ),
//         bottom: const PreferredSize(
//           preferredSize: Size.fromHeight(1.0),
//           child: DividerItem(),
//         ),
//       ),
//       body: Column(
//         children: [
//           const SpaceItem(),
//           EditDeleteInvoiceButtons(onDelete: () => _deleteTrip(context)),
//           const SpaceItem(),
//           const DividerItem(),
//           Expanded(
//             child: ViewTripInformation(
//               tripId: tripId,
//               manifestId: manifestId,
//               truckId: truckId,
//               driverName: driverName,
//               tripDate: tripDate,
//               source: source,
//               sourceDesk: sourceDesk,
//               destination: destination,
//               destinationDesk: destinationDesk,
//               status: status,
//               screenWidth: screenWidth,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _deleteTrip(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(
//           "Do you want to delete this trip?",
//           style: TextStyle(
//             fontFamily: 'bahnschrift',
//             color: AppColors.darkBlue,
//             fontSize: 16.sp,
//           ),
//         ),
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             TextButton(
//               onPressed: () {
//                 // Add your delete logic here
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'Yes',
//                 style: TextStyle(
//                   color: AppColors.yellow,
//                   fontFamily: 'bahnschrift',
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'No',
//                 style: TextStyle(
//                   color: AppColors.yellow,
//                   fontFamily: 'bahnschrift',
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EditDeleteInvoiceButtons extends StatelessWidget {
//   final VoidCallback onDelete;

//   const EditDeleteInvoiceButtons({super.key, required this.onDelete});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildButton(
//             icon: Icons.delete,
//             onPressed: onDelete,
//             heroTag: "delete",
//           ),
//           _buildButton(
//             icon: Icons.print,
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => AddTripInvoice()),
//               // );
//             },
//             heroTag: "invoice",
//           ),
//           _buildButton(
//             icon: Icons.edit,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EditTripScreen()),
//               );
//             },
//             heroTag: "edit",
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton({required IconData icon, required VoidCallback onPressed, required String heroTag}) {
//     return Container(
//       height: 40.h,
//       width: 40.h,
//       child: FloatingActionButton(
//         onPressed: onPressed,
//         child: Icon(
//           icon,
//           color: AppColors.yellow,
//         ),
//         elevation: 0.0,
//         backgroundColor: AppColors.darkBlue,
//         heroTag: heroTag,
//       ),
//     );
//   }
// }

// class ViewTripInformation extends StatelessWidget {
//   final String tripId;
//   final String manifestId;
//   final String truckId;
//   final String driverName;
//   final String tripDate;
//   final String source;
//   final String sourceDesk;
//   final String destination;
//   final String destinationDesk;
//   final String status;
//   final double screenWidth;

//   const ViewTripInformation({super.key, 
//     required this.tripId,
//     required this.manifestId,
//     required this.truckId,
//     required this.driverName,
//     required this.tripDate,
//     required this.source,
//     required this.sourceDesk,
//     required this.destination,
//     required this.destinationDesk,
//     required this.status,
//     required this.screenWidth,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: ListView(
//         children: [
//           const SpaceItem(),
//           _buildInfoRow('ID', tripId, screenWidth / 4.8, AppColors.mediumBlue),
//           const SpaceItem(),
//           _buildInfoRow('Manifest', manifestId, screenWidth / 12.2, AppColors.darkBlue, textColor: AppColors.mediumBlue),
//           const SpaceItem(),
//           _buildInfoRow('Status', status, screenWidth / 8, AppColors.yellow),
//           const SpaceItem(),
//           _buildInfoRow('Truck', truckId, screenWidth / 6.9, AppColors.darkBlue, textColor: AppColors.mediumBlue, isNavigable: true),
//           const SpaceItem(),
//           _buildInfoRow('Driver', driverName, screenWidth / 7.6, AppColors.yellow),
//           const SpaceItem(),
//           _buildInfoRow('Date', tripDate, screenWidth / 5.9, AppColors.mediumBlue),
//           const SpaceItem(),
//           _buildInfoRow('Source', source, screenWidth / 8.2, AppColors.darkBlue, textColor: AppColors.mediumBlue),
//           const SpaceItem(),
//           _buildInfoRow('Desk', sourceDesk, screenWidth / 6.1, AppColors.yellow),
//           const SpaceItem(),
//           _buildInfoRow('Destination', destination, screenWidth / 30, AppColors.darkBlue, textColor: AppColors.mediumBlue),
//           const SpaceItem(),
//           // _buildInfoRow('Desk', destinationDesk, screenWidth / 6.1, AppColors.yellow),
//           // SpaceItem(),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value, double spacing, Color backgroundColor, {Color textColor = Colors.black, bool isNavigable = false}) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontFamily: 'bahnschrift',
//             color: AppColors.darkBlue,
//             fontSize: 16.sp,
//           ),
//         ),
//         SizedBox(
//           width: spacing,
//         ),
//         Expanded(
//           child: GestureDetector(
//             onTap: isNavigable ? () {
//               // Add your navigation logic here
//             } : null,
//             child: Container(
//               height: 40.h,
//               color: backgroundColor,
//               child: Center(
//                 child: Text(
//                   value,
//                   style: TextStyle(
//                     fontFamily: 'bahnschrift',
//                     fontSize: 16.sp,
//                     color: textColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SpaceItem extends StatelessWidget {
//   const SpaceItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return SizedBox(
//       height: screenHeight / 50,
//     );
//   }
// }

// class DividerItem extends StatelessWidget {
//   const DividerItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Divider(
//       color: AppColors.darkBlue,
//       height: 1.0,
//     );
//   }
// }


// class TripRecordText extends StatelessWidget {
//   const TripRecordText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: 'Trip',
//             style: TextStyle(
//               fontSize: 23.sp,
//               fontFamily: 'ScriptMT',
//               color: AppColors.yellow,
//             ),
//           ),
//           TextSpan(
//             text: ' Record',
//             style: TextStyle(
//               fontSize: 23.sp,
//               fontFamily: 'ScriptMT',
//               color: AppColors.darkBlue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
