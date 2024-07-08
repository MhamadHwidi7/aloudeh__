
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/custom_appbar_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/manifest_table_header_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_info_header_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_invoice_all_widgets.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/get_manifest_params.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_manifest_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WarehouseManifestScreen extends StatelessWidget {
  final String manifestId;

  const WarehouseManifestScreen({super.key, required this.manifestId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Manifest',
        onBackPress: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 75),
          TripInfoHeader(manifestId: manifestId),
          const Divider(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                border: Border.all(color: AppColors.darkBlue),
              ),
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Row(
                children: [
                  const ManifestTableHeader(),
                  const VerticalDivider(color: AppColors.darkBlue),
                   Expanded(child: WarehouseManifestListViewTableWidget(manifestNumber: manifestId,)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WarehouseManifestListViewTableWidget extends StatefulWidget {
  final String manifestNumber;
  const WarehouseManifestListViewTableWidget({super.key, required this.manifestNumber});

  @override
  State<WarehouseManifestListViewTableWidget> createState() => _WarehouseManifestListViewTableWidgetState();
}

class _WarehouseManifestListViewTableWidgetState extends State<WarehouseManifestListViewTableWidget> {
  @override
  void initState() {
    context.read<GetManifestWarehouseCubit>().emitGetManifest(getManifestParams: GetManifestParams(tripNumber: widget.manifestNumber));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetManifestWarehouseCubit, GetState<GetManifestWarehouseEntity>>(
      listener: (context, state) {
state.whenOrNull(
   error: (NetworkExceptions exception) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(exception),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
);      },
      builder: (context, state) {
        return state.maybeWhen(orElse: ()=> const SizedBox(),loading: () => const CupertinoActivityIndicator(),success: (data) =>  ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            ShippingData shipping = data.data.shippings[index];
            return  WarehouseManifestItem(data: shipping,);
          },
          separatorBuilder: (context, index) =>
              Container(width: 1.h, color: AppColors.mediumBlue),
          itemCount: data.data.shippings.length,
        ),);
      },
    );
  }
}

class WarehouseManifestItem extends StatelessWidget {
  final ShippingData data;
  const WarehouseManifestItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
           ManifestItemDetail(value: data.id.toString()),
          // const ManifestItemDetail(value: '5478'),
           ManifestItemDetail(value: data.sourceName),
           ManifestItemDetail(value: data.content),
           ManifestItemDetail(value: data.numOfPackages.toString()),
           ManifestItemDetail(value: data.sender),
           ManifestItemDetail(value: data.receiver),
           ManifestItemDetail(value: data.againstShipping ?? " - "),
           ManifestItemDetail(value:data.miscellaneous ?? " - "),
           ManifestItemDetail(value: data.prepaid ?? " - "),
           ManifestItemDetail(value: data.discount ?? " - "),
           ManifestItemDetail(value: data.collection ?? " - "),
           ManifestItemDetail(value: data.adapter ?? " - "),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                           WarehouseTripInvoiceScreen(   destinationId: data.destinationId.toString(),
                    sourceName: data.sourceName,
                    prePaid: data.prepaid ?? " - ",
                    destionationName: data.destinationName,
                    size:data.size,
                    senderName: data.sender,
                    receiverName: data.receiver,
                    notes: data.notes ?? " - ",
                    numOfPackages: data.numOfPackages?.toString() ?? " - ",
                    // type: data.type,
                    content: data.content,
                    weight: data.weight.toString(),
                    marks: data.marks,
                    discount: data.discount ?? " - ",
                    shippingCost: data.shippingCost,
                    againstShipping: data.againstShipping ?? " - ",
                    adaptar: data.adapter ??  " - ",
                    miscllaneous: data.miscellaneous ??  " - ",)));
            },
            icon: const Icon(Icons.remove_red_eye, color: AppColors.darkBlue),
          ),
        ],
      ),
    );
  }
}



class ManifestItemDetail extends StatelessWidget {
  final String value;

  const ManifestItemDetail({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        value,
        style: TextStyle(
            color: AppColors.pureBlack,
            fontFamily: 'bahnschrift',
            fontSize: 16.sp),
      ),
    );
  }
}
class WarehouseTripInvoiceScreen extends StatelessWidget {
  final String destinationId;
  final String sourceName;
  final String destionationName;
  final String senderName;
  final String receiverName;
  final String notes;
  final String numOfPackages;
  final String content;
  final String weight;
  final String marks;
  final String discount;
  final String shippingCost;
  final String againstShipping;
  final String adaptar;
  final String miscllaneous;
  final String prePaid;
  final String size;

  const WarehouseTripInvoiceScreen({
    super.key,
    required this.destinationId,
    required this.sourceName,
    required this.destionationName,
    required this.senderName,
    required this.receiverName,
    required this.notes,
    required this.numOfPackages,
    required this.content,
    required this.weight,
    required this.marks,
    required this.discount,
    required this.shippingCost,
    required this.againstShipping,
    required this.adaptar,
    required this.miscllaneous,
    required this.size,
    required this.prePaid,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
       appBar: CustomAppBar(
    title: 'Trip Invoice',
    onBackPress: () => Navigator.pop(context),
  ),
      body: ListView(
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: InfoColumn(
                    label: 'Source',
                    value: sourceName,
                    backgroundColor: AppColors.darkBlue,
                    textColor: AppColors.pureWhite,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: InfoColumn(
                    label: 'Destination',
                    value: destionationName,
                    backgroundColor: AppColors.yellow,
                    textColor: AppColors.darkBlue,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                InfoRow(
                  label: 'Sender',
                  value: senderName,
                  widthFactor: screenWidth / 11.3,
                  backgroundColor: AppColors.mediumBlue,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Recipient',
                  value: receiverName,
                  widthFactor: screenWidth / 22,
                  backgroundColor: AppColors.mediumBlue,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Notes',
                  value: notes,
                  widthFactor: screenWidth / 8.9,
                  backgroundColor: AppColors.mediumBlue,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoHeader(label: 'Package Information'),
                const SizedBox(height: 20.0),
                InfoRow(
                  label: 'Num Of Packages',
                  value: numOfPackages,
                  widthFactor: screenWidth / 20,
                  backgroundColor: AppColors.darkBlue,
                  textColor: AppColors.pureWhite,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Content',
                  value: content,
                  widthFactor: screenWidth / 4.2,
                  backgroundColor: AppColors.darkBlue,
                  textColor: AppColors.pureWhite,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Weight',
                  value: weight,
                  widthFactor: screenWidth / 3.85,
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.pureBlack,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Marks',
                  value: marks,
                  widthFactor: screenWidth / 3.7,
                  backgroundColor: AppColors.darkBlue,
                  textColor: AppColors.pureWhite,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Size',
                  value: size,
                  widthFactor: screenWidth / 3.23,
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.pureBlack,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoHeader(label: 'Costs'),
                
                const SizedBox(height: 10.0),
                const CostHeaderRow(),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Shipping Costs',
                  prepaidValue: prePaid.isNotEmpty ? prePaid : null,
                  collectionValue: shippingCost,
                ),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Against Shipping',
                  prepaidValue: againstShipping.isNotEmpty ? againstShipping : null,
                  collectionValue: againstShipping,
                ),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Miscellaneous \\ Adapter',
                  collectionValue: miscllaneous,
                ),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Discount',
                  collectionValue: discount,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
