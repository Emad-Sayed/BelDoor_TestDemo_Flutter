import 'package:flutter/cupertino.dart';
import 'package:beldoor/common/httpManager.dart';
import 'package:http/http.dart';
class LoginModel extends ChangeNotifier {
  String errorMessage = "Invalid Username Or Password";
  bool inValid = false;
  bool isLoading = false;

  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  setErrorMessage(val) {
    inValid = val;
    notifyListeners();
  }

  login(formData) async {
    setLoading(true);
    Response response = await HttpManager.postRequest('auth', formData);
    setLoading(false);
    return response;
  }
}
