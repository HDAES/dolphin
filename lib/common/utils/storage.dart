import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  // 工厂方法构造函数
  factory StorageUtil() => _getInstance();
  // 静态变量_instance，存储唯一对象
  static StorageUtil _instance;

  static SharedPreferences _prefs;
  // 私有的命名式构造方法，通过它可以实现一个类可以有多个构造函数，
  // 子类不能继承internal不是关键字，可定义其他名字
  StorageUtil._internal();
  // 获取对象
  static  StorageUtil _getInstance(){
    if(_instance == null){
      _instance = new StorageUtil._internal();
    }
    return _instance;
  }

  //初始化
  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs.setBool(key, val);
  }

  bool getBool(String key) {
    bool val = _prefs.getBool(key);
    return val == null ? false : val;
  }

  Future<bool> setInt(String key,int intval){
    return _prefs.setInt(key, intval);
  }

  int getInt(String key){
    return _prefs.getInt(key);
  }
  
  Future<bool> setStringList(String key,List<Map> list){
    List<String> _stringList = [];
    list.forEach((element) { 
      _stringList.add(jsonEncode(element).toString());
    });
    return _prefs.setStringList(key, _stringList);
  }

  List<Map> getStringList(String key){
    List<Map> _mapList = [];
    List<String> _stringList = _prefs.getStringList(key);
    if(_stringList!=null&&_stringList.length>0){
      _stringList.forEach((element) {
         Map item =  json.decode(element);
        _mapList.add(item);
      });
    }
    return _mapList;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}