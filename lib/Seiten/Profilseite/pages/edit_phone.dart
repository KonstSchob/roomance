import 'package:roomance/Funktionsbausteine/import.dart';
import 'package:string_validator/string_validator.dart';


// --- Seite, um Telefonnummer zu bearbeiten ---
class EditPhoneFormPage extends StatefulWidget {
  const EditPhoneFormPage({Key? key}) : super(key: key);
  @override
  State<EditPhoneFormPage> createState() {
    return EditPhoneFormPageState();
  }
}

class EditPhoneFormPageState extends State<EditPhoneFormPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void updateUserValue(String phone) {
    String formattedPhoneNumber = "${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7, phone.length)}";
    user.phone = formattedPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    width: 320,
                    child: Text(
                      "Deine Telefonnummer",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Formvalidierung der Handynummer
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Bitte gebe deine Telefonnummer ein';
                            } else if (isAlpha(value)) {
                              return 'Bitte nur Nummern';
                            } else if (value.length < 10) {
                              return 'Bitte eine gültige Telefonnummer';
                            }
                            return null;
                          },
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Deine Telefonnummer hier',
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox( //TODO Größe aller Buttons einstellen
                          width: 200,
                          height: 50,
                          child: GradientElevatedButton(
                            onPressed: () {
                              // Formvalidierung der Handynummer
                              if (_formKey.currentState!.validate() &&
                                  isNumeric(phoneController.text)) {
                                updateUserValue(phoneController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Speichern',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}
