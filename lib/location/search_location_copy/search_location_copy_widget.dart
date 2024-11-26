import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmer/location_search_shimmer/location_search_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_location_copy_model.dart';
export 'search_location_copy_model.dart';

class SearchLocationCopyWidget extends StatefulWidget {
  const SearchLocationCopyWidget({
    super.key,
    this.recordId,
    required this.pagename,
    required this.addLocation,
    this.addressId,
    this.tag,
  });

  final String? recordId;
  final String? pagename;
  final String? addLocation;
  final String? addressId;
  final String? tag;

  @override
  State<SearchLocationCopyWidget> createState() =>
      _SearchLocationCopyWidgetState();
}

class _SearchLocationCopyWidgetState extends State<SearchLocationCopyWidget> {
  late SearchLocationCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchLocationCopyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Title(
        title: 'SearchLocationCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isWeb
                        ? () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return FFAppState().width.small.toDouble();
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return FFAppState().width.medium.toDouble();
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return FFAppState().width.large.toDouble();
                            } else {
                              return FFAppState().width.small.toDouble();
                            }
                          }()
                        : FFAppState().width.small.toDouble(),
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/Icon_chevron-left.svg',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'Enter your location',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleLargeFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 20.0)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    _model.apiResultn68 =
                                        await GoogleMapSearchCall.call(
                                      input: _model.textController.text,
                                    );

                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.5,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintText: 'Search for your area or apartment',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.5,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                  prefixIcon: const Icon(
                                    FFIcons.ksearch1,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily),
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        if (_model.currentLoc)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: const LatLng(0.0, 0.0));
                                  _model.locations =
                                      await actions.locationPermissionDenied();
                                  if (_model.locations!) {
                                    context.pushNamed(
                                      'changeLocation',
                                      queryParameters: {
                                        'lat': serializeParam(
                                          functions.getLet(
                                              currentUserLocationValue!),
                                          ParamType.String,
                                        ),
                                        'lng': serializeParam(
                                          functions.getLng(
                                              currentUserLocationValue!),
                                          ParamType.String,
                                        ),
                                        'orderRecordId': serializeParam(
                                          widget.recordId,
                                          ParamType.String,
                                        ),
                                        'pagename': serializeParam(
                                          widget.pagename,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed('Location');
                                  }

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/navigation.png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'Use my current location',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                    Icon(
                                      Icons.chevron_right_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          ),
                        if (_model.currentLoc)
                          const Divider(
                            thickness: 1.0,
                            color: Color(0xFFF0F0F0),
                          ),
                        Container(
                          height: 350.0,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.textController.text != '')
                                FutureBuilder<ApiCallResponse>(
                                  future: GoogleMapSearchCall.call(
                                    input: _model.textController.text,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const LocationSearchShimmerWidget();
                                    }
                                    final listViewGoogleMapSearchResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final location =
                                            AddresslistStruct.maybeFromMap(
                                                        listViewGoogleMapSearchResponse
                                                            .jsonBody)
                                                    ?.predictions
                                                    .toList() ??
                                                [];

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: location.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, locationIndex) {
                                            final locationItem =
                                                location[locationIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.getLatlng =
                                                    await FindlatlngByPlaceIdCall
                                                        .call(
                                                  placeid: locationItem.placeId,
                                                );

                                                if ((_model
                                                        .getLatlng?.succeeded ??
                                                    true)) {
                                                  if (widget.addLocation !=
                                                      'Edit') {
                                                    FFAppState().address =
                                                        AppAddressStruct(
                                                      lat:
                                                          FindlatlngByPlaceIdCall
                                                              .lat(
                                                        (_model.getLatlng
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toString(),
                                                      lng:
                                                          FindlatlngByPlaceIdCall
                                                              .lng(
                                                        (_model.getLatlng
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toString(),
                                                    );
                                                    safeSetState(() {});

                                                    context.pushNamed('Home');
                                                  } else {
                                                    context.pushNamed(
                                                      'changeLocation',
                                                      queryParameters: {
                                                        'lat': serializeParam(
                                                          FindlatlngByPlaceIdCall
                                                              .lat(
                                                            (_model.getLatlng
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toString(),
                                                          ParamType.String,
                                                        ),
                                                        'lng': serializeParam(
                                                          FindlatlngByPlaceIdCall
                                                              .lng(
                                                            (_model.getLatlng
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toString(),
                                                          ParamType.String,
                                                        ),
                                                        'orderRecordId':
                                                            serializeParam(
                                                          widget.recordId,
                                                          ParamType.String,
                                                        ),
                                                        'pagename':
                                                            serializeParam(
                                                          widget.pagename,
                                                          ParamType.String,
                                                        ),
                                                        'addressId':
                                                            serializeParam(
                                                          widget.addressId,
                                                          ParamType.String,
                                                        ),
                                                        'tag': serializeParam(
                                                          widget.tag,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Something want wrong please try again',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: const BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/navigation.png',
                                                        width: 20.0,
                                                        height: 20.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                locationItem
                                                                    .structuredFormatting
                                                                    .mainText,
                                                                'Not Found',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                locationItem
                                                                    .structuredFormatting
                                                                    .secondaryText,
                                                                'Not Found',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
