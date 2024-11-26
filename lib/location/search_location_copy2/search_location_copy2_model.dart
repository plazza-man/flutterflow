import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmer/location_search_shimmer/location_search_shimmer_widget.dart';
import 'search_location_copy2_widget.dart' show SearchLocationCopy2Widget;
import 'package:flutter/material.dart';

class SearchLocationCopy2Model
    extends FlutterFlowModel<SearchLocationCopy2Widget> {
  ///  Local state fields for this page.

  int spread = -10;

  bool loader = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (googleMapSearch)] action in TextField widget.
  ApiCallResponse? apiResultn68;
  // Stores action output result for [Custom Action - locationPermissionDenied] action in Row widget.
  bool? locations;
  // Model for LocationSearchShimmer component.
  late LocationSearchShimmerModel locationSearchShimmerModel;
  // Stores action output result for [Backend Call - API (findlatlng By Place Id)] action in Container widget.
  ApiCallResponse? getLatlng;

  @override
  void initState(BuildContext context) {
    locationSearchShimmerModel =
        createModel(context, () => LocationSearchShimmerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    locationSearchShimmerModel.dispose();
  }
}
