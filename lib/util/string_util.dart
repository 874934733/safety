import 'package:flutter/cupertino.dart';

class StringUtil {
  static bool isEmpty(String? string) {
    return ["", null].contains(string);
  }

  static String interpolate(String string, List<String> params) {
    String result = string;
    for (int i = 1; i < params.length + 1; i++) {
      result = result.replaceAll('%$i', params[i - 1]);
    }
    return result;
  }

  static double getTextWidthByTextAndStyle(
      BuildContext context, String text, TextStyle style) {
    final span = TextSpan(text: text, style: style);

    const constraints = BoxConstraints(
      maxWidth: double.infinity,
    );

    final richTextWidget = Text.rich(span).build(context) as RichText;
    final renderObject = richTextWidget.createRenderObject(context);
    renderObject.layout(constraints);

    final boxes = renderObject.getBoxesForSelection(TextSelection(
        baseOffset: 0,
        extentOffset: TextSpan(text: text).toPlainText().length));

    return boxes.last.right;
  }
}
