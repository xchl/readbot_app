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

  String getCssOld() {
    return '''
          body {
            line-height: 1.8;
            font-size: 30px;
            color: #333333;
            margin: 0;
            padding: 2em;
            background-color: #FFFEFEFE;
          }

          h1, h2, h3, h4, h5, h6 {
            font-weight: bold;
            margin: 1em 0;
          }

          h1 {
            font-size: 2em;
          }

          h2 {
            font-size: 1.8em;
          }

          h3 {
            font-size: 1.6em;
          }

          h4 {
            font-size: 1.4em;
          }

          h5 {
            font-size: 1.2em;
          }

          h6 {
            font-size: 1em;
          }

          a {
            word-wrap: break-word;
            overflow-wrap: break-word;
          }

          p {
            font-size: 1.2em;
            margin: 0.8em 0;
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
          }

          code {
            display: block;
          }

          blockquote {
            margin: 1.5em 2em;
            padding: 0.5em 1em;
            border-left: 4px solid #cccccc;
            background-color: #f9f9f9;
            font-style: italic;
            line-height: 1.5;
            font-size: 1.1em;
            color: #333333;
          }

          img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 1em 0;
          }
    ''';
  }

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
          }

          code {
            display: block;
          }

          blockquote {
            margin: 1em 1em;
            padding: 1em 1em;
            border-left: 4px solid #cccccc;
            background-color: #f9f9f9;
            font-style: italic;
            color: #333333;
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
