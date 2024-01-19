import 'package:roomance/import.dart';
import 'Seiten/UserProfile/pages/profile_page.dart';

// --- Neuer Code, um Navigation der Hauptseiten zu handeln ---

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color.fromARGB(
            71, 220, 193, 174), //leichter grauer Akzent mit Orangton
        shadowColor: Colors.black,
        elevation: 1,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            //Matches
            selectedIcon: GradientIcon(
              icon: Icons.done_all,
              gradient: LinearGradient(
                colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              size: 30,
            ),
            icon: Icon(
              Icons.done_all,
              size: 30,
            ),
            label: 'Matches',
          ),
          NavigationDestination(
            // Entdecken
            selectedIcon: GradientIcon(
              icon: Icons.dashboard_rounded,
              gradient: LinearGradient(
                colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              size: 30,
            ),
            icon: Icon(
              Icons.dashboard_rounded,
              size: 30,
            ),
            label: 'Entdecken',
          ),
          NavigationDestination(
            // Swipen
            selectedIcon: Image(
              image: AssetImage(
                  'assets/images/logoicon.png'), // TODO Position etwas nach unten ausrichten
              width: 50,
              height: 50,
            ),
            icon: ImageIcon(
              AssetImage('assets/images/logoicon.png'),
              size: 50, // TODO Anmerkung: Geändert zu Test von 40 auf 50 .ML
            ),
            label: '',
          ),
          NavigationDestination(
            // Chat
            selectedIcon: Badge(
              label: Text('-1'), // Nicht weiter implementiert
              child: GradientIcon(
                icon: Icons.chat_bubble_rounded,
                gradient: LinearGradient(
                  colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                size: 30,
              ),
            ),
            icon: Badge(
              label: Text('-1'), 
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                size: 30,
              ),
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            // Profil
            selectedIcon: GradientIcon(
              icon: Icons.person,
              gradient: LinearGradient(
                colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              size: 30,
            ),
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            label: 'Profil',
          ),
        ],
      ),
      body: <Widget>[
        // TODO Seiten richtig verlinken
        const Matches(),
        const EntdeckenScreen(),
        // const Swipen(),
        const Chat(),
        const ProfilePage(), 
      ][currentPageIndex],
    );
  }
}

// --- ALTE NavBar ---

// bottomNavigationBar: SizedBox(
//         height: 60,
//         child: BottomAppBar(
//           color: Colors.white,
//           elevation: 8,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildIconButton(
//                 label: 'Matches',
//                 imagePath: 'assets/images/Matches.png',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const Matches()),
//                   );
//                 },
//               ),
//               buildIconButton(
//                 label: 'Entdecken',
//                 imagePath: 'assets/images/Entdecken.png',
//                 scale: 1,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
//                   );
//                 },
//               ),
//               buildIconButton(
//                 label: 'Logo3',
//                 imagePath: 'assets/images/logo3.png',
//                 scale: 1.5,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const Swipen()),
//                   );
//                 },
//               ),
//               buildIconButton(
//                 label: 'Chat',
//                 imagePath: 'assets/images/Chat.png',
//                 scale: 1.2,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const Chat()),
//                   );
//                 },
//               ),
//               buildIconButton(
//                 label: 'Profil',
//                 imagePath: 'assets/images/Profil.png',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const EntdeckenScreen()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),