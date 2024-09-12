import '/flutter_flow/flutter_flow_util.dart';
import 'eligibility_questions0_widget.dart' show EligibilityQuestions0Widget;
import 'package:flutter/material.dart';

class EligibilityQuestions0Model
    extends FlutterFlowModel<EligibilityQuestions0Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - decentro] action in Text widget.
  String? text;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'That date doesn\'t look valid—it\'s incomplete or doesn\'t exist';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? output;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
