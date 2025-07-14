
class FormController{
  formValid(Map<String,dynamic> fields){
    //empty, len, email,
    Map<String,dynamic> formValidReturn = {
      "status" : "",
      "message" : ""
    };
    String value = fields["value"];
    List<Map<String,dynamic>> validators= fields["validators"] as List<Map<String,dynamic>> ;
    for (Map<String,dynamic> data in validators) {
      if(data["type"]=="empty"){
        if(value.isEmpty){
          formValidReturn["status"] = "empty";
          formValidReturn["message"] = "Alan boş bırakılamaz";
          return formValidReturn;
        }
      } else if(data["type"]=="len"){
        if(value.length < int.parse(data["len"])){
          formValidReturn["status"] = "failed";
          formValidReturn["message"] = "Çok kısa";
          return formValidReturn;
        }

      } else if(data["type"] == "email"){
        //Email kontrolü @ - .com
      }
    }

  }
}