import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_good_entity.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_good_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoodDataScreen extends StatelessWidget {
  final String barcode;

  const GoodDataScreen({super.key, required this.barcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Data Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<GetGoodCubit, PostState<GetGoodEntity>>(
          listener: (context, state) {
state.whenOrNull(
  error: (networkExceptions) {
                      Fluttertoast.showToast(
                        msg: NetworkExceptions.getErrorMessage(networkExceptions),
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
);          },
          builder: (context, state) {
            return state.maybeWhen(orElse: () => Center(child: Text("No Information Available"),),loading: () => const Center(child: CupertinoActivityIndicator(),),success: (data) =>ListView(
              children: <Widget>[
                GoodDataCard(data: data.data),
              ],
            ) ,);
          },
        ),
      ),
    );
  }
}

class GoodDataCard extends StatelessWidget {
  final GoodData data;

  GoodDataCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DataRow(label: 'ID', value: data.id.toString()),
            DataRow(label: 'Warehouse ID', value: data.warehouseId.toString()),
            DataRow(label: 'Type', value: data.type),
            DataRow(label: 'Quantity', value: data.quantity.toString()),
            DataRow(label: 'Weight', value: data.weight.toString()),
            DataRow(label: 'Size', value: data.size),
            DataRow(label: 'Content', value: data.content),
            DataRow(label: 'Marks', value: data.marks),
            DataRow(label: 'Truck', value: data.truck),
            DataRow(label: 'Driver', value: data.driver),
            DataRow(label: 'Destination', value: data.destination),
            DataRow(label: 'Ship Date', value: data.shipDate),
            DataRow(label: 'Date', value: data.date),
            DataRow(label: 'Sender', value: data.sender),
            DataRow(label: 'Receiver', value: data.receiver),
            DataRow(label: 'Barcode', value: data.barcode),
          ],
        ),
      ),
    );
  }
}

class DataRow extends StatelessWidget {
  final String label;
  final String value;

  DataRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.pureBlack,
            ),
          ),
        ],
      ),
    );
  }
}
