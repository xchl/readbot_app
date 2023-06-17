class ReadModeStyle {
  int? fontSize;

  static bool created = false;

  static late ReadModeStyle _instance;

  factory ReadModeStyle.fromConfig({fontSize}) {
    if (created) {
      return _instance;
    }
    _instance = ReadModeStyle._fromConfig(
      fontSize: fontSize,
    );
    created = true;
    return _instance;
  }

  factory ReadModeStyle() {
    if (created) {
      return _instance;
    }
    _instance = ReadModeStyle._default();
    created = true;
    return _instance;
  }

  ReadModeStyle._default() {
    fontSize = 16;
  }

  ReadModeStyle._fromConfig({this.fontSize});

  String get css => getCss();

  String getCss() {
    return '''
          body {
            // color: #333333;
            margin: 0;
            padding: 1em;
            background-color: #FFFEFEFE;
            line-height: 1.8;
          }

          h1,h2,h3,h4 {
            line-height: 1.5;
          }

          a {
            word-wrap: break-word;
            overflow-wrap: break-word;
          }

          p {
            margin: 0.8em 0;
            word-wrap: break-word;
            overflow-wrap: break-word;
          }

          i {
            font-style: italic;
          }

          b, strong {
            font-weight: bold;
          }

          pre {
            overflow: auto;
            white-space: pre;
            background-color: #f0f0f0;
            padding: 8px;
          }

          code {
            background-color: #f0f0f0;
            padding: 5px;
          }

          blockquote {
            margin: 1em 1em;
            padding: 1em 1em;
            border-left: 4px solid #cccccc;
            background-color: #f9f9f9;
            font-style: italic;
            color: #333333;
          }

          table {
            border-collapse: collapse;
            width: 100%;
          }

          th, td {
            border: 1px solid black;
            text-align: center;
            padding: 8px;
          }

          img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 1em 0;
          }
    ''';
  }
}
