// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ru = {
    "activity": "Активность",
    "saved": "Сохранено",
    "dhikr": "Зикр",
    "saveDhikr": "Сохранить зикр",
    "pleaseEnterAtTitleDhikr": "Пожалуйста, введите название Зикра",
    "cancel": "Отменить",
    "save": "Сохранить",
    "language": "Язык",
    "vibration": "Вибрация",
    "sound": "Звук",
    "countAsVolumeKeys": "Считать как клавиши громкости",
    "on": "Вкл",
    "off": "Выкл",
    "editPost": "Редактировать",
    "continue1": "Продолжить",
    "changeQuantity": "Изменить количество",
    "changeName": "Изменить название",
    "saveChanges": "Сохранить изменения",
    "deleteEntry": "Удалить запись",
    "settings": "Настройки",
    "lastSavedDhikr": "Последние сохраненные зикры"
  };
  static const Map<String, dynamic> en = {
    "activity": "Activity",
    "saved": "Saved",
    "dhikr": "Dhikr",
    "saveDhikr": "Save dhikr",
    "pleaseEnterAtTitleDhikr": "Please enter a title Dhikr",
    "cancel": "Cancel",
    "save": "Save",
    "language": "Language",
    "vibration": "Vibration",
    "sound": "Sound",
    "countAsVolumeKeys": "Count as volume keys",
    "on": "On",
    "off": "Off",
    "editPost": "Edit post",
    "continue1": "Continue",
    "changeQuantity": "Change quantity",
    "changeName": "Change name",
    "saveChanges": "Save changes",
    "deleteEntry": "Delete entry",
    "settings": "Settings",
    "lastSavedDhikr": "Last saved dhikrs"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ru": ru,
    "en": en
  };
}
