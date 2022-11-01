enum CurrencyType { DZDINAR, EURO, USDOLLAR, LIRATURKY }

const String DZDINAR = "DZD";
const String EURO = "EUR";
const String USDOLLAR = "USD";
const String LIRATURKY = "TRY";

extension CurrencyTypeExtention on CurrencyType {
  String getValue() {
    switch (this) {
      case CurrencyType.DZDINAR:
        return DZDINAR;
      case CurrencyType.EURO:
        return EURO;
      case CurrencyType.USDOLLAR:
        return USDOLLAR;
      case CurrencyType.LIRATURKY:
        return LIRATURKY;
    }
  }
}
