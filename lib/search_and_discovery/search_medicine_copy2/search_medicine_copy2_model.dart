import '/backend/api_requests/api_calls.dart';
import '/cart/addtocart/addtocart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmer/medicineshimmer/medicineshimmer_widget.dart';
import 'search_medicine_copy2_widget.dart' show SearchMedicineCopy2Widget;
import 'package:flutter/material.dart';

class SearchMedicineCopy2Model
    extends FlutterFlowModel<SearchMedicineCopy2Widget> {
  ///  Local state fields for this page.

  bool? loading;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API ( medicine Search test)] action in TextField widget.
  ApiCallResponse? searchtext;
  // Models for Addtocart dynamic component.
  late FlutterFlowDynamicModels<AddtocartModel> addtocartModels;
  // Model for medicineshimmer component.
  late MedicineshimmerModel medicineshimmerModel;

  @override
  void initState(BuildContext context) {
    addtocartModels = FlutterFlowDynamicModels(() => AddtocartModel());
    medicineshimmerModel = createModel(context, () => MedicineshimmerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();

    addtocartModels.dispose();
    medicineshimmerModel.dispose();
  }
}
