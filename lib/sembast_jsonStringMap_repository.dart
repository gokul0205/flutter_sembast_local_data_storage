import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_tutorial/jsonStringMap.dart';
import 'package:sembast_tutorial/jsonStringMap_repository.dart';

class SembastJsonStringMapRepository extends JsonStringMapRepository {
  final Database _database = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("jsonStringMap_store");

  @override
  Future<int> insertJsonStringMap(JsonStringMap jsonStringMap) async {
    return await _store.add(_database, jsonStringMap.toMap());
  }

  @override
  Future updateJsonStringMap(JsonStringMap jsonStringMap) async {
    await _store.record(jsonStringMap.id).update(_database, jsonStringMap.toMap());
  }

  @override
  Future deleteJsonStringMap(int jsonStringMapId) async{
    await _store.record(jsonStringMapId).delete(_database);
  }

  @override
  Future<List<JsonStringMap>> getAllJsonStringMaps() async {
    final snapshots = await _store.find(_database);
    return snapshots
        .map((snapshot) => JsonStringMap.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }
}
