import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'quart_photo_page_widget.dart' show QuartPhotoPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuartPhotoPageModel extends FlutterFlowModel<QuartPhotoPageWidget> {
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
