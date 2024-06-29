import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Dashboard/tiles.dart';
import 'package:to_do/Do%20It/pages/to_do.dart';
import 'package:to_do/Notes/Models/note_data.dart';
import 'package:to_do/Notes/pages/notes_home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .colorScheme
          .primary, // Set your desired background color here
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .primary, // Set app bar color to match the background
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Your Tools",
                style: GoogleFonts.bebasNeue(
                  fontSize: 50,
                  // color: Colors.white, // Set text color
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .background, // Set background color for the body
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.only(top: 50),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  CustomTile(
                    tileData: TileData(
                      name: "Do it",
                      imagePath: 'assets/to-do-list.png',
                      page: const ToDo_HomePage(),
                    ),
                  ),
                  CustomTile(
                    tileData: TileData(
                      name: "Notes",
                      imagePath: 'assets/paper.png',
                      page: ChangeNotifierProvider(
                        create: (context) => NoteData(),
                        builder: (context, child) => const notes(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
