import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_customers_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_customers_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/customer_widget/customer_list_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomersListViewPaginatedWidget extends StatefulWidget {
  const CustomersListViewPaginatedWidget({super.key});

  @override
  _CustomersListViewPaginatedWidgetState createState() => _CustomersListViewPaginatedWidgetState();
}

class _CustomersListViewPaginatedWidgetState extends State<CustomersListViewPaginatedWidget> {
  late GetAllCustomersEmployeePaginatedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllCustomersEmployeePaginatedCubit>();
    cubit.emitGetAllCustomers();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCustomersEmployeePaginatedCubit,
        PaginationStateTest<GetCustomerEmployeePaginatedEntity>>(
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(exception),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
          success: (data, canLoadMore) {
            if (canLoadMore == cubit.lastPage) {
              _refreshController.loadNoData();
            } else {
              _refreshController.loadComplete();
            }
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (customers, canLoadMore) {
            return SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetAllCustomers(),
              onLoading: () => cubit.emitGetAllCustomers(loadMore: true),
              enablePullUp: canLoadMore != 0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  GetCustomerEmployeePaginatedEntity customer =
                      customers[index];
                  return CustomerListTileWidget(
                    customerId: customer.id,
                    customerName: customer.name,
                    customerAddress: customer.address,
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.darkBlue),
                itemCount: customers.length,
              ),
            );
          },
          orElse: () => const Center(child: Text('No customers available')),
        );
      },
    );
  }
}
