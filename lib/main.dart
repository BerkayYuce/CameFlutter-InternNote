import 'package:flutter/material.dart';
import 'package:login_page_flutter/controllers/form_controller.dart';
import 'package:login_page_flutter/home_page.dart';
import 'package:login_page_flutter/password_page.dart';
import 'package:login_page_flutter/register_page.dart';
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_page_flutter/services/httpStatusCodes.dart';
import 'package:device_info_plus/device_info_plus.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {

  LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();

}

  class _LoginPageState extends State<LoginPage> {

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    bool onPress = false;
    String username = "";
    String password = "";
    String device_name ="flutter_app";
    bool nullPassword = false;
    bool nullUsername = false;

    final Dio _dio = Dio(

      BaseOptions(
        //baseUrl: 'http://cameLaravel.test/api',
        connectTimeout: const Duration(seconds: 5), // Bağlantı zaman aşımı
        receiveTimeout: const Duration(seconds: 3), // Veri alma zaman aşımı
      ),

    );


    @override
    void dispose() {
      usernameController.dispose();
      passwordController.dispose();
      super.dispose();
    }


    void showError(String message) {

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: const Text('Came Özak'),
        backgroundColor: Colors.blue,
      ),

      body: SafeArea(
        child: Center(
          child: Container(

            padding: EdgeInsets.all(20),margin:  EdgeInsets.all(9),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),),

            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: [

                // İkon
                Container(
                  margin:  EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.5),spreadRadius: 5, blurRadius: 15,offset: Offset(0, 3),),],),
                  child:  Icon(Icons.person,size: 150,color: Colors.blue,),
                ),

                // Kullanıcı Adı
                Container(

                  margin:  EdgeInsets.only(bottom: 15,top: 15),
                  child: CustomTextField(

                    icon: Icons.person,
                    label: "Kullanıcı Adı",
                    autofocus: true,
                    isPassword: false,
                    errorText: nullUsername ? "Kullanıcı adı boş olamaz!" : null,
                    hint: "example@gmail.com",
                    controller: usernameController,
                    isValid: !nullUsername,

                    callback: (value){

                      setState(() {
                        username = value;
                        nullUsername = value.isEmpty;

                      }

                    );
                      },
                  ),
                ),

                // Şifre
                Container(

                    child: CustomTextField(
                      icon: Icons.lock,
                      label: "Şifre",
                      autofocus: false,
                      isPassword: true,
                      hint: "",
                      errorText: nullPassword ? "Şifre boş bırakılamaz!" : null,
                      controller: passwordController,
                      isValid: !nullPassword,

                      callback: (value){

                        setState(() {
                          password = value;
                          nullPassword =value.isEmpty;

                        });
                    },
                    )
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 180,top: 15), alignment: Alignment.bottomRight,

                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordPage(),));},
                    child: Text('Şifremi unuttum',style: TextStyle(decoration: TextDecoration.underline,color:Colors.blue)),
                  ),
                ),

                // Giriş Butonu
                Row(
                  children: [
                    Container(
                      width: 105,height: 40,margin: EdgeInsets.only(left: 25, bottom: 30),alignment: Alignment.bottomLeft,

                      child: CustomButton(text: "Giriş yap",snackText: "", snack: false,isNavigation: false,onPress: true,

                        callback: (value) async {

                          if (value == "ok") {

                              FormController formController = FormController();

                              Map<String, dynamic> userValid = {
                                "value": username,
                                "validators": [
                                  {
                                    "type": "empty"
                                  },
                                  {
                                    "type": "len",
                                    "len": 6
                                  },
                                  {
                                    "type": "email"
                                  },
                                ]
                              };

                              Map<String, dynamic> userValidReturn = formController.formValid(userValid);
                              if (userValidReturn["status"] != "ok") {
                                showError(userValidReturn["message"]);
                                setState(() {
                                  nullUsername = username.isEmpty;
                                  nullPassword = password.isEmpty;
                                });

                                return;
                              }

                              Map<String, dynamic> passValid = {
                                "value": password,
                                "validators": [
                                  {
                                    "type": "empty"
                                  },
                                  {
                                    "type": "len",
                                    "len": 8
                                  },
                                ]
                              };

                              Map<String, dynamic> passValidReturn = formController.formValid(passValid);
                              if (passValidReturn["status"] != "ok") {
                                showError(passValidReturn["message"]);
                                return;
                              }

                              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                              AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

                              try {
                                final response = await Dio().post(

                                  'http://192.168.14.143:8000/api/login',

                                  data: {
                                    'email': username,
                                    'password': password,
                                    "device_name": androidInfo.model,
                                  },
                                  options: Options(
                                    followRedirects: true, // Yönlendirmeleri otomatik takip et
                                    validateStatus: (status) {
                                      return status != null && status < 500; // 500 ve altı geçerli say
                                    },
                                  ),
                                );

                                if (response.statusCode == 200 ) {
                                  //showError("Giriş başarılı!");

                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  final String? authToken = response.data['token']; //Tokeni al

                                  if (authToken != null) {

                                    await prefs.setString('authToken', authToken); //Tokenı set et

                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                  }

                                } else {

                                  int? error = response.statusCode;
                                  showError(HttpStatusCodes.getMessage(error!));
                                }

                              } on DioException catch (e) {
                                if (e.response != null) {

                                  //showError("Sunucu hatası: ${e.response?.data['message'] ?? 'Bilinmeyen sunucu yanıtı.'}");

                                } else {

                                  //showError("İstek gönderilirken bir hata oluştu: Lütfen internet bağlantınızı kontrol edin.");
                                }
                                print("Dio Hatası: $e");
                              } catch (e) {

                                //showError("Beklenmedik bir hata oluştu: ${e.toString()}");
                                print("Genel Hata: $e");
                              }

                            }
                          },

                      ),

                    ),

                    Container(
                      width: 96,height: 40,margin: EdgeInsets.only(left: 60, bottom: 30),alignment: Alignment.bottomRight,

                      child: CustomButton(
                        text: 'Kayıt ol',
                        snackText: "",
                        snack: false,
                        isNavigation: true,
                        onPress: true,

                        callback: (value){
                          if (value == "ok"){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => VerifiedRegisterPage(),));
                          }
                        },
                      ),
                    ),

                  ],
                ),
              ],
            ),

          ),

        ),
      ),
    );

  }
}


