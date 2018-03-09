import 'dart:math';
import 'dart:async';

typedef int Compare(Object a, Object b);
typedef int GenericCompare<T>(T a, T b);

class Todo {
  final String who;
  final String what;
  
  const Todo(this.who, this.what);
}

Future main() async {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
  
  var v = "hoge";
	print("v(1) ... ${v}");
  
  v = "huga";
  print("v(2) ... ${v}");
  
  const tv = "hogehoge";
  print("tv ... ${tv}");

  int x = 1;
  print("x ... ${x}");
  
  num n = 1.01;
  print("n ... ${n}");
  
  const lines = '''
  line1
  line2
  ''';
  print("${lines}");
  
  const lines2 = "line1\n"
    "line2"
    "line3";
  print("${lines2}");
  
  final list1 = [1, 2, 3];
  print("list1 ... ${list1}");
  
  var map1 = {
    1: "one",
    2: "two",
    3: "three"
  };
  print("map1 ... ${map1}, first: ${map1[1]}");
  map1[4] = 'four';
  print("fourth: ${map1[4]}");
  
  final map2 = const {
    "one": 1
  };
  
  enableFlags(bold: true, hidden: false);
  
  print("isNull: ${isNull('hoge')}, ${isNull(null)}");
  
  print(say("bob", "yeah!!"));
  print(say("bob", "yeah!!", "iPhone"));
  
  enableFlags2();
  
  doStuff();
  
  final ints1 = [1, 2, 3];
  ints1.forEach(printElement);
  
 	final loudify = (msg) => "!!! ${msg.toUpperCase()} !!!";
  print(loudify("yeeeee"));
  
  final fluts = ["apple", "orange", "banana"];
  fluts.forEach((flut) => print('${fluts.indexOf(flut)}: $flut'));
//   fluts.forEach((flut) {
//     print('${fluts.indexOf(flut)}: $flut');
//   });
  
  final add2 = makeAdder(2);
  print("adder2: ${add2(10)}, ${add2(20)}");
  
  String str1 = "hoge";
  String str2 = null;
  str2 ??= str1;
  print("str2...${str2?.toString()}");
  
  final sb = new StringBuffer()
    ..write("hoge")
    ..writeln("huga")
    ..write("piyo");
  print("sb...$sb");
  
  final ints2 = [1, 2, 3];
  for (var i in ints2) {
    print("$i");
  }
  ints2.where((i) => i % 2 == 0)
    .forEach((i) => print("i: $i"));
  
  try {
  	int.parse("hoge");
  } on FormatException catch(e, s) {
    print(e);
    print(s);	// print stacktrace
  } on Exception {
    print("error!");
    rethrow;
  } catch(e) {
    print(e);
  } finally {
    print("finaly!");
  }
  
  var point1 = new Point(2, 3);
  point1.x = 100;
  print("point: ${point1.x}, ${point1.y}, distanceFromOrigin=${point1.distanceFromOrigin}, distanceTo=${point1.distanceTo(new Point(3, 3))}");
  print("Pont.disntanceBetween:${Point.distanceBetween(point1, new Point(30, 30))}");
  
  var origin = new Point.origin();
  print("origin: ${origin.x}, ${origin.y}");
  
  var emp = new Employee.fromJson({'age': 30});
  if (emp is Person) {
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob';
	print("Employee's name=${emp.firstName}, age=${emp.age}");
  
  var immutableOrigin = ImmutablePoint.origin;
  print("origin: x=${immutableOrigin.x}, y=${immutableOrigin.y}");
  
  var logger1 = new Logger("hoge");
  logger1.log("test");
  var logger2 = new Logger("hoge");
  assert(logger1 == logger2);
  
  var rect1 = new Rectangle(left: 0, top: 0, height: 10, width: 20);
  print("left:${rect1.left}, top:${rect1.top}, height:${rect1.height}, width:${rect1.width}");
  print("right: ${rect1.right}, bottom:${rect1.bottom}");
  
  final Doer doer = new EffectiveDoer();
  doer.doSomething();
  
  final v1 = new Vector(1, 2);
  final v2 = new Vector(3, 4);
  final v3 = v1 + v2;
  
  print("v3=${v3.x}, ${v3.y}");
  
  print(greetBob(new Person2("Tom")));
  var impostor = new Impostor();
  print(greetBob(impostor));
//   impostor.sayHello();
  
  print("color: ${Color.red}, index=${Color.red.index}, colors:${Color.values}");
  
  var pages = <String>["hoge", "huga", "piyo"];
  print(pages);
  
  var pageSet = new Set<String>.from(pages);
  print(pageSet);
  
  final version = await lookupVersion();
  print("version: $version");
  
  final p = (i) => print("$i");
  naturalsTo(5).forEach(p);
  print("-----");
  naturalsDownFrom(5).forEach(p);
  print("-----");
  await for(var i in asynchronousNaturalsTo(5)) {
    print("$i");
  }
  print("-----");
  
  var wf = new WannableFunction();
  var wf_out = wf("hoge", "huga", "piyo");
  print(wf_out);
  
  int sort(Object a, Object b) => 0;
  final lsc = new LegacySortedCollection(sort);
  final sc = new SortedCollection(sort);
  assert(lsc.compare is Function);
  assert(sc.compare is Function);
  assert(sc.compare is Compare);
}

// ------------------------------------
// ------------------------------------
// ------------------------------------

void enableFlags({bool bold, bool hidden}) {
  print("take1. bold: ${bold}, hidden: ${hidden}");
}

void enableFlags2({bool bold = false, bool hidden = false}) {
  print("take2. bold: ${bold}, hidden: ${hidden}");
}

bool isNull(Object obj) => obj != null;

String say(String from, String msg, [String device = "iPhone"]) {
	var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;  
}

void doStuff({List<int> list = const [1, 2], Map<String, String> gifts = const { "first": "hoge", "second": "huga" }}){
  print('list:  $list');
  print('gifts: $gifts');
}

void printElement(int element) => print(element);

Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

class Point {
  
  static final Point origin2 = new Point(0, 0);
  
  num x;
  num y;
  num distanceFromOrigin;
  
  Point(this.x, this.y) 
    : distanceFromOrigin = sqrt(x * x + y * y);
  
  Point.origin() {
    x = 0;
    y = 0;
  }
  
  Point.alongXAxis(num x) : this(x, 0);
  
  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx*dx + dy*dy);
  }
  
  static num distanceBetween(Point lhs, Point rhs) {
    var dx = lhs.x - rhs.x;
    var dy = lhs.y - rhs.y;
    return sqrt(dx*dx + dy*dy);
  }
}

