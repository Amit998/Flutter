import 'package:flutter/material.dart';
import 'package:insta_stories/models/stories.dart';

class StoryScreen extends StatefulWidget {
  final Story stories;

  const StoryScreen({Key key, this.stories}) : super(key: key);
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
