extension ScopeFunctionsForObject<T extends Object> on T {
  R let<R>(R Function(T it) o) {
    return o(this);
  }

  T also(void Function(T it) o) {
    o(this);
    return this;
  }
}

extension NullableExtension<T> on T {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    }

    if (this is String) {
      return (this as String).isEmpty;
    }

    if (this is List) {
      return (this as List).isEmpty;
    }

    if (this is Map) {
      return (this as Map).isEmpty;
    }

    return false;
  }
}
