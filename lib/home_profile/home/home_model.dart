import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_profile/components/home_faqs/home_faqs_widget.dart';
import '/home_profile/components/home_hearder/home_hearder_widget.dart';
import '/home_profile/components/order_trackings/order_trackings_widget.dart';
import '/order/reting_component/reting_component_widget.dart';
import '/shimmer/service_availability/service_availability_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkLocationPermission] action in Home widget.
  bool? location;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for HomeHearderTop.
  late HomeHearderModel homeHearderTopModel;
  // Model for homeFaqs component.
  late HomeFaqsModel homeFaqsModel;
  // Model for service_availability component.
  late ServiceAvailabilityModel serviceAvailabilityModel;
  // Model for orderTrackings.
  late OrderTrackingsModel orderTrackingsModel;
  // Models for retingComponent dynamic component.
  late FlutterFlowDynamicModels<RetingComponentModel> retingComponentModels;

  /// Query cache managers for this widget.

  final _serviceabilityManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> serviceability({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _serviceabilityManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearServiceabilityCache() => _serviceabilityManager.clear();
  void clearServiceabilityCacheKey(String? uniqueKey) =>
      _serviceabilityManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    homeHearderTopModel = createModel(context, () => HomeHearderModel());
    homeFaqsModel = createModel(context, () => HomeFaqsModel());
    serviceAvailabilityModel =
        createModel(context, () => ServiceAvailabilityModel());
    orderTrackingsModel = createModel(context, () => OrderTrackingsModel());
    retingComponentModels =
        FlutterFlowDynamicModels(() => RetingComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    homeHearderTopModel.dispose();
    homeFaqsModel.dispose();
    serviceAvailabilityModel.dispose();
    orderTrackingsModel.dispose();
    retingComponentModels.dispose();

    /// Dispose query cache managers for this widget.

    clearServiceabilityCache();
  }
}
