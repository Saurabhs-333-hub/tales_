import 'package:cached_network_image/cached_network_image.dart';
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
  ScrollController? _scrollController;
  bool _showGoToTopButton = false;
  double _titleOpacity = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.position.maxScrollExtent > 0 &&
          _scrollController!.position.pixels > 0) {
        setState(() {
          _showGoToTopButton = true;
        });
      } else {
        setState(() {
          _showGoToTopButton = false;
        });
      }
      setState(() {
        if (_scrollController!.position.pixels > 170) {
          _titleOpacity = 1.0;
        } else {
          _titleOpacity = _scrollController!.position.pixels / 170;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showGoToTopButton
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                _scrollController!.animateTo(0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              child: Icon(IconlyLight.arrow_up_circle),
            )
          : null,
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white.withOpacity(_titleOpacity),
                  ),
                ),
                backgroundColor: Colors.black,
                clipBehavior: Clip.antiAlias,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                flexibleSpace: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FlexibleSpaceBar(
                    background: Container(
                      // clipBehavior: Clip.antiAlias,
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
                      child: ListView(
                        padding: EdgeInsets.only(
                          top: 70,
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        // backgroundColor: Colors.transparent,
                                        radius: 45,
                                        backgroundImage: CachedNetworkImageProvider(
                                            "https://images.unsplash.com/photo-1725582203083-c4a7efb62a5e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                            scale: 1.0,
                                            maxWidth: 1000,
                                            maxHeight: 1000),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Followers",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "100",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Following",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "100",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "John Doe",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                // width: 100,
                                height: 30,
                                child: _showEditProfile
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade900,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Text("Edit"),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          // color: Color(0xFF1B30B2),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xFF1B30B2),
                                                blurRadius: 7,
                                                spreadRadius: -2,
                                                offset: Offset(0, 0))
                                          ],
                                          border: Border.all(
                                              color: Color(0xFF1B30B2),
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Text("Follow"),
                                      ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Text("Insights"),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Text("Message"),
                              ),
                            ],
                          ),
                        ],
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
