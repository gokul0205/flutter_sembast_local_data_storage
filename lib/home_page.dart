import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast_tutorial/jsonStringMap.dart';
import 'package:sembast_tutorial/jsonStringMap_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  JsonStringMapRepository _jsonStringMapRepository = GetIt.I.get();
  List<JsonStringMap> _jsonStringMaps = [];

  @override
  void initState() {
    super.initState();
    _loadJsonStringMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite JsonStringMaps"),
      ),
      body: ListView.builder(
        itemCount: _jsonStringMaps.length,
        itemBuilder: (context, index) {
          final jsonStringMap = _jsonStringMaps[index];
          return ListTile(
            title: Text(jsonStringMap.uniqueIdentifier),
            subtitle: Text("JsonString: ${jsonStringMap.jsonString}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteJsonStringMap(jsonStringMap),
            ),
            leading: IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => _editJsonStringMap(jsonStringMap),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addJsonStringMap,
      ),
    );
  }

  _loadJsonStringMaps() async {
    final jsonStringMaps = await _jsonStringMapRepository.getAllJsonStringMaps();
    setState(() => _jsonStringMaps = jsonStringMaps);
  }

  _addJsonStringMap() async {
    final uniqueIdentifier = "Aadhar number supposed to be displayed over here!";
    final jsonString = "";
    final newJsonStringMap = JsonStringMap(uniqueIdentifier: uniqueIdentifier, jsonString: jsonString);
    await _jsonStringMapRepository.insertJsonStringMap(newJsonStringMap);
    _loadJsonStringMaps();
  }

  _deleteJsonStringMap(JsonStringMap jsonStringMap) async {
    await _jsonStringMapRepository.deleteJsonStringMap(jsonStringMap.id);
    _loadJsonStringMaps();
  }

  _editJsonStringMap(JsonStringMap jsonStringMap) async {
    final updatedJsonStringMap = jsonStringMap.copyWith(jsonString: jsonStringMap.jsonString+"!");
    await _jsonStringMapRepository.updateJsonStringMap(updatedJsonStringMap);
    _loadJsonStringMaps();
  }
}
