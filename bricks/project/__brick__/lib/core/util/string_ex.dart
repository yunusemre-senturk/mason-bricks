extension StringEx on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  bool isNull() {
    return this == null;
  }
}
