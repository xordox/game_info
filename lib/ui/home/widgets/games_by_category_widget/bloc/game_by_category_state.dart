part of 'game_by_category_bloc.dart';

abstract class GameByCategoryState extends Equatable {
  const GameByCategoryState();
  
  @override
  List<Object> get props => [];
}

class GameByCategoryInitial extends GameByCategoryState {}
