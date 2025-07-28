// import 'package:flutter/material.dart';
// import 'package:login_page_flutter/controllers/form_controller.dart';
// import 'package:login_page_flutter/home_page.dart';
// import 'package:login_page_flutter/password_page.dart';
// import 'package:login_page_flutter/register_page.dart';
// import 'package:login_page_flutter/widgets/custom_button.dart';
// import 'package:login_page_flutter/widgets/custom_text_field.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:login_page_flutter/services/httpStatusCodes.dart';
// import 'package:device_info_plus/device_info_plus.dart';
//
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Page',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home:  LoginPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//
//   LoginPage({super.key});
//
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
//
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   bool onPress = false;
//   String username = "";
//   String password = "";
//   String device_name ="flutter_app";
//   bool nullPassword = false;
//   bool nullUsername = false;
//   bool isChecked = false; // checkbox durumu
//
//   final Dio _dio = Dio(
//     BaseOptions(
//       //baseUrl: 'http://cameLaravel.test/api', // Bu kısım kullanılmıyor, tam URL veriliyor
//       connectTimeout: const Duration(seconds: 10), // Bağlantı zaman aşımı
//       receiveTimeout: const Duration(seconds: 10), // Veri alma zaman aşımı
//     ),
//   );
//
//   late SharedPreferences _prefs;
//
//   @override
//   void initState() {
//     super.initState();
//     _initSharedPreferences();
//   }
//
//   // SharedPreferences'ı başlatma metodu
//   Future<void> _initSharedPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//     _checkRememberedUser(); // SharedPreferences hazır olduğunda otomatik giriş kontrolü
//   }
//
//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   Color getColor(Set<WidgetState> states) {
//     const Set<WidgetState> interactiveStates = <WidgetState>{
//       WidgetState.pressed,
//       WidgetState.hovered,
//       WidgetState.focused,
//     };
//     if (states.any(interactiveStates.contains)) {
//       return Colors.blue;
//     }
//     return Colors.blue;
//   }
//
//   void showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   // Otomatik giriş kontrolü
//   Future<void> _checkRememberedUser() async {
//     final String? rememberToken = _prefs.getString('remember_me_token');
//
//     if (rememberToken != null) {
//       try {
//         DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//         AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//         String currentDeviceName = androidInfo.model;
//
//         final response = await _dio.post(
//           'http://192.168.14.143:8000/api/auto-login',
//           data: {
//             'remember_token': rememberToken,
//             'device_name': currentDeviceName,
//           },
//           options: Options(
//             followRedirects: true,
//             validateStatus: (status) {
//               return status != null && status < 500;
//             },
//           ),
//         );
//
//         if (!mounted) return;
//
//         if (response.statusCode == 200) {
//
//           final String? authToken = response.data['token'];
//           final String? newRememberToken = response.data['remember_token'];
//
//           if (authToken != null) {
//             await _prefs.setString('authToken', authToken);
//             // Eğer remember_token değişirse veya güncellenirse tekrar kaydet
//             if (newRememberToken != null && newRememberToken != rememberToken) {
//               await _prefs.setString('remember_me_token', newRememberToken);
//             }
//             if (mounted) {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => const HomePage()));
//             }
//           }
//         } else {
//           // Otomatik giriş başarısız olursa tokenları temizle
//           await _prefs.remove('authToken');
//           await _prefs.remove('remember_me_token');
//           showError(response.data['message'] ?? 'Oturumunuzun süresi doldu, lütfen tekrar giriş yapın.');
//         }
//       } on DioException catch (e) {
//         print("Otomatik Giriş Dio Hatası: $e");
//         // Hata durumunda tokenları temizle
//         await _prefs.remove('authToken');
//         await _prefs.remove('remember_me_token');
//         if (mounted) {
//           showError(
//               'Otomatik giriş sırasında bir hata oluştu. Lütfen internet bağlantınızı kontrol edin.');
//         }
//       } catch (e) {
//         print("Otomatik Giriş Genel Hata: $e");
//         await _prefs.remove('authToken');
//         await _prefs.remove('remember_me_token');
//         if (mounted) {
//           showError('Beklenmedik bir hata oluştu.');
//         }
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       resizeToAvoidBottomInset: false,
//
//       appBar: AppBar(
//         title: const Text('Came Özak'),
//         backgroundColor: Colors.blue,
//       ),
//
//       body: SafeArea(
//         child: Center(
//           child: Container(
//
//             padding: EdgeInsets.all(20),margin:  EdgeInsets.all(9),
//             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),),
//
//             child: Column(
//
//               mainAxisSize: MainAxisSize.min,
//               children: [
//
//                 // İkon
//                 Container(
//                   margin:  EdgeInsets.only(bottom: 20),
//                   decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.all(Radius.circular(20)),
//                     boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),spreadRadius: 5, blurRadius: 15,offset: Offset(0, 3),),],),
//                   child:  Icon(Icons.person,size: 150,color: Colors.blue,),
//                 ),
//
//                 // Kullanıcı Adı
//                 Container(
//
//                   margin:  EdgeInsets.only(bottom: 15,top: 15),
//                   child: CustomTextField(
//
//                     icon: Icons.person,
//                     label: "Kullanıcı Adı",
//                     autofocus: true,
//                     isPassword: false,
//                     errorText: nullUsername ? "Kullanıcı adı boş olamaz!" : null,
//                     hint: "example@gmail.com",
//                     controller: usernameController,
//                     isValid: !nullUsername,
//
//                     callback: (value){
//
//                       setState(() {
//                         username = value;
//                         nullUsername = value.isEmpty;
//
//                       }
//
//                       );
//                     },
//                   ),
//                 ),
//
//                 // Şifre
//                 Container(
//
//                     child: CustomTextField(
//                       icon: Icons.lock,
//                       label: "Şifre",
//                       autofocus: false,
//                       isPassword: true,
//                       hint: "",
//                       errorText: nullPassword ? "Şifre boş bırakılamaz!" : null,
//                       controller: passwordController,
//                       isValid: !nullPassword,
//
//                       callback: (value){
//
//                         setState(() {
//                           password = value;
//                           nullPassword =value.isEmpty;
//
//                         });
//                       },
//                     )
//                 ),
//
//                 Row(
//                   children: [
//
//                     Container(
//                       margin: EdgeInsets.only(bottom: 180,top: 15), alignment: Alignment.center,
//                       child: Text('Beni hatırla'),
//
//                     ),
//
//                     Container(
//                       margin: EdgeInsets.only(bottom: 180,top: 15), alignment: Alignment.bottomLeft,
//                       child: Checkbox(
//
//                         checkColor: Colors.white,
//                         fillColor: WidgetStateProperty.resolveWith(getColor),
//                         value: isChecked,
//                         onChanged: (bool? value) {
//                           setState(() {
//                             isChecked = value!;
//                           });
//                         },
//                       ),
//                     ),
//
//                     Container(
//                       margin: EdgeInsets.only(bottom: 180,top: 15, left: 10), alignment: Alignment.bottomRight,
//
//                       child: GestureDetector(
//                         onTap: (){
//                           if (mounted) {
//                             Navigator.push(context, MaterialPageRoute(
//                               builder: (context) => PasswordPage(),));
//                           }},
//                         child: Text('Şifremi unuttum',style: TextStyle(decoration: TextDecoration.underline,color:Colors.blue)),
//                       ),
//                     ),
//
//                   ],
//                 ),
//
//                 // Giriş Butonu
//                 Row(
//                   children: [
//                     Container(
//                       width: 105,height: 40,margin: EdgeInsets.only(left: 25, bottom: 30),alignment: Alignment.bottomLeft,
//
//                       child: CustomButton(text: "Giriş yap",snackText: "", snack: false,isNavigation: false,onPress: true,
//
//                         callback: (value) async {
//
//                           if (value == "ok") {
//
//                             FormController formController = FormController();
//
//                             Map<String, dynamic> userValid = {
//                               "value": username,
//                               "validators": [
//                                 {
//                                   "type": "empty"
//                                 },
//                                 {
//                                   "type": "len",
//                                   "len": 6 // Bu kısım e-posta için uygun olmayabilir, dikkat edin.
//                                 },
//                                 {
//                                   "type": "email"
//                                 },
//                               ]
//                             };
//
//                             Map<String, dynamic> userValidReturn = formController.formValid(userValid);
//                             if (userValidReturn["status"] != "ok") {
//                               showError(userValidReturn["message"]);
//                               setState(() {
//                                 nullUsername = username.isEmpty;
//                                 nullPassword = password.isEmpty;
//                               });
//
//                               return;
//                             }
//
//                             Map<String, dynamic> passValid = {
//                               "value": password,
//                               "validators": [
//                                 {
//                                   "type": "empty"
//                                 },
//                                 {
//                                   "type": "len",
//                                   "len": 8
//                                 },
//                               ]
//                             };
//
//                             Map<String, dynamic> passValidReturn = formController.formValid(passValid);
//                             if (passValidReturn["status"] != "ok") {
//                               showError(passValidReturn["message"]);
//                               return;
//                             }
//
//                             DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//                             AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//                             String currentDeviceName = androidInfo.model; // Cihaz adını al
//
//                             try {
//                               final response = await _dio.post(
//
//                                 'http://192.168.14.143:8000/api/login',
//
//                                 data: {
//                                   'email': username,
//                                   'password': password,
//                                   "device_name": currentDeviceName,
//                                   "remember": isChecked,
//                                 },
//                                 options: Options(
//                                   followRedirects: true,
//                                   validateStatus: (status) {
//                                     return status != null && status < 500;
//                                   },
//                                 ),
//                               );
//
//                               if(!mounted) return;
//
//                               if (response.statusCode == 200 ) {
//
//                                 final String? authToken = response.data['token'];
//                                 final String? rememberToken = response.data['remember_token'];
//
//                                 if (authToken != null) {
//                                   await _prefs.setString('authToken', authToken);
//
//                                   if (isChecked && rememberToken != null) {
//                                     await _prefs.setString('remember_me_token', rememberToken);
//                                   } else {
//                                     await _prefs.remove('remember_me_token');
//                                   }
//
//                                   if (mounted) {
//                                     Navigator.pushReplacement(context,
//                                         MaterialPageRoute(builder: (
//                                             context) => const HomePage()));
//                                   }
//                                 }
//
//                               } else {
//                                 int? error = response.statusCode;
//                                 showError(HttpStatusCodes.getMessage(error!));
//                               }
//
//                             } on DioException catch (e) {
//                               if (!mounted) return;
//                               if (e.response != null) {
//                                 //showError("Sunucu hatası: ${e.response?.data['message'] ?? 'Bilinmeyen sunucu yanıtı.'}");
//                                 showError("Sunucu hatası.");
//                                 print("Genel Hata: $e");
//                               } else {
//                                 showError("Bağlantı sağlanamıyor. Lütfen internet bağlantınızı kontrol edin.");
//                               }
//                             } catch (e) {
//                               if (!mounted) return;
//                               showError("Beklenmedik bir hata oluştu: ${e.toString()}");
//                               print("Genel Hata: $e");
//                             }
//
//                           }
//                         },
//
//                       ),
//
//                     ),
//
//                     Container(
//                       width: 96,height: 40,margin: EdgeInsets.only(left: 60, bottom: 30),alignment: Alignment.bottomRight,
//
//                       child: CustomButton(
//                         text: 'Kayıt ol',
//                         snackText: "",
//                         snack: false,
//                         isNavigation: true,
//                         onPress: true,
//
//                         callback: (value){
//                           if (value == "ok"){
//
//                             if (mounted){
//                               Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
//                               //Navigator.push(context, MaterialPageRoute(builder: (context) => VerifiedRegisterPage(),));
//                             }
//
//                           }
//                         },
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//
//           ),
//
//         ),
//       ),
//     );
//
//   }
// }

