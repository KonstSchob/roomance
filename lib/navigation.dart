import 'package:roomance/import.dart';

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
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          //TODO Label und Icons für Seiten richtig machen
          NavigationDestination(
            selectedIcon: Icon(
              Icons.done_all,
            ),
            icon: GradientIcon(
              icon: Icons.done_all,
              gradient: LinearGradient(
                colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                begin: Alignment(0.00, -1.00), // Farbverlauf
                end: Alignment(0, 1),
              ),
              size: 30,
            ),
            label: 'Matches',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Entdecken',
          ),
          NavigationDestination(
            icon: ImageIcon(
              AssetImage("assets/logo1.png"),
              size: 24,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'), // TODO Variable
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'), // TODO Variable
              child: Icon(Icons.perm_identity),
            ),
            label: 'Profil',
          ),
        ],
      ),
      body: <Widget>[
        // TODO Seiten verlinken
        const EntdeckenScreen(),
        const Chat(),
        const Matches(),
        const Swipen(),
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