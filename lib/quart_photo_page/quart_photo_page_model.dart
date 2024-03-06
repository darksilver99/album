import '/backend/schema/structs/index.dart';
import '/components/no_photo_view_widget.dart';
import '/components/remove_background_view_widget.dart';
import '/components/select_quart_album_view_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'quart_photo_page_widget.dart' show QuartPhotoPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class QuartPhotoPageModel extends FlutterFlowModel<QuartPhotoPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController1;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController2;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController3;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController4;
  // Stores action output result for [Custom Action - mergePhoto] action in FloatingActionButton widget.
  String? rsPath;
  // Stores action output result for [Bottom Sheet - RemoveBackgroundView] action in FloatingActionButton widget.
  String? rsPath2;
  // Stores action output result for [Bottom Sheet - SelectQuartAlbumView] action in FloatingActionButton widget.
  String? rsFolder;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swipeableStackController1 = CardSwiperController();
    swipeableStackController2 = CardSwiperController();
    swipeableStackController3 = CardSwiperController();
    swipeableStackController4 = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
