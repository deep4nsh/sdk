// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// Dart test program for testing the --enable-ffi=false flag.
//
// VMOptions=--enable-ffi=false

import 'dart:io';
import 'dart:isolate';

import 'package:expect/expect.dart';

void main() async {
  final uri = Platform.script.resolve('vmspecific_enable_ffi_test_helper.dart');
  try {
    await Isolate.spawnUri(uri, [], null);
    Expect.fail("Should have failed to spawn isolate importing dart:ffi");
  } catch (e) {
    Expect.type<IsolateSpawnException>(e);
    Expect.contains("import of dart:ffi is not supported", e.toString());
  }
}
