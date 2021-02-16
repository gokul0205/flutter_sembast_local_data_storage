import 'jsonStringMap.dart';

abstract class JsonStringMapRepository {

  Future<int> insertJsonStringMap(JsonStringMap jsonStringMap);

  Future updateJsonStringMap(JsonStringMap jsonStringMap);

  Future deleteJsonStringMap(int jsonStringMapId);

  Future<List<JsonStringMap>> getAllJsonStringMaps();
}