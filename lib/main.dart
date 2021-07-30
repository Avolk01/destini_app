import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ChoiceButton.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StoryBrain>(
      create: (context) => StoryBrain(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: StoryPage(),
      ),
    );
  }
}

class StoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    context.watch<StoryBrain>().getStory().storyTitle,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              ChoiceButton.red(
                context.watch<StoryBrain>().getStory().choice1,
                () => context.read<StoryBrain>().nextStory(1),
              ),
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: context.read<StoryBrain>().buttonShouldBeVisible(),
                child: ChoiceButton.green(
                  context.watch<StoryBrain>().getStory().choice2,
                  () => context.read<StoryBrain>().nextStory(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
