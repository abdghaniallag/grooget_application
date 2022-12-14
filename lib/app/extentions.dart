// extension on String
extension NonNullSrting on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

// extension on int
extension NonNullInteger on int? {
  int orEmpty() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

// extension on double
extension NonNulldouble on double? {
  double orEmpty() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}

// extension on bool
extension NonNullbool on bool? {
  bool orEmpty() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}
