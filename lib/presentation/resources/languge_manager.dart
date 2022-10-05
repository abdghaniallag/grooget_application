enum LanguageType { ENGLISH, ARABIC, TURKY }

const String ENGLISH = "en";
const String ARABIC = "ar";
const String TURKY = "tr";

extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.TURKY:
        return TURKY;
    }
  }
}
