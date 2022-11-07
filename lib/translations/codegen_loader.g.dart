// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> eng = {
  "regis": "Register",
  "fio": "Full name",
  "user": "Username",
  "mail": "Email",
  "phone": "Phone number",
  "passw": "Password",
  "acc": "Already have an account?",
  "dalee": "NEXT",
  "voiti": "Login",
  "login": "Login",
  "accno": "Don't have an account?"
};
static const Map<String,dynamic> kaz = {
  "regis": "Тіркелу",
  "fio": "толық аты-жөні",
  "user": "Пайдаланушы аты",
  "mail": "Электронды пошта",
  "phone": "Телефон нөмірі",
  "passw": "Пароль",
  "acc": "Тіркелгі бар ма?",
  "dalee": "КЕЛЕСІ",
  "voiti": "Кіру",
  "login": "Кіру",
  "accno": "Есептік жазбаңыз жоқ па?"
};
static const Map<String,dynamic> rus = {
  "regis": "Регистрация",
  "fio": "ФИО",
  "user": "Имя пользователя",
  "mail": "Почтовый индекс",
  "phone": "Номер телефона",
  "passw": "Пароль",
  "acc": "Уже есть аккаунт?",
  "dalee": "ДАЛЕЕ",
  "voiti": "Войти",
  "login": "Логин",
  "accno": "Нет аккаунта?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"eng": eng, "kaz": kaz, "rus": rus};
}
