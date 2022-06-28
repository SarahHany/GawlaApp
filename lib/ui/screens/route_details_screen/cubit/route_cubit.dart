import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteInitial());
  static RouteCubit get(context)=>BlocProvider.of(context);

  final player = AudioPlayer();
  bool isPlaying = false;

  void playSound(){
    if(isPlaying){
      player.pause();
      this.isPlaying = !isPlaying;
      emit(ChangeSound());
    }
    else{
      player.play(UrlSource(
          "https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/py.mp3?alt=media&token=08b31eec-91e2-49b8-b926-7c11981a2d67"));
      this.isPlaying = !isPlaying;
      emit(ChangeSound());
    }
  }
}
