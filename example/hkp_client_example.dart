import 'package:hkp_client/hkp_client.dart';

class Example {
  void main(List<String> args) async {
    String pubkey = '';
    // -- Generate or load Key --

    HkpClient client = new HkpClient('https://keys.openpgp.org');

    client.addKey(pubkey).then((respnse) => {print(respnse)});

    String email_key = await client.getKey("info@example.com");

    // or

    client.getKey("info@example.com").then((key) => {
          // Use key for encryption and send mail
        });
  }
}
