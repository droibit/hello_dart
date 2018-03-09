import 'package:hello_dart/hello_dart.dart';
import 'package:hello_lib/hello_lib.dart';
import 'package:vector_math/vector_math.dart';


main() {
  var awesome = new Awesome();
  print('awesome: ${awesome.isAwesome}');

  var awesomeLib = new AwesomeLibrary();
  print('awesomeLibrary: ${awesomeLib.isAwesome}');
  var greatLib = new GreatLibrary(name: "Great", version: "1.0.0");
  print('$greatLib');

  final v2 = new Vector2(1.0, 2.0);
  print("v2: $v2");
}
