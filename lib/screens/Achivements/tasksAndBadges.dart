import 'package:flutter/material.dart';
import 'package:sp_fitness_app/screens/Achivements/achivements.dart';
import 'package:sp_fitness_app/screens/Achivements/trophies.dart';
import 'package:sp_fitness_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_fitness_app/shared/Achievement_database.dart';
import 'package:sp_fitness_app/shared/constants.dart';

class CurrencyScreen extends StatefulWidget {
  CurrencyScreen({Key? key}) : super(key: key);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final AuthService _auth = AuthService();
  bool isEnabledb = false;
  bool isEnableds = false;
  bool isEnabledg = false;
  bool isEnabledp = false;
  int _bprogress = 0;
  int _sprogress = 0;
  int _gprogress = 0;
  int _pprogress = 0;

  @override
  void initState() {
    super.initState();
    _bprogress = getAchievementProgress('Bronze').toInt();
    _sprogress = getAchievementProgress('Silver').toInt();
    _gprogress = getAchievementProgress('Gold').toInt();
    _pprogress = getAchievementProgress('Platinum').toInt();
    int bronzeprogress = getAchievementProgress('Bronze').toInt();
    if (bronzeprogress >= 5) {
      isEnabledb = true;
    }
    int silverprogress = getAchievementProgress('Silver').toInt();
    if (silverprogress >= 5) {
      isEnableds = true;
    }
    int goldprogress = getAchievementProgress('Gold').toInt();
    if (goldprogress >= 5) {
      isEnabledg = true;
    }
    int platinumprogress = getAchievementProgress('Platinum').toInt();
    if (platinumprogress >= 5) {
      isEnabledp = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color containerColorb = isEnabledb ? Colors.grey[200]! : Colors.grey[400]!;
    Color containerColors = isEnableds ? Colors.grey[200]! : Colors.grey[400]!;
    Color containerColorg = isEnabledg ? Colors.grey[200]! : Colors.grey[400]!;
    Color containerColorp = isEnabledp ? Colors.grey[200]! : Colors.grey[400]!;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            '       Achievements',
            style: TextStyle(color: Colors.blueGrey),
          ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     updateAchievementProgress(
      //         'Bronze', getAchievementProgress('Bronze') + 5);
      //     setState(() {
      //       _bprogress = getAchievementProgress('Bronze').toInt();
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('images/bronze_medal.png', height: 40),
                    Text(
                      '$_bprogress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('images/silver_medal.png', height: 40),
                    Text(
                      '$_sprogress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('images/gold_medal.png', height: 40),
                    Text(
                      '$_gprogress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('images/platinum_trophy.png', height: 40,),
                    Text(
                      '$_pprogress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 3.5,
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrophiesPage()),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200]!.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.assignment),
                                  SizedBox(height: 16.0),
                                  Text(
                                    'Tasks',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // handle on tap event
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Achivements(), //Achivements(), TrophiesPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200]!.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.emoji_events),
                                  SizedBox(height: 16.0),
                                  Text(
                                    'Badges',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: isEnabledb
                                ? () {
                                    // handle on tap event
                                    updateAchievementProgress('Bronze',
                                        getAchievementProgress('Bronze') - 5);
                                    updateAchievementProgress('Silver',
                                        getAchievementProgress('Silver') + 1);
                                    setState(() {
                                      _sprogress =
                                          getAchievementProgress('Silver')
                                              .toInt();
                                      _bprogress =
                                          getAchievementProgress('Bronze')
                                              .toInt();
                                      if (getAchievementProgress('Bronze')
                                              .toInt() <=
                                          4) {
                                        isEnabledb = false;
                                      }
                                      if (getAchievementProgress('Silver')
                                              .toInt() <=
                                          4) {
                                        isEnableds = false;
                                      } else {
                                        isEnableds = true;
                                      }
                                  
                                    });
                                  }
                                : null,
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: containerColorb,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.compare_arrows),
                                  SizedBox(height: 16.0),
                                  Text(
                                    'Bronze to Silver Exchange',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: InkWell(
                            onTap: isEnableds
                                ? () {
                                    // handle on tap event
                                    updateAchievementProgress('Silver',
                                        getAchievementProgress('Silver') - 5);
                                    updateAchievementProgress('Gold',
                                        getAchievementProgress('Gold') + 1);
                                    setState(() {
                                      _sprogress =
                                          getAchievementProgress('Silver')
                                              .toInt();
                                      _gprogress =
                                          getAchievementProgress('Gold')
                                              .toInt();
                                      if (getAchievementProgress('Silver')
                                              .toInt() <=
                                          4) {
                                        isEnableds = false;
                                      } else {
                                        isEnableds = true;
                                      }
                                      if (getAchievementProgress('Gold')
                                              .toInt() <=
                                          4) {
                                        isEnabledg = false;
                                      } else {
                                        isEnabledg = true;
                                      }
                                     
                                    });
                                  }
                                : null,
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: containerColors,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.compare_arrows),
                                  SizedBox(height: 16.0),
                                  Text(
                                    'Silver to Gold Exchange',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 16.0),
                Expanded(
                  child: InkWell(
                    onTap: isEnabledg
                        ? () {
                            // handle on tap event
                            updateAchievementProgress(
                                'Gold', getAchievementProgress('Gold') - 5);
                            updateAchievementProgress('Platinum',
                                getAchievementProgress('Platinum') + 1);
                            setState(() {
                              _gprogress =
                                  getAchievementProgress('Gold').toInt();
                              _pprogress =
                                  getAchievementProgress('Platinum').toInt();
                              if (getAchievementProgress('Gold').toInt() <= 4) {
                                isEnabledg = false;
                              }
                              if (getAchievementProgress('Platinum').toInt() <=
                                  4) {
                                isEnabledp = false;
                              } else {
                                isEnabledp = true;
                              }
                            
                            });
                          }
                        : null,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: containerColorg,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.compare_arrows),
                          SizedBox(height: 16.0),
                          Text(
                            'Gold to Platinum Exchange',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              clearHiveBox();
            },
            child: Text('Clear Trophy/Achieve Values'),
          ),
        ],
      ),
    );
  }
}
