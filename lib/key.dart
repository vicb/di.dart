part of di;

class Key {
  final Type _type;
  final Iterable<Type> _annotations;
  int _hashCode;

  Key(this._type, {Iterable<Type> annotations})
      : _annotations = annotations == null ? const [] : annotations;

  Type get type => _type;

  int get hashCode {
    if (_hashCode == null) {
      _hashCode = 629 + _type.hashCode;
      _annotations.forEach((a) => _hashCode += a.hashCode);
    }
    return _hashCode;
  }

  bool operator==(other) {
    return other is Key &&
        other._type == _type &&
        other._annotations.length == _annotations.length &&
        other._annotations.every(_annotations.contains);
  }

  String toString() {
    String asString = _type.toString();
    return _annotations.isEmpty
        ? asString
        : asString + ' annotated with: [${_annotations.join(", ")}]';
  }
}