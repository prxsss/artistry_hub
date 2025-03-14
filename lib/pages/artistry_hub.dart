import 'package:flutter/material.dart';

class ArtistryHub extends StatefulWidget {
  const ArtistryHub({super.key});

  @override
  State<ArtistryHub> createState() => _ArtistryHubState();
}

class _ArtistryHubState extends State<ArtistryHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Artistry Hub")),
      body: const Center(child: Text("Artistry Hub")),
    );
  }
}
