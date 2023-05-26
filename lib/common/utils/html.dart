import 'package:html/dom.dart';
import 'package:html/parser.dart';

String? findCoverImageInHtml(String htmlContent) {
  try {
    Document document = parse(htmlContent);
    List<Element> imgElements = document.getElementsByTagName('img');
    // take the img that has a http/https src and has a (png, jpg, jpeg) extension
    imgElements = imgElements.where((element) {
      String? src = element.attributes['src'];
      return src != null &&
          (src.startsWith('http') || src.startsWith('https')) &&
          (src.endsWith('.png') ||
              src.endsWith('.jpg') ||
              src.endsWith('.jpeg') ||
              src.endsWith('.webp'));
    }).toList();
    // take the first img
    return imgElements.isNotEmpty ? imgElements.first.attributes['src'] : null;
  } catch (e) {
    return null;
  }
}

class HtmlContent {
  String html;
  String css;
  HtmlContent(this.html, this.css);
}

String injectCss(HtmlContent html) {
  Document document = parse(html.html);
  Element? style = document.querySelector('style');
  if (style != null) style.remove();
  Element head = document.querySelector('head')!;
  Element styleElement = Element.tag('style');
  styleElement.attributes['type'] = 'text/css';
  styleElement.innerHtml = html.css;
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
