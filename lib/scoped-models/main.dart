import 'package:scoped_model/scoped_model.dart';
//with keyword , merge functionalities of wichever classes into this class

import './products.dart';
import './user.dart';
import 'connected_product.dart';

class MainModel extends Model with ConnectedProduct,UserModel,ProductsModel{

}