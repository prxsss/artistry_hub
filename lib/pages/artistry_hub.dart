import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:artistry_hub/data/artists.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: ListView.separated(
          itemCount: artists.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: FontAwesomeIcons.pen,
                    label: "Edit",
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Theme.of(context).colorScheme.error,
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
                      image: NetworkImage(artists[index].image),
                    ),
                  ),
                ),
                title: Text(artists[index].name),
                subtitle: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.solidFlag, size: 15),
                    SizedBox(width: 10),
                    Text(artists[index].nationality),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
