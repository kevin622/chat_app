import 'package:chat_app/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = "";
  String userEmail = "";
  String userPassword = "";

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 90,
                  left: 20,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/red.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome",
                        style: const TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text:
                                isSignupScreen ? " to KookHyun chat!" : " back",
                            style: const TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to continue"
                          : "Signin to continue",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // 배경
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                height: isSignupScreen ? 280 : 250,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 3,
                                    ),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 3,
                                    ),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (isSignupScreen)
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: const ValueKey(1),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 4) {
                                        return "Please enter at least 4 characters.";
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      userName = newValue!;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: "User Name",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    key: const ValueKey(2),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains("@")) {
                                        return "Please enter a valid email address.";
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      userEmail = newValue!;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    key: const ValueKey(3),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return "Password should be at least 7 characters.";
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      userPassword = newValue!;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      if (!isSignupScreen)
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey(4),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains("@")) {
                                      return "Please enter a valid email address.";
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    userName = newValue!;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                TextFormField(
                                  key: const ValueKey(5),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return "Password should be at least 7 characters.";
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    userPassword = newValue!;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            // 텍스트 폼 필드
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 390,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () => _tryValidation(),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 전송 버튼
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: isSignupScreen
                  ? MediaQuery.of(context).size.height - 125
                  : MediaQuery.of(context).size.height - 165,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? "or Signup with" : "or Signin with"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Palette.googleColor,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text("Google"),
                  ),
                ],
              ),
            ),
            // 구글 로그인 버튼
          ],
        ),
      ),
    );
  }
}
