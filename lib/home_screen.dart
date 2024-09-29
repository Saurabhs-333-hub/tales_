import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tales/audio_series_slider.dart';
import 'package:tales/hero_carousel_slider.dart';
import 'package:tales/minies_slider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.pink],
                        ).createShader(bounds),
                    child: FittedBox(
                        child: const Text('Tales',
                            style: TextStyle(fontSize: 30)))),
                floating: true,
              ),
            ];
          },
          body: ListView(
            children: [
              const HeroCarouselSlider(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text("Audio Series",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              AudioSeriesSlider(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text("Recommended Minies",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              const MiniesSlider(),
              const SizedBox(
                height: 60,
              )
            ],
          )),
    );
  }
}
