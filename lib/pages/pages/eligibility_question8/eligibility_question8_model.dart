import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'eligibility_question8_widget.dart' show EligibilityQuestion8Widget;
import 'package:flutter/material.dart';

class EligibilityQuestion8Model
    extends FlutterFlowModel<EligibilityQuestion8Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? output7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
