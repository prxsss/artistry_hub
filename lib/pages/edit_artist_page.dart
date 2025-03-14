import 'package:artistry_hub/enums/gender.dart';
import 'package:artistry_hub/models/artist.dart';
import 'package:artistry_hub/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditArtistPage extends StatefulWidget {
  final String artistId;
  final Artist artist;

  const EditArtistPage(this.artistId, this.artist, {super.key});

  @override
  State<EditArtistPage> createState() => _EditArtistPageState();
}

class _EditArtistPageState extends State<EditArtistPage> {
  final DatabaseService _databaseService = DatabaseService();

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController nationalityController;
  late final TextEditingController outstandingAchievementController;
  late Gender selectedGender;

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.artist.name);
    nationalityController = TextEditingController(
      text: widget.artist.nationality,
    );
    outstandingAchievementController = TextEditingController(
      text: widget.artist.outstandingAchievement,
    );
    selectedGender = widget.artist.gender;
  }

  @override
  void dispose() {
    nameController.dispose();
    nationalityController.dispose();
    outstandingAchievementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Artist")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter an artist's name";
                        }
                        return null;
                      },
                      autofocus: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender'),
                    SizedBox(height: 8),
                    DropdownButtonFormField(
                      value: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please select an artist's gender";
                        }
                        return null;
                      },
                      items:
                          Gender.values.map((g) {
                            return DropdownMenuItem(
                              value: g,
                              child: Text(capitalize(g.name)),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nationality'),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: nationalityController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter an artist's nationality";
                        }
                        return null;
                      },
                      autofocus: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Outstanding Achievement'),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: outstandingAchievementController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter an artist's outstanding achievement";
                        }
                        return null;
                      },
                      autofocus: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final convertedGender =
                          selectedGender.name == 'male' ? 'boy' : 'girl';

                      Artist updatedArtist = Artist(
                        name: nameController.text,
                        gender: selectedGender,
                        image:
                            'https://avatar.iran.liara.run/public/$convertedGender?username=${nameController.text.trim().replaceAll(' ', '_')}',
                        nationality: nationalityController.text,
                        outstandingAchievement:
                            outstandingAchievementController.text,
                        createdAt: Timestamp.now(),
                        updatedAt: Timestamp.now(),
                      );

                      _databaseService.updateArtist(
                        widget.artistId,
                        updatedArtist,
                      );

                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
