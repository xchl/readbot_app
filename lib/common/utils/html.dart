import 'package:html/dom.dart';
import 'package:html/parser.dart';

String? findCoverImageInHtml(String htmlContent) {
  try {
    Document document = parse(htmlContent);
    List<Element> imgElements = document.getElementsByTagName('img');
    return imgElements.isNotEmpty ? imgElements.first.attributes['src'] : null;
  } catch (e) {
    return null;
  }
}

String injectCss(String htmlContent, String css) {
  Document document = parse(htmlContent);
  Element? style = document.querySelector('style');
  if (style != null) style.remove();
  Element head = document.querySelector('head')!;
  Element styleElement = Element.tag('style');
  styleElement.attributes['type'] = 'text/css';
  styleElement.innerHtml = css;
  head.append(styleElement);
  return document.outerHtml;
}

String? extractHtmlText(String htmlContent) {
  try {
    Document document = parse(htmlContent);
    return document.body?.text;
  } catch (e) {
    return null;
  }
}
