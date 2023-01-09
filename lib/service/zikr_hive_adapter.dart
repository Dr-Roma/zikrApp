import 'package:flutter_application_1/models/zikr.dart';
import 'package:hive/hive.dart';

class ZikrHiveAdapter extends TypeAdapter<Zikr> {
  @override
  final typeId = 0;

  @override //переопределяем функцию чтения нашего класса
  Zikr read(BinaryReader reader) {
    final int counter = reader.readInt();
    final String title = reader.readString();
    final DateTime dateTime = reader.read();

    return Zikr(dateTime: dateTime, counter: counter, title: title);
  }

  @override
  void write(BinaryWriter writer, Zikr obj) {
    writer.writeInt(obj.counter);
    writer.writeString(obj.title);
    writer.write(obj.dateTime);
  }
}
