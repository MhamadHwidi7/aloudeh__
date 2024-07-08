import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/employee/data/params/add_invoice_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_invoice_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_customer_filter_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/add_customer_screen.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/shipping_type_entity.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_branches_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_shipping_prices_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
// import 'package:aloudeh_company/features/employee/presentation/screens/add_customer_screen.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_customer_filter_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_customer_filter_params.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
class AddInvoiceScreen extends StatefulWidget {
  final String manifestNumber;

  const AddInvoiceScreen({super.key, required this.manifestNumber});
  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController senderController = TextEditingController();
  final TextEditingController senderPhoneNumber = TextEditingController();
  final TextEditingController recipientPhoneNumberController = TextEditingController();
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController numOfPackagesController = TextEditingController();
  final TextEditingController packageTypeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final TextEditingController prepaidCostController = TextEditingController();
  final TextEditingController collectionCostController = TextEditingController();
  final TextEditingController prepaidAgainstShippingController = TextEditingController();
  final TextEditingController collectionAgainstShippingController = TextEditingController();
  final TextEditingController collectionAdapterController = TextEditingController();
  final TextEditingController collectionDiscountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  GetAllBranchesPaginatedSharedEntity? selectedDestination;
  GetAllBranchesPaginatedSharedEntity? selectedSource;
  TypePaginatedSharedEntity? selectedType;

  bool showList = false;
  List<CustomerData> searchResults = [];
  
