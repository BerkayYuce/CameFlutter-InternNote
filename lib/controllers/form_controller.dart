class FormController {
  Map<String, dynamic> formValid(Map<String, dynamic> fields) {
    Map<String, dynamic> formValidReturn = {
      "status": "ok",
      "message": "başarılı",
    };

    String value = fields["value"];
    List<Map<String, dynamic>> validators =
    fields["validators"] as List<Map<String, dynamic>>;

    for (Map<String, dynamic> data in validators) {
      if (data["type"] == "empty") {
        if (value.isEmpty) {
          formValidReturn["status"] = "empty";
          formValidReturn["message"] = "Alan boş bırakılamaz";
          return formValidReturn;
        }
      } else if (data["type"] == "len") {
        if (value.length < int.parse(data["len"].toString())) {
          formValidReturn["status"] = "failed";
          formValidReturn["message"] =
          "Çok kısa (en az ${data["len"]} karakter)";
          return formValidReturn;
        }
      } else if (data["type"] == "email") {
        if (!value.contains("@") || !value.contains(".")) {
          formValidReturn["status"] = "failed";
          formValidReturn["message"] = "Geçersiz e-posta";
          return formValidReturn;
        }
      }
    }
    return formValidReturn;
  }
}
