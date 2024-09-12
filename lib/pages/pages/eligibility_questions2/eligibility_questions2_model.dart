import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'eligibility_questions2_widget.dart' show EligibilityQuestions2Widget;
import 'package:flutter/material.dart';

class EligibilityQuestions2Model
    extends FlutterFlowModel<EligibilityQuestions2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? output;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
