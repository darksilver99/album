import 'dart:io';

import '/components/no_photo_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_quart_photo_page_model.dart';
export 'view_quart_photo_page_model.dart';

class ViewQuartPhotoPageWidget extends StatefulWidget {
  const ViewQuartPhotoPageWidget({super.key});

  @override
  State<ViewQuartPhotoPageWidget> createState() =>
      _ViewQuartPhotoPageWidgetState();
}

class _ViewQuartPhotoPageWidgetState extends State<ViewQuartPhotoPageWidget> {
  late ViewQuartPhotoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewQuartPhotoPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Builder(
              builder: (context) {
                final quartPhotoList = FFAppState().quartPhotoList.toList();
                if (quartPhotoList.isEmpty) {
                  return NoPhotoViewWidget();
                }
                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    16.0,
                    0,
                    16.0,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: quartPhotoList.length,
                  itemBuilder: (context, quartPhotoListIndex) {
                    final quartPhotoListItem =
                        quartPhotoList[quartPhotoListIndex];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        File(quartPhotoListItem),
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
