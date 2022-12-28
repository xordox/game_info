part of 'all_games_bloc.dart';

abstract class AllGamesState extends Equatable {
  const AllGamesState();
  
  @override
  List<Object> get props => [];
}

class AllGamesInitial extends AllGamesState {}
