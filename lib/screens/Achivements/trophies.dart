import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/trophyClass.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:sp_fitness_app/shared/Achievement_database.dart';

List<Trophy> _trophies = [
  Trophy(
    name: 'Completed Tutorial',
    description: 'Finished the app tutorial',
    imageUrl: 'images/earn_asset.png',
  ),
  Trophy(
    name: 'Daily Login',
    description: 'Logged in to the app every day for a week',
    imageUrl: 'images/task_asset.png',
  ),
  Trophy(
    name: 'Feedback Pro',
    description: 'Submitted 10 feedback reports',
    imageUrl: 'images/feedback_asset.png',
  ),
  Trophy(
    name: 'VIP User',
    description: 'Purchased a premium subscription',
    imageUrl: 'images/vip_asset.png',
  ),
  Trophy(
    name: 'Social Media Guru',
    description: 'Shared the app on social media',
    imageUrl: 'images/share_asset.png',
  ),  Trophy(
    name: 'Progress Pal',
    description: 'friend someone',
    imageUrl: 'images/friend_asset.png',
  ),
  Trophy(
    name: 'Motivator',
    description: 'Poke your friends to get them moving 15 times',
    imageUrl: 'images/poke_asset.png',
  ),  
  
];

class TrophiesPage extends StatefulWidget {
  @override
  State<TrophiesPage> createState() => _TrophiesPageState();
}

class _TrophiesPageState extends State<TrophiesPage>
    with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  late AnimationController _controller;
  late Animation<double> _animation;
  Map<String, double> _progressValues =
      {}; // Add a map to store progress values

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 0.25,
    ).animate(_controller);

    // Fetch progress values from Hive database and update the map
    for (var trophy in _trophies) {
      final progress = getAchievementProgress(trophy.name);
      _progressValues[trophy.name] = progress;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasks ',
          style: TextStyle(color: Colors.blueGrey),
        ),
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person, color: Colors.blueGrey),
            label:
                const Text('logout', style: TextStyle(color: Colors.blueGrey)),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _trophies.length,
        itemBuilder: (BuildContext context, int index) {
          final trophy = _trophies[index];
          return GestureDetector(
            onTap: () {
              final currentProgress = getAchievementProgress(trophy.name);
              final animation = Tween<double>(
                begin: currentProgress,
                end: currentProgress + 0.25,
              ).animate(_controller);
              animation.addListener(() {
                setState(() {
                  updateAchievementProgress(trophy.name, animation.value);
                });
              });
              _controller.forward(from: 0.0);
            },
            child: Column(
              children: [
                ListTile(
                  leading: Image(
                    image: AssetImage(trophy.imageUrl),
                    width: 80,
                    height: 80,
                  ),
                  title: Text(trophy.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(trophy.description),
                      const Padding(padding: EdgeInsets.only(bottom: 15)),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SizedBox(
                                height: 8.0,
                                width: 300.0,
                                child: LinearProgressIndicator(
                                  value: getAchievementProgress(trophy.name),
                                  backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color.fromARGB(255, 255, 93, 81)),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                ),
                Divider(thickness: 1.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
