import 'package:adiletproj/hello.dart';
import 'package:adiletproj/user.dart';
import 'package:flutter/material.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({Key? key, required User usersInfo}) : super(key: key);

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  bool _hidepassword = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _passFocus = FocusNode();


  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backkk.jpg"),
                fit: BoxFit.fill
              )
            ),
            child: ListView(
              padding: const EdgeInsets.only(
                  top: 200, bottom: 200, right: 40, left: 40),
              children: [
                Container(
                  child: const Text(
                    "Логин",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight:FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
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
                            'ВОЙТИ',
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
                      child: const Text("Нет аккаунта?",
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
                        'Регистрация',
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HelloPage(
            usersInfo: newUser,
          ),
        ),
      );
    } else {
      _showMessage(message: 'Неверно заполненные данные! Пожалуйста, попробуйте еще раз');
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
