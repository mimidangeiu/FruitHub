class UserState {
  final String name;

  const UserState({required this.name});

  UserState copyWith({String? name}) {
    return UserState(name: name ?? this.name);
  }
}
