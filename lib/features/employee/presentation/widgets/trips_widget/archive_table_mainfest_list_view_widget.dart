
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/archive_manifest_item_details_widget.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/manifest_params.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_manifest_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ArchivedManifestListViewTableWidget extends StatefulWidget {
  final String manifestNumber;
  const ArchivedManifestListViewTableWidget({super.key, required this.manifestNumber});

  @override
  State<ArchivedManifestListViewTableWidget> createState() => _ArchivedManifestListViewTableWidgetState();
}

class _ArchivedManifestListViewTableWidgetState extends State<ArchivedManifestListViewTableWidget> {
  @override
  void initState() {
    context.read<GetManifestSharedCubit>().emitGetManifest(manifestSharedParams: ManifestSharedParams(manifestNumber: widget.manifestNumber));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetManifestSharedCubit, GetState<GetManifestSharedEntity>>(
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
            return  ArchivedManifestItem(data: shipping,);
          },
          separatorBuilder: (context, index) =>
              Container(width: 1.h, color: AppColors.mediumBlue),
          itemCount: data.data.shippings.length,
        ),);
      },
    );
  }
}
