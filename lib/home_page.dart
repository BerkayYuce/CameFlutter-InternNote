// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:login_page_flutter/main.dart';
// import 'package:dio/dio.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   String _userName = 'Misafir';
//
//   final Dio _dio = Dio();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadAndFetchUserName();
//   }
//
//   Future<void> _loadAndFetchUserName() async {
//
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String? authToken = prefs.getString('authToken');//Tokenı getir
//
//     if (authToken != null) {
//       try {
//
//         final response = await _dio.get(
//
//           'http://192.168.14.143:8000/api/user',
//
//           options: Options(
//             headers: {
//               'Authorization': 'Bearer $authToken',
//               'Accept': 'application/json',
//             },
//           ),
//         );
//
//         if (response.statusCode == 200) {
//
//           if (response.data != null && response.data is Map && response.data.containsKey('name')) {
//
//             setState(() {
//               _userName = response.data['name'].toString();
//             });
//
//           } else {
//
//             print('API yanıtında isim bulunamadı veya yapı beklendiği gibi değil.');
//           }
//
//         } else {
//
//           print('APIden kullanıcı bilgisi alınamadı: ${response.statusCode}');
//
//           _logout();
//         }
//       } on DioException catch (e) {
//
//         print('Kullanıcı bilgisi çekilirken Dio Hatası: $e');
//
//         if (e.response?.statusCode == 401) {
//           _logout();
//         }
//       } catch (e) {
//         print('Kullanıcı bilgisi çekilirken genel hata: $e');
//       }
//     } else {
//       _logout();
//     }
//
//   }
//
//   // Çıkış (Logout) fonksiyonu
//   Future<void> _logout() async {
//
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('authToken'); // Token'ı sil
//     await prefs.remove('userName'); // Kullanıcı adını da sil
//
//     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false,);
//   }
//
//   final List<Map<String, String>> items = List.generate(
//         20,
//         (index) => {
//       'title': 'Öğe ${index + 1}',
//       'description': 'Bu, ${index + 1}. öğenin açıklamasıdır. Daha fazla bilgi buraya yazılabilir.',
//     },
//   );
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       body: Column(
//
//         children: [
//
//           // HEADER
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//             decoration: BoxDecoration(
//               color: Colors.blue.shade700,
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: IconButton(
//                     icon: const Icon(Icons.logout, color: Colors.white, size: 30),
//                     onPressed: _logout,
//                     tooltip: 'Çıkış Yap',
//                   ),
//                 ),
//
//                 Text(
//                   'Hoş geldin, $_userName!', // Kullanıcı adını gösterecek
//                   style: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Görevlerin aşağıda listelendi.',
//                   style: TextStyle(fontSize: 16, color: Colors.white70),
//                 ),
//               ],
//             ),
//           ),
//
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(20),
//               itemCount: items.length,
//
//               itemBuilder: (context, index) {
//                 final item = items[index];
//
//                 return Card(
//                   margin: const EdgeInsets.only(bottom: 10),
//                   elevation: 5,
//                   child: ExpansionTile(
//                     leading: const Icon(Icons.task),
//                     title: Text(item['title']!),
//                     trailing: const Icon(Icons.expand_more),
//
//                     children: [
//
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                         child: Text(
//                           item['description']!,
//                           style: TextStyle(color: Colors.grey[700]),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//-----------------------------------------------------------------------------------------

// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc için import
import 'package:login_page_flutter/blocs/auth/auth_bloc.dart'; // AuthBloc import
// Artık LoginPage'i doğrudan import etmeyeceğiz, çünkü navigasyonu Bloc yönetecek

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userName = 'Misafir';
  final Dio _dio = Dio(); // Dio burada kalsın, kullanıcı bilgisi çekmek için

  @override
  void initState() {
    super.initState();
    _loadAndFetchUserName();
  }

  Future<void> _loadAndFetchUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('authToken');

    if (authToken != null) {
      try {
        final response = await _dio.get(
          'http://192.168.14.143:8000/api/user',
          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken',
              'Accept': 'application/json',
            },
          ),
        );

        if (response.statusCode == 200) {
          if (response.data != null && response.data is Map && response.data.containsKey('name')) {
            setState(() {
              _userName = response.data['name'].toString();
            });
          } else {
            print('API yanıtında isim bulunamadı veya yapı beklendiği gibi değil.');
            // Kullanıcı bilgisi alınamadıysa, AuthBloc'a çıkış olayını gönder
            context.read<AuthBloc>().add(LogoutRequested());
          }
        } else {
          print('APIden kullanıcı bilgisi alınamadı: ${response.statusCode}');
          // Hata durumunda çıkış yap, AuthBloc'a çıkış olayını gönder
          context.read<AuthBloc>().add(LogoutRequested());
        }
      } on DioException catch (e) {
        print('Kullanıcı bilgisi çekilirken Dio Hatası: $e');
        if (e.response?.statusCode == 401) {
          // 401 Unauthorized durumunda çıkış yap, AuthBloc'a çıkış olayını gönder
          context.read<AuthBloc>().add(LogoutRequested());
        } else {
          // Diğer ağ hatalarında da çıkış yap, AuthBloc'a çıkış olayını gönder
          context.read<AuthBloc>().add(LogoutRequested());
        }
      } catch (e) {
        print('Kullanıcı bilgisi çekilirken genel hata: $e');
        // Genel hatalarda çıkış yap, AuthBloc'a çıkış olayını gönder
        context.read<AuthBloc>().add(LogoutRequested());
      }
    } else {
      // Token yoksa doğrudan çıkış yap, AuthBloc'a çıkış olayını gönder
      context.read<AuthBloc>().add(LogoutRequested());
    }
  }

  final List<Map<String, String>> items = List.generate(
    20,
        (index) => {
      'title': 'Öğe ${index + 1}',
      'description': 'Bu, ${index + 1}. öğenin açıklamasıdır. Daha fazla bilgi buraya yazılabilir.',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white, size: 30),
                    // _logout() fonksiyonunu doğrudan çağırmak yerine,
                    // Bloc'a LogoutRequested olayı gönderiyoruz.
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutRequested());
                    },
                    tooltip: 'Çıkış Yap',
                  ),
                ),
                Text(
                  'Hoş geldin, $_userName!', // Kullanıcı adını gösterecek
                  style: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Görevlerin aşağıda listelendi.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  elevation: 5,
                  child: ExpansionTile(
                    leading: const Icon(Icons.task),
                    title: Text(item['title']!),
                    trailing: const Icon(Icons.expand_more),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          item['description']!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}