import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zplayer/player_observer.dart';
import 'package:flutter_zplayer/player_state.dart';
import 'package:flutter_zplayer/video.dart';
import 'package:flutter_zplayer/video.dart';
class Player extends StatefulWidget {
  Player({Key key,})
      : super(key: key);

  @override
  _VideoPlayoutState createState() => _VideoPlayoutState();
}

class _VideoPlayoutState extends State<Player>
    with PlayerObserver,WidgetsBindingObserver {
  MethodChannel _methodChannel;
  Future _switchOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight
    ]).then((_) async {
      // startSecureFlag(true);
      await SystemChrome.setEnabledSystemUIOverlays([]);
      setState(() {

      });
    });

  }
//  Future startSecureFlag(bool status) async {
//    if(platformSecure!=null) {
//      await platformSecure.invokeMethod(status ? 'on' : 'off');
//    }
//  }
  @override
  void initState() {
    super.initState();
       WidgetsBinding.instance.addObserver(this);
    _switchOrientation();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }


  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: <Widget>[

        Video(
          autoPlay: true,
          showControls:true,
          preferredAudioLanguage: "eng",
          isLiveStream: true,
          position: 0,
          url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8",
          onViewCreated: _onViewCreated,
          desiredState: PlayerState.PLAYING,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            child:Icon(Icons.close, size: 30, color: Colors.white,) ,
            onTap: () async {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
                  .then((_) async {
            //     startSecureFlag(false);
                 await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                 Navigator.pop(context);
              });
            },
          ),
        ),
      ],
    );
  }


  void _onViewCreated(int viewId) {
    listenForVideoPlayerEvents(viewId);
    _methodChannel =
        MethodChannel("zplayer/NativeVideoPlayerMethodChannel_$viewId");
  }


  @override
  void onPlay() {
    // TODO: implement onPlay
    super.onPlay();
  }

}