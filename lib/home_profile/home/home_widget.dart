import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_profile/components/home_faqs/home_faqs_widget.dart';
import '/home_profile/components/home_hearder/home_hearder_widget.dart';
import '/home_profile/components/order_trackings/order_trackings_widget.dart';
import '/location/components/add_new_address/add_new_address_widget.dart';
import '/order/reting_component/reting_component_widget.dart';
import '/pages/authentication/sign_in/sign_in_widget.dart';
import '/shimmer/comman_shimmer/comman_shimmer_widget.dart';
import '/shimmer/home_shimmer/home_shimmer_widget.dart';
import '/shimmer/service_availability/service_availability_widget.dart';
import '/shimmer/shimmer/shimmer_widget.dart';
import '/shimmer/shimmer_history/shimmer_history_widget.dart';
import '/upload_prescription/components/upload_prescriptions/upload_prescriptions_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if ((FFAppConstants.appversion >= getRemoteConfigDouble('app_version')) ||
          FFAppState().IsNotmandatory) {
        if (!((FFAppState().address.lat != '') &&
            (FFAppState().address.lng != ''))) {
          _model.location = await actions.checkLocationPermission();
          if (_model.location!) {
            FFAppState().address = AppAddressStruct(
              lat: functions.getLet(currentUserLocationValue!),
              lng: functions.getLng(currentUserLocationValue!),
            );
            safeSetState(() {});
          } else {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return WebViewAware(
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: const AddNewAddressWidget(
                      pagename: 'Home',
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          }
        }
        if ((FFAppState().cachehome == 0) || (FFAppState().cachehome == 2)) {
          FFAppState().clearAppAssetsCache();
          _model.clearServiceabilityCache();
          FFAppState().cachehome = FFAppState().cachehome + 1;
          safeSetState(() {});
          await Future.delayed(const Duration(milliseconds: 1000));
          FFAppState().cachehome = FFAppState().cachehome + 1;
          safeSetState(() {});
        } else {
          FFAppState().cachehome = FFAppState().cachehome + 1;
          safeSetState(() {});
        }
      } else {
        context.goNamed('UpdateApp');
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<AppResourcesRecord>>(
      future: FFAppState().appAssets(
        uniqueQueryKey: 'AppAssets',
        overrideCache: FFAppState().cachehome == 1,
        requestFn: () => queryAppResourcesRecordOnce(
          singleRecord: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const HomeShimmerWidget(),
          );
        }
        List<AppResourcesRecord> homeAppResourcesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homeAppResourcesRecord = homeAppResourcesRecordList.isNotEmpty
            ? homeAppResourcesRecordList.first
            : null;

        return Title(
            title: 'Home',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              floatingActionButton: Visibility(
                visible: (functions
                            .addlist(FFAppState()
                                .CartMedicineDetails
                                .map((e) => e.quantity)
                                .toList())
                            .toString() !=
                        '0') &&
                    FFAppState().Serviceability.addressIdSet,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.59),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        context.pushNamed(
                          'medicineCart',
                          queryParameters: {
                            'ticketId': serializeParam(
                              FFAppState().cartId.ticketid,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                                            },
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      elevation: 8.0,
                      label: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'View cart',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineLargeFamily),
                                      ),
                                ),
                                Text(
                                  '${functions.addlist(FFAppState().CartMedicineDetails.map((e) => e.quantity).toList()).toString()} ITEMS',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                              ],
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(
                                  'medicineCart',
                                  queryParameters: {
                                    'ticketId': serializeParam(
                                      FFAppState().cartId.ticketid,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                                                            },
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              appBar: responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ) &&
                      (!isAndroid && !isiOS && !isWeb)
                  ? AppBar(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      automaticallyImplyLeading: false,
                      actions: const [],
                      centerTitle: true,
                      elevation: 0.0,
                    )
                  : null,
              body: SafeArea(
                top: true,
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Visibility(
                            visible: (FFAppState().address.lat != '') &&
                                (FFAppState().address.lng != ''),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    FutureBuilder<ApiCallResponse>(
                                  future: _model.serviceability(
                                    uniqueQueryKey: 'Serviceability',
                                    overrideCache:
                                        (FFAppState().cachehome == 1) &&
                                            (FFAppState().cachehome == 3),
                                    requestFn: () => ServiceabilityCall.call(
                                      lng: FFAppState().address.lng,
                                      lat: FFAppState().address.lat,
                                      phonenumber: functions
                                          .getphoneNumber(currentPhoneNumber),
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const HomeShimmerWidget();
                                    }
                                    final containerServiceabilityResponse =
                                        snapshot.data!;

                                    return Container(
                                      constraints: BoxConstraints(
                                        maxWidth: isWeb
                                            ? () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return FFAppState()
                                                      .width
                                                      .small
                                                      .toDouble();
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return FFAppState()
                                                      .width
                                                      .medium
                                                      .toDouble();
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return FFAppState()
                                                      .width
                                                      .large
                                                      .toDouble();
                                                } else {
                                                  return FFAppState()
                                                      .width
                                                      .small
                                                      .toDouble();
                                                }
                                              }()
                                            : FFAppState()
                                                .width
                                                .small
                                                .toDouble(),
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFFEDF8),
                                      ),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: const BoxDecoration(),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .homeHearderTopModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child: HomeHearderWidget(
                                                        deliverytime: ServiceabilityCall
                                                                .serviceable(
                                                          containerServiceabilityResponse
                                                              .jsonBody,
                                                        )!
                                                            ? '${ServiceabilityCall.pharmacyDeliveryTime(
                                                                containerServiceabilityResponse
                                                                    .jsonBody,
                                                              )?.toString()} minutes'
                                                            : 'Coming soon',
                                                        latlng:
                                                            '${FFAppState().address.lat},${FFAppState().address.lng}',
                                                        localityid:
                                                            valueOrDefault<
                                                                String>(
                                                          ServiceabilityCall
                                                              .localityId(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          ),
                                                          '0',
                                                        ),
                                                        localityname:
                                                            valueOrDefault<
                                                                String>(
                                                          ServiceabilityCall
                                                              .name(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          ),
                                                          '0',
                                                        ),
                                                        localitynumber:
                                                            valueOrDefault<int>(
                                                          ServiceabilityCall
                                                              .localityNumber(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          ),
                                                          0,
                                                        ),
                                                        closestAddress:
                                                            ServiceabilityCall
                                                                .closestAddress(
                                                          containerServiceabilityResponse
                                                              .jsonBody,
                                                        )!,
                                                        address: valueOrDefault<
                                                            String>(
                                                          '${ServiceabilityCall.houseNumber(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          )}, ${ServiceabilityCall.buildingName(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          ).toString()}',
                                                          'Address',
                                                        ),
                                                        tag: valueOrDefault<
                                                            String>(
                                                          ServiceabilityCall
                                                              .addressTag(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          ),
                                                          'Home',
                                                        ),
                                                        addressId:
                                                            valueOrDefault<
                                                                String>(
                                                          ServiceabilityCall
                                                              .addressId(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          ),
                                                          '   AddressId',
                                                        ),
                                                        serviceabilitybool:
                                                            ServiceabilityCall
                                                                .serviceable(
                                                          containerServiceabilityResponse
                                                              .jsonBody,
                                                        )!,
                                                      ),
                                                    ),
                                                  ),
                                                  if (ServiceabilityCall
                                                          .serviceable(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      ) ??
                                                      true)
                                                    Expanded(
                                                      child: Container(
                                                        height: 450.0,
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxHeight: 600.0,
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        25.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .network(
                                                                          homeAppResourcesRecord!
                                                                              .pharmacyHome,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (loggedIn) {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: const SizedBox(
                                                                                      height: 320.0,
                                                                                      child: UploadPrescriptionsWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          } else {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: const SignInWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              106.0,
                                                                          height:
                                                                              88.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    'Order with \nPrescription',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.file_upload_outlined,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              homeAppResourcesRecord.whatsappOrder);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              106.0,
                                                                          height:
                                                                              88.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    'Order on\nWhatsApp',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.whatsapp,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Stack(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.7,
                                                                            0.74),
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                106.0,
                                                                            height:
                                                                                88.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      'Order by \nSymptoms',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: const Color(0xFFFFADC9),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  const Icon(
                                                                                    Icons.check_circle_outline_rounded,
                                                                                    color: Color(0xFFFFADC9),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/labelcomingsoon.png',
                                                                              width: 77.0,
                                                                              height: 21.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          20.0)),
                                                                ),
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                                desktop: false,
                                                              ))
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          32.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .homeFaqsModel,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            const HomeFaqsWidget(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (!ServiceabilityCall
                                                      .serviceable(
                                                    containerServiceabilityResponse
                                                        .jsonBody,
                                                  )!)
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .serviceAvailabilityModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const ServiceAvailabilityWidget(
                                                            speard: -10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            if (ServiceabilityCall.serviceable(
                                                  containerServiceabilityResponse
                                                      .jsonBody,
                                                ) ??
                                                true)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (loggedIn)
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: AirtableApiGroup
                                                          .arrowBarOrderCall
                                                          .call(
                                                        phoneNumber: functions
                                                            .getphoneNumber(
                                                                currentPhoneNumber),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const CommanShimmerWidget(
                                                            hieght: 68,
                                                            width: 400,
                                                            radiusTL: 16,
                                                            radiusTR: 16,
                                                            radiusBL: 0,
                                                            radiusBR: 0,
                                                          );
                                                        }
                                                        final containerArrowBarOrderResponse =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Visibility(
                                                            visible: AirtableApiGroup
                                                                    .arrowBarOrderCall
                                                                    .records(
                                                                      containerArrowBarOrderResponse
                                                                          .jsonBody,
                                                                    )!.isNotEmpty,
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .orderTrackingsModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  OrderTrackingsWidget(
                                                                jsonUrl:
                                                                    homeAppResourcesRecord!
                                                                        .defaultLottieAerobar,
                                                                records: AirtableApiGroup
                                                                    .arrowBarOrderCall
                                                                    .records(
                                                                  containerArrowBarOrderResponse
                                                                      .jsonBody,
                                                                )!,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<OrdersRecord>>(
                                stream: queryOrdersRecord(
                                  queryBuilder: (ordersRecord) => ordersRecord
                                      .where(
                                        'contact_id',
                                        arrayContains:
                                            getContactIdFirestoreData(
                                          ContactIdStruct(
                                            id: valueOrDefault(
                                                currentUserDocument
                                                    ?.userRecordId,
                                                ''),
                                          ),
                                          true,
                                        ),
                                      )
                                      .orderBy('ticket_id', descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const ShimmerHistoryWidget();
                                  }
                                  List<OrdersRecord>
                                      mainContainerOrdersRecordList =
                                      snapshot.data!;

                                  return SafeArea(
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      constraints: BoxConstraints(
                                        maxWidth: isWeb
                                            ? () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return FFAppState()
                                                      .width
                                                      .small
                                                      .toDouble();
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return FFAppState()
                                                      .width
                                                      .medium
                                                      .toDouble();
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return FFAppState()
                                                      .width
                                                      .large
                                                      .toDouble();
                                                } else {
                                                  return FFAppState()
                                                      .width
                                                      .small
                                                      .toDouble();
                                                }
                                              }()
                                            : FFAppState()
                                                .width
                                                .small
                                                .toDouble(),
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Order History',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 26.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 20.0)),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final historyVar =
                                                              mainContainerOrdersRecordList
                                                                  .toList();

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                historyVar
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                const SizedBox(
                                                                    height:
                                                                        10.0),
                                                            itemBuilder: (context,
                                                                historyVarIndex) {
                                                              final historyVarItem =
                                                                  historyVar[
                                                                      historyVarIndex];
                                                              return Visibility(
                                                                visible: (historyVarItem
                                                                            .orderSource !=
                                                                        'Search') ||
                                                                    ((historyVarItem.orderSource ==
                                                                            'Search') &&
                                                                        ((historyVarItem.status.name != 'New Order') ||
                                                                            (historyVarItem.status.name !=
                                                                                'Waiting for availability') ||
                                                                            (historyVarItem.status.name !=
                                                                                'Availability updated') ||
                                                                            (historyVarItem.status.name !=
                                                                                'Final order ready'))),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if ((historyVarItem.status.name == 'New Order') ||
                                                                        (historyVarItem.status.name ==
                                                                            'Waiting for availability') ||
                                                                        (historyVarItem.status.name ==
                                                                            'Availability updated')) {
                                                                      context
                                                                          .pushNamed(
                                                                        'Status',
                                                                        queryParameters:
                                                                            {
                                                                          'ticketid':
                                                                              serializeParam(
                                                                            historyVarItem.ticketId,
                                                                            ParamType.int,
                                                                          ),
                                                                          'pageName':
                                                                              serializeParam(
                                                                            'History',
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              const TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.bottomToTop,
                                                                          ),
                                                                        },
                                                                      );
                                                                    } else {
                                                                      if (historyVarItem
                                                                              .status
                                                                              .name ==
                                                                          'Final order ready') {
                                                                        context
                                                                            .pushNamed(
                                                                          'medicineCart',
                                                                          queryParameters:
                                                                              {
                                                                            'ticketId':
                                                                                serializeParam(
                                                                              historyVarItem.ticketId,
                                                                              ParamType.int,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      } else {
                                                                        context
                                                                            .pushNamed(
                                                                          'statusOfOrder',
                                                                          queryParameters:
                                                                              {
                                                                            'ticketid':
                                                                                serializeParam(
                                                                              historyVarItem.ticketId,
                                                                              ParamType.int,
                                                                            ),
                                                                            'pagename':
                                                                                serializeParam(
                                                                              'History',
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                const TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.topToBottom,
                                                                            ),
                                                                          },
                                                                        );
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              24.0,
                                                                          color:
                                                                              Color(0x34959DA5),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            8.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              0.0,
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 46.0,
                                                                                height: 45.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: const Color(0xFFEBFFEF),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: const Icon(
                                                                                  Icons.check,
                                                                                  color: Color(0xFF24963F),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            () {
                                                                                              if ((historyVarItem.status.name == 'New Order') || (historyVarItem.status.name == 'Waiting for availability') || (historyVarItem.status.name == 'Availability updated')) {
                                                                                                return 'Preparing Cart';
                                                                                              } else if (historyVarItem.status.name == 'Final order ready') {
                                                                                                return 'Awaiting payment';
                                                                                              } else if (historyVarItem.status.name == 'Order confirmed and customer paid') {
                                                                                                return 'Packing';
                                                                                              } else if (historyVarItem.status.name == 'Ready for pickup') {
                                                                                                return 'Awaiting pickup';
                                                                                              } else if (historyVarItem.status.name == 'Order picked up by Delivery Agent') {
                                                                                                return 'On the way';
                                                                                              } else if (historyVarItem.status.name == 'Order Delivered') {
                                                                                                return ' Delivered';
                                                                                              } else if (historyVarItem.status.name == 'Order Cancelled') {
                                                                                                return 'Cancelled';
                                                                                              } else {
                                                                                                return '    ';
                                                                                              }
                                                                                            }(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Figtree',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w800,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                                ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '₹${historyVarItem.billTotalAmount.toString()}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Figtree',
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Container(
                                                                                                  width: 6.0,
                                                                                                  height: 6.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: const Color(0xFFD9D9D9),
                                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat("d/M h:mm a", historyVarItem.orderCreatedTime!),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Figtree',
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Order#${historyVarItem.ticketId.toString()}',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].divide(const SizedBox(height: 4.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.arrow_forward,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        if ((historyVarItem.status.name != 'New Order') ||
                                                                            (historyVarItem.status.name !=
                                                                                'Waiting for availability') ||
                                                                            (historyVarItem.status.name !=
                                                                                'Availability updated'))
                                                                          const Divider(
                                                                            thickness:
                                                                                0.5,
                                                                            color:
                                                                                Color(0xFFEDEDED),
                                                                          ),
                                                                        FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future: AirtableApiGroup
                                                                              .getMedicineDetailsCall
                                                                              .call(
                                                                            orderTicketId:
                                                                                historyVarItem.ticketId,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return const ShimmerWidget();
                                                                            }
                                                                            final containerGetMedicineDetailsResponse =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              decoration: const BoxDecoration(),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final medicens = AirtableApiGroup.getMedicineDetailsCall
                                                                                          .recordList(
                                                                                            containerGetMedicineDetailsResponse.jsonBody,
                                                                                          )
                                                                                          ?.toList() ??
                                                                                      [];

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(medicens.length, (medicensIndex) {
                                                                                      final medicensItem = medicens[medicensIndex];
                                                                                      return Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 10.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              '${getJsonField(
                                                                                                medicensItem,
                                                                                                r'''$.fields.Quantity_Cart''',
                                                                                              ).toString()}X',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Figtree',
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                                  ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      medicensItem,
                                                                                                      r'''$.fields["Medicine Name"]''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Figtree',
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                if (getJsonField(
                                                                                                      medicensItem,
                                                                                                      r'''$.fields.Medicine_strip_size''',
                                                                                                    ) !=
                                                                                                    null)
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      getJsonField(
                                                                                                        medicensItem,
                                                                                                        r'''$.fields.Medicine_strip_size''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Figtree',
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        if (historyVarItem.status.name ==
                                                                            'Order Delivered')
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                0.5,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                          ),
                                                                        if (historyVarItem.status.name ==
                                                                            'Order Delivered')
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.43,
                                                                                  height: 47.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Reorder',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Figtree',
                                                                                            color: const Color(0xFF0C831F),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                SizedBox(
                                                                                  height: 47.0,
                                                                                  child: VerticalDivider(
                                                                                    thickness: 0.5,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                    child: wrapWithModel(
                                                                                      model: _model.retingComponentModels.getModel(
                                                                                        historyVarIndex.toString(),
                                                                                        historyVarIndex,
                                                                                      ),
                                                                                      updateCallback: () => safeSetState(() {}),
                                                                                      child: RetingComponentWidget(
                                                                                        key: Key(
                                                                                          'Keyj7c_${historyVarIndex.toString()}',
                                                                                        ),
                                                                                        ratings: historyVarItem.rating.round(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primary,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        unselectedLabelStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        indicatorColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        tabs: const [
                          Tab(
                            text: 'Home',
                            icon: Icon(
                              FFIcons.khome,
                              size: 20.0,
                            ),
                          ),
                          Tab(
                            text: 'History',
                            icon: FaIcon(
                              FontAwesomeIcons.shoppingBag,
                              size: 20.0,
                            ),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
