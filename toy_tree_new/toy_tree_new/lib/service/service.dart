import 'dart:convert';

import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class service {
  static var baseurl = "https://connectgoinfoware.com/toytree/api/";
  static var securitycode = "yp7280uvfkvdirgjkpo";

  singup(String name, email, address, floor, lanmark, dob, gender, number) async {
    print("------------------------------");
    var jsonResponce;
    var url = "register.php";
    var body = {
      "name": name,
      "email": email,
      "address": address,
      "floor": floor,
      "lanmark": lanmark,
      "dob": dob,
      "gender": gender,
      "number": number
    };

    var responce = await http.post(Uri.parse(baseurl + url),
        headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": securitycode
        },
        body: json.encode(body));
    print(body);
    print("${responce.body} -- ${body} -- ${url}");
    if(responce.statusCode == 200){
      print(responce.body);
      jsonResponce = json.decode(responce.body.toString());
      return jsonResponce;
    }
    return jsonResponce;
  }


   sendMultipartRequest() async {
    // var baseurl = "https://connectgoinfoware.com/toytree/api/";
    var securitycode = "yp7280uvfkvdirgjkpo";
    var jsonResponce;

    var url = "https://connectgoinfoware.com/toytree/api/product_details.php";

    // Create a MultipartRequest
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Set headers
    request.headers['Authorization'] = securitycode;

    // Add form fields
    request.fields['prodcut_id'] = '1';

    // Send the request
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        // Handle success
        jsonResponce = json.decode(await response.stream.bytesToString());
        print("jsonResponce: $jsonResponce");
        return jsonResponce;
      } else {
        // Handle error
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (error) {
      // Handle exception
      print("Error: $error");
    }
  }


  product_details(String id) async {
    var jsonResponce;
    var url = "https://connectgoinfoware.com/toytree/api/product_details.php";
    final body = {
      'prodcut_id': '1',
    };

    var responce = await http.post(Uri.parse(url),
        headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": securitycode
        },
        body: json.encode(body));
    print(responce.statusCode);
    print("${responce.body} -- ${body} -- ${url}");
    if(responce.statusCode == 200){
      jsonResponce = json.decode(responce.body);
      print("jsonResponce :: $jsonResponce");
      return jsonResponce;
    }
    return jsonResponce;
  }

  get_productDetails(String pid, ) async {
    var responseJson;
    var url = "https://connectgoinfoware.com/toytree/api/product_details.php";
    final body = {'prodcut_id': 1, };
    print( " prodDetails: " + url + " --" + json.encode(body));

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": securitycode
        },
        body: json.encode(body));
   responseJson = json.decode(response.body.toString());
    print(response.body);
    try {
    //  responseJson = _response(response);
      print( " prod details response : " + responseJson);
    } catch (e) {
      print('error caught prodD : $e');
      return responseJson;
    }
    return responseJson;
  }



  category() async {
    var jsonResponce;
    var url = "get_main_cat.php";
    var responce = await http.post(Uri.parse(baseurl + url),
        headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": securitycode
        },
        );
    print("${responce.body} -- ${url}");
    if(responce.statusCode == 200){
      print(responce.body);
      jsonResponce = json.decode(responce.body.toString());
      return jsonResponce;
    }
    return jsonResponce;
  }
  featured_toy() async {

    var jsonResponce;

    var url = "product.php";

    var responce = await http.post(Uri.parse(baseurl + url),
        headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": securitycode
        },
        );
    print("${responce.body} -- ${url}");
    if(responce.statusCode == 200){
      print(responce.body);
      jsonResponce = json.decode(responce.body.toString());
      return jsonResponce;
    }
    return jsonResponce;
  }
  tranding_toy() async {

    var jsonResponce;

    var url = "tranding_product.php";

    var responce = await http.post(Uri.parse(baseurl + url),
        headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json',
          "Authorization": securitycode
        },
        );
    print("${responce.body} -- ${url}");
    if(responce.statusCode == 200){
      print(responce.body);
      jsonResponce = json.decode(responce.body.toString());
      return jsonResponce;
    }
    return jsonResponce;
  }
}
