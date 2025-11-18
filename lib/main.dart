import 'package:flutter/material.dart';

enum Season {
  spring('assets/spring.jpg', 'Spring'),
  summer('assets/summer.jpg', 'Summer'),
  fall('assets/fall.jpg', 'Fall'),
  winter('assets/winter.jpg', 'Winter');

  final String assetPath;
  final String displayName;

  const Season(this.assetPath, this.displayName);
}

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: Seasons()),
);

class Seasons extends StatelessWidget {
  const Seasons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("SEASONS", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            SeasonCard(countryName: "FRANCE", startSeason: Season.winter),
            SeasonCard(countryName: "CAMBODIA", startSeason: Season.summer),
          ],
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  final String countryName;
  final Season startSeason;

  const SeasonCard({
    super.key,
    required this.countryName,
    required this.startSeason,
  });

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late Season currentSeason;

  @override
  void initState() {
    super.initState();
    currentSeason = widget.startSeason;
  }

  void toggleSeason() {
    setState(() {
      switch (currentSeason) {
        case Season.spring:
          currentSeason = Season.summer;
          break;
        case Season.summer:
          currentSeason = Season.fall;
          break;
        case Season.fall:
          currentSeason = Season.winter;
          break;
        case Season.winter:
          currentSeason = Season.spring;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 100,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26, width: 2),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: toggleSeason,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(currentSeason.assetPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

              Text(
                widget.countryName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}