import 'package:artistry_hub/models/artist.dart';
import 'package:artistry_hub/pages/add_artist_page.dart';
import 'package:artistry_hub/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtistryHub extends StatefulWidget {
  const ArtistryHub({super.key});

  @override
  State<ArtistryHub> createState() => _ArtistryHubState();
}

class _ArtistryHubState extends State<ArtistryHub> {
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Artistry Hub")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            StreamBuilder(
              stream: _databaseService.getArtists(),
              builder: (context, snapshot) {
                List artists = snapshot.data?.docs ?? [];
                if (artists.isEmpty) {
                  return const Center(child: Text("No artists found"));
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: artists.length,
                  itemBuilder: (context, index) {
                    String artistId = artists[index].id;
                    Artist artist = artists[index].data();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              icon: FontAwesomeIcons.pen,
                              label: "Edit",
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                displayDeleteConfirmationDialog(
                                  context,
                                  artist,
                                  artistId,
                                );
                              },
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                              icon: FontAwesomeIcons.trash,
                              label: "Delete",
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(artist.image),
                              ),
                            ),
                          ),
                          title: Text(artist.name),
                          subtitle: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.solidFlag, size: 15),
                              SizedBox(width: 10),
                              Text(artist.nationality),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddArtistPage()),
          );
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }

  Future<dynamic> displayDeleteConfirmationDialog(
    BuildContext context,
    Artist artist,
    String artistId,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Artist', style: TextStyle(fontSize: 18)),
          content: Text(
            'Are you sure you want to delete the artist ${artist.name}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _databaseService.deleteArtist(artistId);
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
