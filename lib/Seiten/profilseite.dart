import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profilseite extends StatefulWidget {
  const Profilseite({Key? key}) : super(key: key);

  @override
  _ProfilseiteState createState() => _ProfilseiteState();
}

class _ProfilseiteState extends State<Profilseite> {
  late ImagePicker _imagePicker;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _takePicture() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _imageFile = image != null ? File(image.path) : null;
      });
    } catch (e) {
      print('Fehler beim Aufnehmen des Bildes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            top: 55,
            left: MediaQuery.of(context).size.width / 3 - 120,
            child: Image.asset(
              'assets/images/logo2.png',
              width: 45,
              height: 48,
            ),
          ),
          Positioned(
            top: 55,
            left: MediaQuery.of(context).size.width / 3 - 74,
            child: Row(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'roomance',
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Gudea',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -4,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            left: MediaQuery.of(context).size.width / 2 - 50,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!) as ImageProvider<Object>
                      : AssetImage('assets/nopic.png'),
                  child: _imageFile != null
                      ? null
                      : Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/nopic.png'),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                Text('Name:', style: TextStyle(fontSize: 18)), // Name
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Gib deinen Namen ein',
                  ),
                ),
                const SizedBox(height: 16),
                // Weitere TextFormFields hier hinzufügen, wenn nötig

                ElevatedButton(
                  onPressed: _takePicture,
                  child: Text('Foto aufnehmen'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
