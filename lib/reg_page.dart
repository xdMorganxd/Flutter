import 'package:adiletproj/enter_page.dart';
import 'package:adiletproj/user.dart';
import 'package:flutter/material.dart';


class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool _hidepassword = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  final _fullnameFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();


  User newUser = User();

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/back2.jpg"),
              fit: BoxFit.fill)
            ),
            child: ListView(
              padding: const EdgeInsets.only(
                  top: 200, bottom: 200, right: 40, left: 40),
              children: [
                Container(
                  child: Text(
                    "Регистрация",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight:FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  focusNode: _fullnameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _fullnameFocus, _usernameFocus);
                  },
                  controller: _fullnameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "ФИО",
                    hintText: "Введите ФИО",
                    prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        color: Colors.black45),
                  ),
                  validator: validateFullName,
                  onSaved: (value) => newUser.fullname = value!,
                ),
                const SizedBox(height: 7),

                TextFormField(
                  focusNode: _phoneFocus,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _phoneFocus, _passFocus);
                  },
                  controller: _phoneController,
                  // maxLength: 10,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Номер телефона",
                    prefixIcon: Icon(
                      Icons.mobile_screen_share,
                      color: Colors.black45,
                    ),),
                  keyboardType: TextInputType.phone,
                  // validator: (value) => validatePhoneNumber(value!)
                  //     ? null
                  //     : 'Phone number must be entered as (###)###-####',
                  onSaved: (value) => newUser.phone = value!,
                ),

                const SizedBox(height: 7),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Почтовый адрес",
                    hintText: "Введите почтовый адрес",
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.black45,
                    ),),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  onSaved: (value) => newUser.email = value!,

                ),

                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _usernameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _usernameFocus, _emailFocus);
                  },
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Имя пользователя",
                    hintText: "Введите имя пользователя",
                    prefixIcon: Icon(
                      Icons.assignment_ind,
                      color: Colors.black45,
                    ),),
                  validator: validateUsername,
                  onSaved: (value) => newUser.username = value!,
                ),
                const SizedBox(height: 7),

                TextFormField(
                  focusNode: _passFocus,
                  controller: _passController,
                  obscureText: _hidepassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Пароль",
                    hintText: "Введите пароль",
                    suffixIcon: IconButton(
                      icon: Icon(
                          _hidepassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black45),
                      onPressed: () {
                        setState(() {
                          _hidepassword = !_hidepassword;
                        });
                      },
                    ),
                    prefixIcon: const Icon(
                      Icons.paste_sharp,
                      color: Colors.black45,
                    ),
                  ),
                  validator: _validatePassword,
                ),

                const SizedBox(height: 10),

                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.black45,
                  ),
                  height: 30,
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const StadiumBorder(),
                    onPressed: _submitForm,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Text(
                            'ДАЛЕЕ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Уже есть аккаунт?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13
                        ),),
                    ),
                    TextButton(
                      onPressed:() {
                        Navigator.push( context,
                          MaterialPageRoute(
                            builder: (context) => EnterPage(
                              usersInfo: newUser,
                            ),
                          ),
                        );},
                      child: const Text(
                        'Войти',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),)

                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(name: _fullnameController.text);
    } else {
      _showMessage(message: 'Неверно заполненные данные! Пожалуйста, попробуйте еще раз');
    }
  }

  String? validateFullName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Требуется полное имя.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Пожалуйста, введите буквы алфавита.';
    } else {
      return null;
    }
  }

  String? validateUsername(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Имя пользователя требуется.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Пожалуйста, введите буквы алфавита.';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value == null) {
      return 'Электронная почта не может быть пустой';
    } else if (!_emailController.text.contains('@')) {
      return 'Неверный адрес электронной почты';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passController.text.length <= 7) {
      return '8 символов требуется для пароля';
    }  else {
      return null;
    }
  }
  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Готово',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 23
            ),
          ),
          content: Text(
            '$name регистрация пройдена',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnterPage(
                      usersInfo: newUser,
                    ),
                  ),
                );
              },
              child: const Text(
                'Далее',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: const Color(0xFFEF5350),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 10
          ),),
      ),
    );
  }
}
