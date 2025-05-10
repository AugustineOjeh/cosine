import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void dismissible(BuildContext context,
          {required Widget child,
          double initialChildSize = 0.5,
          double maxHeight = 0.8}) =>
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isDismissible: true,
          isScrollControlled: true,
          enableDrag: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: initialChildSize,
              maxChildSize: maxHeight,
              minChildSize: initialChildSize,
              builder: (context, scrollController) => GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  behavior: HitTestBehavior.opaque,
                  child: SingleChildScrollView(
                      controller: scrollController, child: child))));
}