  @override
  void initState() {
    super.initState();
    senderController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    senderController.removeListener(_onSearchChanged);
    senderController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = senderController.text;
    if (query.isNotEmpty) {
      setState(() {
        showList = true;
      });
      context.read<GetCustomerFilterCubit>().emitGetCustomerFilter(
            getCustomerFilterParams: GetCustomerFilterParams(name: query),
          );
    } else {
      setState(() {
        showList = false;
        searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Tr',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontFamily: 'ScriptMT',
                    color: AppColors.yellow,
                  ),
                ),
                TextSpan(
                  text: 'ip Invo',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontFamily: 'ScriptMT',
                    color: AppColors.darkBlue,
                  ),
                ),
                TextSpan(
                  text: 'ice',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontFamily: 'ScriptMT',
                    color: AppColors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.darkBlue,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: AppColors.mediumBlue,
            height: 1.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildSourceDestinationSection(),
                Divider(),
                _buildSenderRecipientNotesSection(),
                const SizedBox(height: 10),
                _buildRecipientRow(),
                const SizedBox(height: 10),
                _buildRecipientNumberRow(),
                const SizedBox(height: 10),
                _buildNotesRow(),
                const SizedBox(height: 10),
                Divider(),
                _buildPackageInfoSection(),
                Divider(),
                _buildCostsSection(),
                const SizedBox(height: 10),
                _buildAddInvoiceButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSourceDestinationSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTextLabel('Source'),
              BranchDropdown(
                onChanged: (source) {
                  setState(() {
                    sourceController.text = source.branchDesk;
                    selectedSource = source;
                  });
                },
                selectedValue: selectedSource,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            children: [
              _buildTextLabel('Destination'),
              DestinationDropdown(
                onChanged: (destination) {
                  setState(() {
                    destinationController.text = destination.branchDesk;
                    selectedDestination = destination;
                  });
                },
                selectedValue: selectedDestination,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSenderRecipientNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextLabel('Sender'),
        TextField(
          controller: senderController,
          decoration: InputDecoration(
            hintText: 'Enter sender name...',
            suffixIcon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddCustomerScreen()));
              },
              icon: Icon(Icons.add),
            ),
            hintStyle: TextStyle(fontSize: 16, color: CupertinoColors.activeGreen),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: AppColors.mediumBlue),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        if (showList)
          BlocConsumer<GetCustomerFilterCubit, PostState<GetCustomersFilterEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (error) {
                  Fluttertoast.showToast(
                    msg: NetworkExceptions.getErrorMessage(error),
                    toastLength: Toast.LENGTH_SHORT,
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                success: (data) {
                  searchResults = data.data;
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final customer = searchResults[index];
                        return ListTile(
                          title: Text(customer.name),
                          onTap: () {
                            setState(() {
                              senderController.text = customer.name;
                              senderPhoneNumber.text = customer.phoneNumber.toString();
                              showList = false;
                            });
                          },
                        );
                      },
                    ),
                  );
                },
                orElse: () => Container(),
              );
            },
          ),
      ],
    );
  }

  Widget _buildRecipientRow() {
    return Row(
      children: [
        _buildTextLabel('Recipient'),
        SizedBox(width: 20.w),
        Expanded(
          child: TextFormField(
            controller: recipientController,
            cursorColor: AppColors.darkBlue,
            style: TextStyle(color: AppColors.pureWhite),
            decoration: _inputDecoration(AppColors.mediumBlue),
          ),
        ),
      ],
    );
  }

  Widget _buildRecipientNumberRow() {
    return Row(
      children: [
        _buildTextLabel('Rec. Number'),
        SizedBox(width: 20.w),
        Expanded(
          child: TextFormField(
            controller: recipientPhoneNumberController,
            cursorColor: AppColors.darkBlue,
            style: TextStyle(color: AppColors.pureWhite),
            decoration: _inputDecoration(AppColors.mediumBlue),
          ),
        ),
      ],
    );
  }

  Widget _buildNotesRow() {
    return Row(
      children: [
        _buildTextLabel('Notes'),
        SizedBox(width: 20.w),
        Expanded(
          child: TextFormField(
            controller: notesController,
            cursorColor: AppColors.darkBlue,
            style: TextStyle(color: AppColors.pureWhite),
            decoration: _inputDecoration(AppColors.mediumBlue),
          ),
        ),
      ],
    );
  }

  Widget _buildPackageInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        _buildSectionTitle('Package Information'),
        const SizedBox(height: 10),
        _buildPackageInfoRow('Num Of Packages', numOfPackagesController, AppColors.darkBlue, AppColors.pureWhite),
        const SizedBox(height: 10),
        TypePriceListDropdown(
          onChanged: (ss) {
            setState(() {
              packageTypeController.text = ss.id.toString();
              selectedType = ss;
            });
          },
          selectedValue: selectedType,
        ),
        const SizedBox(height: 10),
        _buildPackageInfoRow('Content', contentController, AppColors.darkBlue, AppColors.pureWhite),
        const SizedBox(height: 10),
        _buildPackageInfoRow('Weight', weightController, AppColors.yellow, AppColors.pureBlack),
        const SizedBox(height: 10),
        _buildPackageInfoRow('Marks', marksController, AppColors.darkBlue, AppColors.pureWhite),
        const SizedBox(height: 10),
        _buildSizeDropdown(),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildSizeDropdown() {
    return Row(
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.pureBlack,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: _inputDecoration(AppColors.yellow),
            value: sizeController.text.isEmpty ? null : sizeController.text,
            items: ['Ultra Small', 'Small', 'Medium', 'Large', 'Ultra Large']
                .map((size) => DropdownMenuItem(
                      value: size,
                      child: Text(size),
                    ))
                .toList(),
            onChanged: (newValue) {
              setState(() {
                sizeController.text = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCostsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        _buildSectionTitle('Costs'),
        SizedBox(height: 5.h),
        _buildCostsHeaderRow(),
        const SizedBox(height: 10),
        _buildCostsDetailRow('Shipping Costs', prepaidCostController, collectionCostController),
        const SizedBox(height: 10),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildAddInvoiceButton() {
    return BlocConsumer<AddInvoiceCubit, PostState<BaseEntity>>(
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(exception),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
          success: (data) => Navigator.pop(context),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          idle: () => _buildAddButton(context),
          orElse: () => _buildAddButton(context),
          loading: () => const CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37.r),
        color: AppColors.darkBlue,
      ),
      child: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            if (selectedSource != null && selectedDestination != null && selectedType != null) {
              context.read<AddInvoiceCubit>().emitAddInvoice(
                addInvoiceParams: AddInvoiceParams(
                  sourceId: selectedSource!.branchId,
                  destinationId: selectedDestination!.branchId,
                  manifestNumber: widget.manifestNumber,
                  sender: senderController.text,
                  receiver: recipientController.text,
                  senderNumber: senderPhoneNumber.text,
                  receiverNumber: recipientPhoneNumberController.text,
                  numOfPackages: numOfPackagesController.text,
                  typeId: selectedType!.id.toString(),
                  weight: weightController.text,
                  size: sizeController.text,
                  content: contentController.text,
                  marks: marksController.text,
                  shippingCost: double.tryParse(prepaidCostController.text),
                  againstShipping: double.tryParse(collectionAgainstShippingController.text),
                  adapter: double.tryParse(collectionAdapterController.text),
                  advance: double.tryParse(collectionAgainstShippingController.text),
                  miscellaneous: double.tryParse(contentController.text),
                  prepaid: double.tryParse(prepaidCostController.text),
                  discount: double.tryParse(collectionDiscountController.text),
                  collection: double.tryParse(collectionCostController.text),
                  quantity: numOfPackagesController.text,
                ),
              );
            } else {
              Fluttertoast.showToast(
                msg: "Please select both source and destination",
                toastLength: Toast.LENGTH_SHORT,
              );
            }
          } else {
            Fluttertoast.showToast(
              msg: "Please fill out all required fields",
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
        backgroundColor: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(37.r),
            topLeft: Radius.circular(37.r),
          ),
        ),
        child: Text(
          'Add',
          style: TextStyle(
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.bold,
            fontSize: 17.0.sp,
            color: AppColors.mediumBlue,
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(Color fillColor) {
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildTextLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'bahnschrift',
        color: AppColors.darkBlue,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'bahnschrift',
        color: AppColors.yellow,
        fontSize: 17.sp,
      ),
    );
  }

  Widget _buildPackageInfoRow(String label, TextEditingController controller, Color fillColor, Color textColor) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.pureBlack,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: TextFormField(
            controller: controller,
            cursorColor: AppColors.darkBlue,
            style: TextStyle(color: textColor),
            decoration: _inputDecoration(fillColor),
          ),
        ),
      ],
    );
  }

  Widget _buildCostsHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(color: AppColors.pureWhite),
        _buildTextLabel('Prepaid'),
        _buildTextLabel('Collection'),
      ],
    );
  }

  Widget _buildCostsDetailRow(String label, TextEditingController prepaidController, TextEditingController collectionController) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: 'bahnschrift',
                color: AppColors.pureBlack,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: TextFormField(
            controller: prepaidController,
            cursorColor: AppColors.darkBlue,
            style: TextStyle(color: AppColors.pureWhite),
            decoration: _inputDecoration(AppColors.mediumBlue),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: TextFormField(
            controller: collectionController,
            cursorColor: AppColors.darkBlue,
            style: TextStyle(color: AppColors.pureWhite),
            decoration: _inputDecoration(AppColors.mediumBlue),
          ),
        ),
      ],
    );
  }
}

