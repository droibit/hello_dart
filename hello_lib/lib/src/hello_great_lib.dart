
class GreatLibrary {

  final String name;

  final String version;

  final String _hash = "XXXXX";

  GreatLibrary({this.name, this.version});

  @override
  String toString() {
    return 'GreatLibrary{name: $name, version: $version, hash: $_hash}';
  }
}