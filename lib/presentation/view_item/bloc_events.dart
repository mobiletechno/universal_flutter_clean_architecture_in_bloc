import 'package:flutter_univarsal_architecture/data/model/api_data_model.dart';

sealed class ItemState{

}
class ListenState extends ItemState{
   int count;
   ListenState(this.count);
}
