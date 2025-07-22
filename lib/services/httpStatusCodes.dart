
class HttpStatusCodes {
  static const Map<int, String> statusMessages = {
    200: 'Giriş Başarılı',
    201: 'Başarıyla oluşturuldu',
    302: 'Kullanıcı adı veya şifre yanlış!',
    400: 'Geçersiz İstek',
    401: 'Yetkisiz',
    403: 'Yasaklı',
    404: 'Bulunamadı',
    500: 'Sunucu Hatası',
    503: 'Hizmet Kapanmış',
  };

  // Durum mesajını döndürme
  static String getMessage(int statusCode) {
    return statusMessages[statusCode] ?? 'Bilinmeyen Hata';
  }
}
