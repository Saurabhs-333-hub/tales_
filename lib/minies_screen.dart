import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tales/constants.dart';

class MiniesScreen extends ConsumerStatefulWidget {
  const MiniesScreen({super.key});

  @override
  ConsumerState createState() => _MiniesScreenState();
}

class _MiniesScreenState extends ConsumerState<MiniesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.pink],
                  ).createShader(bounds),
              child: FittedBox(
                  child: const Text('Minies', style: TextStyle(fontSize: 25)))),
          actions: []),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [];
          },
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Card(
                    surfaceTintColor: Colors.grey,
                    child: SizedBox(
                        width: contextWidth(context, 1),
                        height: contextHeight(context, 1)),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    right: 15,
                    child: Container(
                      // width: 200,
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 2.0),
                            child: Icon(IconlyLight.play),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Text(
                                "The latest story of the week",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  height: 0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: 5,
            scrollDirection: Axis.vertical,
          )),
    );
  }
}
