import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'status_of_order_copy_widget.dart' show StatusOfOrderCopyWidget;
import 'package:flutter/material.dart';

class StatusOfOrderCopyModel extends FlutterFlowModel<StatusOfOrderCopyWidget> {
  ///  Local state fields for this page.

  String? rebuild;

  ///  State fields for stateful widgets in this page.

  List<OrderNotificationsRecord>? statusOfOrderCopyPreviousSnapshot;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
