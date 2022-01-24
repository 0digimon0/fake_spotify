import 'package:fake_spotify/presentation/blocs/app/audio_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudioControlView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AudioControlState();
}

class AudioControlState extends State<AudioControlView> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.brown,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Loc dinh ky",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("SOURCE CORE MINI",
                      style: TextStyle(fontSize: 15, color: Colors.green)),
                ],
              )),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.headset_mic_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (isPlaying) {
                      debugPrint(
                          "AudioControlView press current state is playing");
                      // BlocProvider.of(context).emit(PauseEvent());
                      context.read<AudioBloc>().add(PauseEvent());
                    } else {
                      debugPrint(
                          "AudioControlView press current state is pause");
                      // BlocProvider.of(context).emit(PlayEvent());
                      context.read<AudioBloc>().add(PlayEvent());
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  }),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              value: 0.23,
            ),
          )
        ],
      ),
    );
  }
}