// Dropdowns (Branch and Destination)
class BranchDropdown extends StatefulWidget {
  final ValueChanged<GetAllBranchesPaginatedSharedEntity> onChanged;
  final GetAllBranchesPaginatedSharedEntity? selectedValue;

  BranchDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _BranchDropdownState createState() => _BranchDropdownState();
}

class _BranchDropdownState extends State<BranchDropdown> {
  late GetAllBranchsPaginatedSharedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllBranchsPaginatedSharedCubit>();
    cubit.emitGetAllBranches();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _showDropdown(BuildContext context) {
    cubit.emitGetAllBranches();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: BlocConsumer<GetAllBranchsPaginatedSharedCubit,
              PaginationSharedState<GetAllBranchesPaginatedSharedEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (exception) {
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
                orElse: () => Center(child: Text("No data available")),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (data, canLoadMore) {
                  return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: canLoadMore != 0,
                    controller: _refreshController,
                    onRefresh: () => cubit.emitGetAllBranches(),
                    onLoading: () => cubit.emitGetAllBranches(loadMore: true),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        GetAllBranchesPaginatedSharedEntity branch = data[index];
                        return ListTile(
                          title: Text(branch.branchDesk.toString()),
                          onTap: () {
                            widget.onChanged(branch);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  );
                },
              );  
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumBlue),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.branchDesk.toString() ?? 'Select Branch',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}
class DestinationDropdown extends StatefulWidget {
  final ValueChanged<GetAllBranchesPaginatedSharedEntity> onChanged;
  final GetAllBranchesPaginatedSharedEntity? selectedValue;

  DestinationDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _DestinationDropdownState createState() => _DestinationDropdownState();
}

class _DestinationDropdownState extends State<DestinationDropdown> {
  late GetAllBranchsPaginatedSharedCubit cubit;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllBranchsPaginatedSharedCubit>();
    cubit.emitGetAllBranches();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _showDropdown(BuildContext context) {
    cubit.emitGetAllBranches();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: BlocConsumer<GetAllBranchsPaginatedSharedCubit, PaginationSharedState<GetAllBranchesPaginatedSharedEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (exception) {
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
                orElse: () => const Center(child: Text("No data available")),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (data, canLoadMore) {
                  return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: canLoadMore != 0,
                    controller: _refreshController,
                    onRefresh: () => cubit.emitGetAllBranches(),
                    onLoading: () => cubit.emitGetAllBranches(loadMore: true),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        GetAllBranchesPaginatedSharedEntity branch = data[index];
                        return ListTile(
                          title: Text(branch.branchDesk.toString()),
                          onTap: () {
                            widget.onChanged(branch);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumBlue),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.branchDesk.toString() ?? 'Select Destination',
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}



 class TypePriceListDropdown extends StatefulWidget {
  final ValueChanged<TypePaginatedSharedEntity> onChanged;
  final TypePaginatedSharedEntity? selectedValue;

  TypePriceListDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _TypePriceListDropdownState createState() => _TypePriceListDropdownState();
}

class _TypePriceListDropdownState extends State<TypePriceListDropdown> {
  late GetShippingPricesPaginatedSharedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetShippingPricesPaginatedSharedCubit>();
    cubit.emitGetAllShippingPrices();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _showDropdown(BuildContext context) {
    cubit.emitGetAllShippingPrices();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: BlocConsumer<GetShippingPricesPaginatedSharedCubit,
              PaginationSharedState<TypePaginatedSharedEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (exception) {
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
                orElse: () => Center(child: Text("No data available")),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (data, canLoadMore) {
                  return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: canLoadMore != 0,
                    controller: _refreshController,
                    onRefresh: () => cubit.emitGetAllShippingPrices(),
                    onLoading: () => cubit.emitGetAllShippingPrices(loadMore: true),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        TypePaginatedSharedEntity type = data[index];
                        return ListTile(
                          title: Text(type.type),
                          onTap: () {
                            widget.onChanged(type);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  );
                },
              );  
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumBlue),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.type ?? 'Select Type',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}
