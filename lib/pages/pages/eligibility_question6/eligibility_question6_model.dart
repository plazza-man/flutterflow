import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'eligibility_question6_widget.dart' show EligibilityQuestion6Widget;
import 'package:flutter/material.dart';

class EligibilityQuestion6Model
    extends FlutterFlowModel<EligibilityQuestion6Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? output6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
