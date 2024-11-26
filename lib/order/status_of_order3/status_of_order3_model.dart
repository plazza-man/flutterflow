import '/flutter_flow/flutter_flow_util.dart';
import '/order/time/time_widget.dart';
import 'status_of_order3_widget.dart' show StatusOfOrder3Widget;
import 'package:flutter/material.dart';

class StatusOfOrder3Model extends FlutterFlowModel<StatusOfOrder3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for time component.
  late TimeModel timeModel;

  @override
  void initState(BuildContext context) {
    timeModel = createModel(context, () => TimeModel());
  }

  @override
  void dispose() {
    timeModel.dispose();
  }
}
