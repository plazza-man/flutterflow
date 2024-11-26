import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/reting_component/reting_component_widget.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  Local state fields for this page.

  String? rebuild;

  bool loadApi = false;

  ///  State fields for stateful widgets in this page.

  List<AppOrderRecord>? historyPreviousSnapshot;
  // Models for retingComponent dynamic component.
  late FlutterFlowDynamicModels<RetingComponentModel> retingComponentModels;

  @override
  void initState(BuildContext context) {
    retingComponentModels =
        FlutterFlowDynamicModels(() => RetingComponentModel());
  }

  @override
  void dispose() {
    retingComponentModels.dispose();
  }
}
