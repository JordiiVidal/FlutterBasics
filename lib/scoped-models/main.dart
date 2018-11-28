import 'package:scoped_model/scoped_model.dart';
//with keyword , merge functionalities of wichever classes into this class

import 'connected_product.dart';

class MainModel extends Model with ConnectedProductModel,UserModel,ProductsModel{

}