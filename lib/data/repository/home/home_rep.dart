import 'package:credit_hub_app/data/model/home/data/data.dart';


abstract class DataRepository {
  Future<Data> fetchHomeInfo();
}
