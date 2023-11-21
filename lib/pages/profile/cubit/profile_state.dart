part of 'profile_cubit.dart';

 class ProfileState extends Equatable {
  final String name;

  const ProfileState({ this.name = ''});

  @override
  List<Object> get props => [name];

  
}

class SetName extends ProfileState{
  const SetName ({super.name});
}