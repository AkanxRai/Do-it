import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TileData {
  final String name;
  final String imagePath;
  final Widget page;

  TileData({
    required this.name,
    required this.imagePath,
    required this.page,
  });
}

class CustomTile extends StatelessWidget {
  final TileData tileData;

  const CustomTile({super.key, required this.tileData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(8),
          
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => tileData.page,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    tileData.imagePath,
                  ),
                ),
              ),
              Text(tileData.name, style: GoogleFonts.bebasNeue(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
