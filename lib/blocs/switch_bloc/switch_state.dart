part of 'switch_bloc.dart';

@immutable
class SwitchState extends Equatable{
  final bool switchValue;

  const SwitchState({required this.switchValue});

  List<Object> get props => [switchValue];

  factory SwitchState.fromMap(Map<String, dynamic> json) {
    return SwitchState(
      switchValue: json["switchValue"].toLowerCase() == false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "switchValue": switchValue,
    };
  }
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required super.switchValue});
}
