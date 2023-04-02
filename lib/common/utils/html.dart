String? matchImgSrcInHtml(String htmlContent) {
  // 正则表达式，匹配 <img> 标签的 src 属性
  RegExp imgRegExp = RegExp(r'<img[^>]+src="([^"]+)"', caseSensitive: false);

  // 使用 RegExp 的 allMatches() 方法匹配所有 <img> 标签的 src 属性
  RegExpMatch? match = imgRegExp.firstMatch(htmlContent);

  // 如果找到匹配项，则返回第一个捕获组（src 属性值），否则返回 null
  return match?.group(1);
}
