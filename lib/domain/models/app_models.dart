
import 'package:binding/binding.dart';

class SearchModel extends NotifyPropertyChanged {
  static const searchPropertyName = 'search';
  String _text = '';

  String get text => _text;
  void onChange(String text) {
    _text = text;

    propertyChanged(propertyName: searchPropertyName);
  }
}