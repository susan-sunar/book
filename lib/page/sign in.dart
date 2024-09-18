import 'package:book/google%20font.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Placeholder for actual login logic
    String email = _emailController.text;
    String password = _passwordController.text;

    print("Email: $email");
    print("Password: $password");
  }
    @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.brown,
            ])
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/image/susan.jpg")),
                ),
              ),

              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                    child: Form(
                      key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(height: 20,
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: 'Enter your email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                suffixIcon: Icon(Icons.email_outlined),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return"Please enter your email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              maxLines: 1,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "Enter yor password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                  });
                                }, icon: Icon(Icons.visibility_off_outlined,
                                ),
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return"Please enter your password";
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ForgetPassword()),
                  //     );
                  //   },
                  //   child: Text("Forgot Password?",style: myStyle(20,Colors.blue),
                  //   ),
                  // ),
                  // Padding(padding:EdgeInsets.all(20),
                  //   child: MaterialButton(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //       minWidth: MediaQuery.of(context).size.width*0.9,
                  //       height: 40,
                  //       color: Colors.brown,
                  //       onPressed: (){
                  //        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>PracticeBottomNavBar(),
                  //        ),
                  //       (route)=>false,
                  //       );
                  //       }
                  //       ),false
                  // ),
                  Text("Log In",style: myStyle(19,Colors.grey,FontWeight.bold),),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
