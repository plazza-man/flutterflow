import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'eligibility_questions2_model.dart';
export 'eligibility_questions2_model.dart';

class EligibilityQuestions2Widget extends StatefulWidget {
  const EligibilityQuestions2Widget({super.key});

  @override
  State<EligibilityQuestions2Widget> createState() =>
      _EligibilityQuestions2WidgetState();
}

class _EligibilityQuestions2WidgetState
    extends State<EligibilityQuestions2Widget> {
  late EligibilityQuestions2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EligibilityQuestions2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'EligibilityQuestions2',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).backArrowColor,
                          size: 24.0,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Property_1=Black_Default_(1).png',
                          width: 78.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: const Color(0xFFFF0083),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Color(0xFFFF0083),
                                    size: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      'How tall are you?*',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .backArrowColor,
                                            fontSize: 36.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: Text(
                                          'round it up, always',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Figtree',
                                                color: const Color(0xFF4A4A4A),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(null),
                                      options: const [
                                        'Less than 4ft',
                                        '4ft 0 inches',
                                        '4ft 2 inches',
                                        '4ft 2 inches',
                                        '4ft 4 inches',
                                        '4ft 6 inches',
                                        '4ft 8 inches',
                                        '5ft 0 inches',
                                        '5ft 2 inches',
                                        '5ft 4 inches',
                                        '5ft 6 inches',
                                        '5ft 8 inches',
                                        '5ft 10 inches',
                                        '6ft 0 inches',
                                        '6ft 2 inches',
                                        '6ft 4 inches',
                                        '6ft 6 inches',
                                        '6ft 8 inches',
                                        '6ft 10 inches',
                                        '7ft or taller(What\'s the weather like up there?)'
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.dropDownValue = val),
                                      width: 350.0,
                                      height: 60.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Figtree',
                                            color: FlutterFlowTheme.of(context)
                                                .bottomNavbarIconcolor,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Select an option',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .bottomNavbarIconcolor,
                                        size: 30.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 0.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 0.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 4.0),
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 46.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.output = true;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        safeSetState(() => _model.output = false);
                        return;
                      }
                      if (_model.dropDownValue == null) {
                        _model.output = false;
                        safeSetState(() {});
                        return;
                      }

                      await currentUserReference!.update(createUsersRecordData(
                        height: _model.dropDownValue,
                      ));
                      if (valueOrDefault(currentUserDocument?.weight, '') !=
                              '') {
                        if (valueOrDefault(currentUserDocument?.smoke, '') !=
                                '') {
                          if (valueOrDefault(
                                      currentUserDocument?.insulin, '') !=
                                  '') {
                            if (valueOrDefault(
                                        currentUserDocument
                                            ?.medicationRegularly,
                                        '') !=
                                    '') {
                              if (valueOrDefault(
                                          currentUserDocument
                                              ?.spouseCurrentYpreganant,
                                          '') !=
                                      '') {
                                if (valueOrDefault(
                                            currentUserDocument?.childAgedUp3,
                                            '') !=
                                        '') {
                                  if (valueOrDefault(
                                              currentUserDocument?.monthlySpend,
                                              '') !=
                                          '') {
                                    context.pushNamed('cartPage');
                                  } else {
                                    context.pushNamed('EligibilityQuestion9');
                                  }
                                } else {
                                  context.pushNamed('EligibilityQuestion8');
                                }
                              } else {
                                context.pushNamed('EligibilityQuestion7');
                              }
                            } else {
                              context.pushNamed('EligibilityQuestion6');
                            }
                          } else {
                            context.pushNamed('EligibilityQuestions5');
                          }
                        } else {
                          context.pushNamed('EligibilityQuestions4');
                        }
                      } else {
                        context.pushNamed('EligibilityQuestions3');
                      }

                      safeSetState(() {});
                    },
                    text: 'Next',
                    options: FFButtonOptions(
                      width: 390.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).plazzaNewPrimaryPink,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Figtree',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
