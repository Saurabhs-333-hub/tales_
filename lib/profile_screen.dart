import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool _showEditProfile = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                clipBehavior: Clip.antiAlias,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                title: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.pink],
                        ).createShader(bounds),
                    child: FittedBox(
                        child: const Text('You',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 30)))),
                flexibleSpace: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FlexibleSpaceBar(
                    background: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            blurRadius: 100,
                            spreadRadius: 10,
                            offset: Offset(-50, -50),
                          ),
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.2),
                            blurRadius: 100,
                            spreadRadius: 10,
                            offset: Offset(-50, -50),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(1),
                            blurRadius: 100,
                            spreadRadius: 100,
                            offset: Offset(0, 300),
                          ),
                        ],
                        // borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                expandedHeight: 300,
                pinned: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyLight.setting),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          text: "Series",
                        ),
                        Tab(
                          text: "Minies",
                        ),
                        Tab(
                          text: "Lives",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Center(
            child: Text("Profile"),
          )),
    );
  }
}
