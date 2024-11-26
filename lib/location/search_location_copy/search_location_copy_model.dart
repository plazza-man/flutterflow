import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_location_copy_widget.dart' show SearchLocationCopyWidget;
import 'package:flutter/material.dart';

class SearchLocationCopyModel
    extends FlutterFlowModel<SearchLocationCopyWidget> {
  ///  Local state fields for this page.

  int spread = -10;

  bool currentLoc = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (googleMapSearch)] action in TextField widget.
  ApiCallResponse? apiResultn68;
  // Stores action output result for [Custom Action - locationPermissionDenied] action in Row widget.
  bool? locations;
  // Stores action output result for [Backend Call - API (findlatlng By Place Id)] action in Container widget.
  ApiCallResponse? getLatlng;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
