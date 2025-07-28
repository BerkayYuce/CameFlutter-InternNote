
class HttpStatusCodes {
  static const Map<int, String> statusMessages = {
    200: 'Giriş Başarılı',
    201: 'Başarıyla oluşturuldu',
    302: 'Kullanıcı adı veya şifre yanlış!',
    400: 'Geçersiz İstek',
    401: 'Lütfen hesabınızı doğrulayınız',
    403: 'Hesap bulunamadı',
    404: 'Bulunamadı',
    422: 'Bu e-posta adresi zaten sistemde kayıtlı. '
         'Lütfen farklı bir e-posta adresi kullanın '
         'veya giriş yapmayı deneyin.',
    429: 'Çok fazla istek',
    500: 'Sunucu Hatası',
    503: 'Hizmet Kapanmış',
  };

  // Durum mesajını döndürme
  static String getMessage(int statusCode) {
    return statusMessages[statusCode] ?? 'Bilinmeyen Hata';
  }
}
