import 'dart:async';
import 'package:roomance/import.dart';

// --- Erstellen und Verwalten der Profilseite ---

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          const Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Dein Profil',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 0),
                    ),
                  ))),
          InkWell(
              onTap: () {
                navigateSecondPage(const EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
              )),
          buildUserInfoDisplay(
              user.name, 'Vor- und Nachname', const EditNameFormPage()),
          buildUserInfoDisplay(
              user.phone, 'Telefonnummer', const EditPhoneFormPage()),
          buildUserInfoDisplay(
              user.email, 'Email-Adresse', const EditEmailFormPage()),
          Expanded(
            flex: 4,
            child: buildAbout(user),
          )
        ],
      ),
    );
  }

  // Zeigt die Nutzerinfo (Name, Nummer und Email) an
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              //Zeigt die Überschrift der jeweiligen Userinfo-Felder an
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Container(
                //Enthält clickbares Textfeld mit jeweiliger Nutzerinfo und Pfeil
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  //Graue Hinterlegung
                  color: const Color.fromARGB(120, 221, 221, 221),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                    //Clickbares Textfeld
                    onPressed: () {
                      navigateSecondPage(editPage);
                    },
                    style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    child: Row(children: [
                      Expanded(
                          child: Text(
                        getValue.isEmpty
                            ? 'Bitte gib deine Daten an'
                            : getValue, //Überprüft, ob Textfeld leer ist
                        style: const TextStyle(
                            color: Colors.black, fontSize: 16, height: 1.4),
                      )),
                      const GradientIcon(
                        //Pfeil in roomance Farbverlauf
                        icon: Icons.keyboard_arrow_right,
                        gradient: LinearGradient(
                          colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        size: 40.0,
                      )
                    ]))),
          ]));

  // Zeigt den "Erzähl was über dich" Bereich an
  Widget buildAbout(User user) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meine Beschreibung',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                //Graue Hinterlegung
                color: const Color.fromARGB(120, 221, 221, 221),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  navigateSecondPage(const EditDescriptionFormPage());
                },
                style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            Align(
                                alignment: Alignment.topLeft,
                            child:
                            Text(
                      user.aboutMeDescription.isEmpty
                          ? 'Erzähle etwas über dich'
                          : user
                              .aboutMeDescription, //Überprüft, ob Textfeld leer ist
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ))),
                    const GradientIcon(
                      icon: Icons
                          .keyboard_arrow_right, //Pfeil in roomance Farbverlauf
                      gradient: LinearGradient(
                        colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      size: 40.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  // Refreshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
