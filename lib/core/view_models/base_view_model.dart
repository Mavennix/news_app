import 'package:flutter/foundation.dart';
import 'package:news_app/core/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  
  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }
  ViewState get state => _state;

}