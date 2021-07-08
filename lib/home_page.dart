import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _codeFound = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: !_codeFound
            ? Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.blue),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "XXXX",
                      ),
                      controller: _textEditingController,
                    ),
                    MaterialButton(
                      color: Colors.white,
                      child: Text(
                        "VALIDER",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        checkCode();
                      },
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(50),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Bien joué !!!\n\n\nCe qu'il faut retenir de ce CrackMe : \n\nLes logs sont le point d'entrée de beaucoup de failles de sécurité "
                      "dans le monde des applications mobile. \nCertains logs que vous utilisez pour debugger votre application peuvent "
                      "parfois donner des informations cruciales à quelqu'un de malveillant. \nPensez à logger uniquement en debug, et à ne jamais logger d'informations importantes "
                      "comme un MDP, une URL etc...",
                      style: TextStyle(
                          color: Color(int.parse("0xFF3B73A5")), fontSize: 18),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void checkCode() {
    debugPrint("Checking Code");
    var goodCode = 182868 / 49;
    var valueFromTextfield = int.parse(_textEditingController.value.text);

    if (valueFromTextfield > goodCode) {
      print("Valeur supérieure à celle attendue");
    } else if (valueFromTextfield < goodCode) {
      print("Valeur inférieure à celle attendue");
    } else {
      setState(() {
        _codeFound = true;
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
