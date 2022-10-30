import '../flutter_assets/flutter_assets_icon_button.dart';
import '../flutter_assets/flutter_assets_theme.dart';
import '../flutter_assets/flutter_assets_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vaccine_ui/signin.dart';
import 'package:vaccine_ui/add_student.dart';
import 'package:vaccine_ui/add_vac_drive.dart';
import 'package:vaccine_ui/get_all_student.dart';

class HomePageWidget extends StatefulWidget {
  String coordinator_email;
  HomePageWidget({required this.coordinator_email});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print(widget.coordinator_email);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              print('BACK IconButton pressed ...');
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Signin()));
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            'Back',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      'Dashboard',
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 22,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
                            child: CircularPercentIndicator(
                              percent: 10 / 12,
                              radius: 60,
                              lineWidth: 24,
                              animation: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              backgroundColor: Color(0xFFF1F4F8),
                              center: Text(
                                '10',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'No. of Vaccinated',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          )),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 10, 10, 0),
                            child: CircularPercentIndicator(
                              percent: 2 / 12,
                              radius: 60,
                              lineWidth: 24,
                              animation: true,
                              progressColor: Color(0xFFEB0B0B),
                              //FlutterFlowTheme.of(context).primaryColor,
                              backgroundColor: Color(0xFFF1F4F8),
                              center: Text(
                                '2',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'NOT Vaccinated',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEB0B0B),
                                    ),
                          )),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  FFButtonWidget(
                    onPressed: () {
                      print('Add Student Button pressed ...');
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => AddStudent(
                                    coordinator_email: widget.coordinator_email,
                                  )));
                    },
                    text: 'Add Student',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      //borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Spacer(),
                  FFButtonWidget(
                    onPressed: () {
                      print('Update Vac status Button pressed ...');
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => AddStudent(
                                    coordinator_email: widget.coordinator_email,
                                  )));
                    },
                    text: 'Update Vaccine status',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      //borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Get Vaccination status Button pressed ...');
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => JsonParseDemo()));
                      },
                      text: 'Get Vaccination status',
                      options: FFButtonOptions(
                        width: 300,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        //borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  Spacer(),
                  FFButtonWidget(
                    onPressed: () {
                      print('Add a new Vaccine Drive Button pressed ...');
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => AddVacDrive()));
                    },
                    text: 'Add a new Vaccine Drive',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      //borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Spacer(),
                  FFButtonWidget(
                    onPressed: () {
                      print('Get all Vaccine Drives Button pressed ...');
                    },
                    text: 'Get all Vaccine Drives',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      //borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