//-------------------------------------------------------------------------------------------------------------------------


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc kütüphanesi
import 'package:login_page_flutter/blocs/auth/auth_bloc.dart'; // AuthBloc import
import 'package:login_page_flutter/blocs/email_verification/email_verification_bloc.dart'; // EmailVerificationBloc import
// import 'package:login_page_flutter/blocs/password_reset/password_reset_bloc.dart'; // PasswordResetBloc import (henüz oluşturmadık)
import 'package:login_page_flutter/home_page.dart';
import 'package:login_page_flutter/password_page.dart'; // Bu sayfa güncellenecek
import 'package:login_page_flutter/register_page.dart'; // Bu sayfa güncellenecek
import 'package:login_page_flutter/verify_registration_email_page.dart'; // Bu sayfa güncellenecek
import 'package:login_page_flutter/widgets/custom_button.dart';
import 'package:login_page_flutter/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_page_flutter/services/httpStatusCodes.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:login_page_flutter/config/app_config.dart'; // API URL'sini merkezileştirmek için
import 'package:login_page_flutter/blocs/password_reset/password_reset_bloc.dart'; // Yeni import


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl, // Base URL burada kullanıldı
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

  runApp(

    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(dio, prefs)..add(AutoLoginRequested(

            rememberToken: prefs.getString('remember_me_token') ?? '',
            deviceName: androidInfo.model, // Gerçek cihaz adı için deviceInfo kullanabilirsiniz
          )), // Otomatik giriş başlangıçta tetiklenecek
        ),
        BlocProvider<EmailVerificationBloc>(
          create: (context) => EmailVerificationBloc(dio),
        ),
        // BlocProvider<PasswordResetBloc>(
        //   create: (context) => PasswordResetBloc(dio),
        // ),
        BlocProvider<PasswordResetBloc>(
          create: (context) => PasswordResetBloc(dio, prefs), // Bloc'u burada oluşturun
        ),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is AuthSuccess && state.authToken != null) {
            return const HomePage(); // Giriş başarılıysa ana sayfaya git
          }
          return LoginPage(); // Giriş yapılmamışsa veya hata varsa giriş sayfasına dön
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// LoginPage sınıfının geri kalanı aynı kalabilir, sadece içeriği Bloc ile güncellenecek.
// ... (LoginPage sınıfı)
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // isLoading ve errorText gibi durumları Bloc yönetecek
  bool isChecked = false; // checkbox durumu

  // Dio instance'ı artık Bloc'ta yönetiliyor.
  // SharedPreferences da Bloc'ta yönetiliyor.

  @override
  void initState() {
    super.initState();
    // Otomatik giriş mantığı AuthBloc'a taşındı.
    // _initSharedPreferences() ve _checkRememberedUser() artık burada değil.
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
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
      body: BlocListener<AuthBloc, AuthState>( // Bloc durumlarını dinle
        listener: (context, state) {
          if (state is AuthSuccess) {
            showError(state.message);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage())); // main.dart'taki home Builder'ı halledecek
          } else if (state is AuthError) {
            showError(state.message);
          }
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(9),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 15, offset: const Offset(0, 3)),
                    ],
                  ),
                  child: const Icon(Icons.person, size: 150, color: Colors.blue),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, top: 15),
                  child: CustomTextField(
                    icon: Icons.person,
                    label: "Kullanıcı Adı",
                    autofocus: true,
                    isPassword: false,
                    hint: "example@gmail.com",
                    controller: usernameController,
                    isValid: true, // Bloc'ta doğrulama yapılacağı için burada varsayılan olarak true
                    callback: (value) {
                      // username = value; // Bu artık doğrudan kullanılmayacak, olay ile gönderilecek
                    },
                  ),
                ),
                Container(
                  child: CustomTextField(
                    icon: Icons.lock,
                    label: "Şifre",
                    autofocus: false,
                    isPassword: true,
                    hint: "",
                    controller: passwordController,
                    isValid: true, // Bloc'ta doğrulama yapılacağı için burada varsayılan olarak true
                    callback: (value) {
                      // password = value; // Bu artık doğrudan kullanılmayacak, olay ile gönderilecek
                    },
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 180, top: 15),
                      alignment: Alignment.center,
                      child: const Text('Beni hatırla'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 180, top: 15),
                      alignment: Alignment.bottomLeft,
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 180, top: 15, left: 10),
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          if (mounted) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordPage()));
                          }
                        },
                        child: const Text('Şifremi unuttum', style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 105,
                      height: 40,
                      margin: const EdgeInsets.only(left: 25, bottom: 30),
                      alignment: Alignment.bottomLeft,
                      child: BlocBuilder<AuthBloc, AuthState>( // Butonun durumunu AuthBloc'tan al
                        builder: (context, state) {
                          final bool isLoading = state is AuthLoading;
                          return CustomButton(
                            text: isLoading ? "Giriş yapılıyor..." : "Giriş yap",
                            snackText: "",
                            snack: false,
                            isNavigation: false,
                            onPress: !isLoading, // Yüklenirken devre dışı bırak
                            callback: (value) async {
                              if (value == "ok" && !isLoading) {
                                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                                String currentDeviceName = androidInfo.model;

                                // Bloc'a LoginRequested olayı gönder
                                context.read<AuthBloc>().add(
                                  LoginRequested(
                                    email: usernameController.text.trim(),
                                    password: passwordController.text.trim(),
                                    deviceName: currentDeviceName,
                                    rememberMe: isChecked,
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 96,
                      height: 40,
                      margin: const EdgeInsets.only(left: 60, bottom: 30),
                      alignment: Alignment.bottomRight,
                      child: CustomButton(
                        text: 'Kayıt ol',
                        snackText: "",
                        snack: false,
                        isNavigation: true,
                        onPress: true,
                        callback: (value) {
                          if (value == "ok") {
                            if (mounted) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                            }
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