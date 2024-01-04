part of 'switch_bloc.dart';

@immutable
abstract class SwitchEvent {}

class SwitchOnEvent extends SwitchEvent{}
class SwitchOffEvent extends SwitchEvent{}