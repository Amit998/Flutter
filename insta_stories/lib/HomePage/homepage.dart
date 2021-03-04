import 'package:flutter/material.dart';
import 'package:insta_stories/HomePage/storyScreen.dart';
import 'package:insta_stories/data.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StoryScreen(
      stories: stories,
    );
  }
}
