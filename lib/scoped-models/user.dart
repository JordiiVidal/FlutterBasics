import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'connected_product.dart';


class UserModel extends ConnectedProduct{

  void login(String email, String password){
    authenticatedUser = new User(id: 'sasas', email: email, password: password);
  }

}