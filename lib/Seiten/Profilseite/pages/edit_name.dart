import 'package:roomance/Funktionsbausteine/import.dart';
import 'package:string_validator/string_validator.dart';

// --- Seite, um Namen zu bearbeiten ---

class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  State<EditNameFormPage> createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name) {
    user.name = name;
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
                  width: 330,
                  child: Text(
                    "Wie lautet dein Name?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Formvalidierung des Vornamen
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bitte schreibe deinen \nVornamen';
                              } else if (!isAlpha(value)) {
                                return 'Bitte nur Buchstaben eingeben';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(labelText: 'Vorname'),
                            controller: firstNameController,
                          ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Formvalidierung des Nachnamen
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bitte schreibe deinen \nNachnamen';
                              } else if (!isAlpha(value)) {
                                return 'Bitte nur Buchstaben eingeben';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Nachname'),
                            controller: secondNameController,
                          )))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330,
                        height: 50,
                        child: GradientElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                isAlpha(firstNameController.text +
                                    secondNameController.text)) {
                              updateUserValue("${firstNameController.text} ${secondNameController.text}");
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Speichern',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      )))
            ],
          ),
        ));
  }
}