class ImmutablePoint {
  
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
  
  final num x, y;
  
  const ImmutablePoint(this.x, this.y);
}

class Person {
  String firstName;
  
  Person.fromJson(Map json) {
    print("in Person, json=${json}");
  }
}

class Employee extends Person {
  
  int age;
  
  Employee() : super.fromJson({});
  
  Employee.fromJson(Map json) 
    :  age = json["age"], super.fromJson(json) {
    print("in Employee, json=${json}");
  }
}

class Logger {
  final String name;
  bool mute = false;
  
  static final Map<String, Logger> _cache = {};
  
  Logger._internal(this.name);
  
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    }
		final logger = new Logger._internal(name);
    _cache[name] = logger;
    return logger;
  }
  
  void log(String log) {
    if (!mute) print("$name: $log");
  }
}

class Rectangle {
  num left, top, width, height;
  
  Rectangle({this.left, this.top, this.width, this.height});
  
  num get right => left + width;
  set right(num value) => left = right - width;
  
  num get bottom => top + height;
  set bottom(num value) => top = bottom - height;
}

abstract class Doer {
  
  void doSomething();
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {
    print("#doSomething()");
  }
}

class EffectiveDoer2 implements Doer {
  @override
  void doSomething() {
  }
}

class Vector {
  final int x, y;
  
  const Vector(this.x, this.y);
  
  Vector operator +(Vector other) {
    return new Vector(x + other.x, y + other.y);
  }
  
  Vector operator -(Vector other) {
    return new Vector(x - other.x, y - other.y);
  }
}

class Person2 {
  final String _name;
  
  Person2(this._name);
  
  String greet(String who) => 'Hello, $who. I am $_name.';
}

class Impostor implements Person2 {
  
  @override
  String get _name => "";

  @override
  String greet(String who) => 'Hi $who. Do you know who I am?';
  
	@override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }  
}

String greetBob(Person2 person) => person.greet('Bob');

enum Color {
  red, blue, green
}

Future<String> lookupVersion() async => "1.0.0";

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

class WannableFunction {
  
  call(String a, String b, String c) => "$a, $b, $c";
  
  @Todo('seth', 'make this do something')
  String hoge(int x) => "$x";
}

class LegacySortedCollection {
  
  final Function compare;
  
  LegacySortedCollection(int f(Object a, Object b))
  	: compare = f {
  }
}

class SortedCollection {
  
  final Compare compare;
  
  SortedCollection(this.compare);
}