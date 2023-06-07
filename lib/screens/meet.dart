import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';


final userID = Random().nextInt(1000).toString();

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: ZegoUIKitPrebuiltVideoConference(
        appID: 724935940, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: "1fb82faccf21e301c2b818bf99ea35f93ca389035d14590a78074407d54033f3",// Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userID,
        userName: 'user_$userID',
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(

        ),
      ),

    );
  }
}