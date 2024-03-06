import '/backend/schema/structs/index.dart';
import '/components/no_photo_view_widget.dart';
import '/components/remove_background_view_widget.dart';
import '/components/select_quart_album_view_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'quart_photo_page_model.dart';
export 'quart_photo_page_model.dart';

class QuartPhotoPageWidget extends StatefulWidget {
  const QuartPhotoPageWidget({super.key});

  @override
  State<QuartPhotoPageWidget> createState() => _QuartPhotoPageWidgetState();
}

class _QuartPhotoPageWidgetState extends State<QuartPhotoPageWidget> {
  late QuartPhotoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuartPhotoPageModel());
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Confirm ?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Confirm'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              setState(() {
                _model.isLoading = true;
              });
              _model.rsPath = await actions.mergePhoto(
                null!,
              );
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: RemoveBackgroundViewWidget(
                        photoPath: _model.rsPath!,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() => _model.rsPath2 = value));

              if (_model.rsPath2 != null && _model.rsPath2 != '') {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SelectQuartAlbumViewWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() => _model.rsFolder = value));

                if (_model.rsFolder != null && _model.rsFolder != '') {
                  FFAppState().addToQuartPhotoList(QuartPhotoStruct(
                    photo: _model.rsPath2,
                    folderName: _model.rsFolder,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Photo is combinationed success!',
                        style: TextStyle(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                }
                setState(() {
                  _model.isLoading = false;
                });
              }
            }

            setState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).error,
          elevation: 8.0,
          child: Icon(
            Icons.save_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 32.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final photoList1 =
                                          FFAppState().album1.toList();
                                      if (photoList1.isEmpty) {
                                        return NoPhotoViewWidget();
                                      }
                                      return FlutterFlowSwipeableStack(
                                        onSwipeFn: (index) {},
                                        onLeftSwipe: (index) {},
                                        onRightSwipe: (index) {},
                                        onUpSwipe: (index) {},
                                        onDownSwipe: (index) {},
                                        itemBuilder:
                                            (context, photoList1Index) {
                                          final photoList1Item =
                                              photoList1[photoList1Index];
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              photoList1Item,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                        itemCount: photoList1.length,
                                        controller:
                                            _model.swipeableStackController1,
                                        loop: true,
                                        cardDisplayCount: 3,
                                        scale: 0.9,
                                        cardPadding: EdgeInsets.all(0.0),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Builder(
                                        builder: (context) {
                                          final photoList2 =
                                              FFAppState().album2.toList();
                                          if (photoList2.isEmpty) {
                                            return NoPhotoViewWidget();
                                          }
                                          return FlutterFlowSwipeableStack(
                                            onSwipeFn: (index) {},
                                            onLeftSwipe: (index) {},
                                            onRightSwipe: (index) {},
                                            onUpSwipe: (index) {},
                                            onDownSwipe: (index) {},
                                            itemBuilder:
                                                (context, photoList2Index) {
                                              final photoList2Item =
                                                  photoList2[photoList2Index];
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  'https://picsum.photos/seed/46/600',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                            itemCount: photoList2.length,
                                            controller: _model
                                                .swipeableStackController2,
                                            loop: true,
                                            cardDisplayCount: 3,
                                            scale: 0.9,
                                            cardPadding: EdgeInsets.all(0.0),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final photoList3 =
                                          FFAppState().album3.toList();
                                      if (photoList3.isEmpty) {
                                        return NoPhotoViewWidget();
                                      }
                                      return FlutterFlowSwipeableStack(
                                        onSwipeFn: (index) {},
                                        onLeftSwipe: (index) {},
                                        onRightSwipe: (index) {},
                                        onUpSwipe: (index) {},
                                        onDownSwipe: (index) {},
                                        itemBuilder:
                                            (context, photoList3Index) {
                                          final photoList3Item =
                                              photoList3[photoList3Index];
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              'https://picsum.photos/seed/46/600',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                        itemCount: photoList3.length,
                                        controller:
                                            _model.swipeableStackController3,
                                        loop: true,
                                        cardDisplayCount: 3,
                                        scale: 0.9,
                                        cardPadding: EdgeInsets.all(0.0),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final photoList4 =
                                          FFAppState().album4.toList();
                                      if (photoList4.isEmpty) {
                                        return NoPhotoViewWidget();
                                      }
                                      return FlutterFlowSwipeableStack(
                                        onSwipeFn: (index) {},
                                        onLeftSwipe: (index) {},
                                        onRightSwipe: (index) {},
                                        onUpSwipe: (index) {},
                                        onDownSwipe: (index) {},
                                        itemBuilder:
                                            (context, photoList4Index) {
                                          final photoList4Item =
                                              photoList4[photoList4Index];
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              'https://picsum.photos/seed/46/600',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                        itemCount: photoList4.length,
                                        controller:
                                            _model.swipeableStackController4,
                                        loop: true,
                                        cardDisplayCount: 3,
                                        scale: 0.9,
                                        cardPadding: EdgeInsets.all(0.0),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_model.isLoading)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x5C000000),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie_animations/Animation_-_1709624548266.json',
                          width: 150.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
