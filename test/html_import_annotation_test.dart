// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@HtmlImport(importPath)
 // This one will throw a build time warning, but should still work dynamically.
@HtmlImport('bad_import.html')
library web_components.test.html_import_annotation;

import 'dart:html';
import 'package:initialize/initialize.dart' as init;
import 'package:unittest/html_config.dart';
import 'package:unittest/unittest.dart';
import 'package:web_components/html_import_annotation.dart';


const String importPath = 'my_import.html';

main() {
  useHtmlConfiguration();

  test('adds import to head', () {
    return init.run().then((_) {
      var good = document.head.querySelector('link[href="$importPath"]');
      expect(good.import.body.text, 'Hello world!\n');
      var bad = document.head.querySelector('link[href="bad_import.html"]');
      expect(bad.import, isNull);
    });
  });
}