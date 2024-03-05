import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_photo_view_model.dart';
export 'no_photo_view_model.dart';

class NoPhotoViewWidget extends StatefulWidget {
  const NoPhotoViewWidget({super.key});

  @override
  State<NoPhotoViewWidget> createState() => _NoPhotoViewWidgetState();
}

class _NoPhotoViewWidgetState extends State<NoPhotoViewWidget> {
  late NoPhotoViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoPhotoViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.insert_photo_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 42.0,
          ),
          Text(
            'No photo',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
        ],
      ),
    );
  }
}
