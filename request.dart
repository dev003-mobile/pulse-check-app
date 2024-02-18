import "package:http/http.dart" as http;

void main() async {
  final response = await http.get(Uri.http("09a1-102-214-36-76.ngrok-free.app", "/pulse-check")); 
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.body);
  }
}
