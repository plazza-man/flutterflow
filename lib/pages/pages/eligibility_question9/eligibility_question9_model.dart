import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'eligibility_question9_widget.dart' show EligibilityQuestion9Widget;
import 'package:flutter/material.dart';

class EligibilityQuestion9Model
    extends FlutterFlowModel<EligibilityQuestion9Widget> {
  ///  Local state fields for this page.

  bool onTap0 = false;

  bool ontap1 = false;

  bool ontap2 = false;

  bool ontap3 = false;

  bool ontap4 = false;

  bool ontap5 = false;

  bool onTap6 = false;

  bool onTap7 = false;

  bool onTap8 = false;

  bool onTap9 = false;

  bool onTap10 = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
