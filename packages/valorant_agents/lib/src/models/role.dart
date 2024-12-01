enum Role {
  duelist('Duelist'),
  initiator('Initiator'),
  sentinel('Sentinel'),
  controller('Controller'),
  unknown('Unknown');

  const Role(this.value);

  factory Role.fromJson(String json) {
    return switch (json.toLowerCase()) {
      'duelist' => Role.duelist,
      'initiator' => Role.initiator,
      'sentinel' => Role.sentinel,
      'controller' => Role.controller,
      _ => Role.unknown
    };
  }

  final String value;

  String toJson() {
    return value;
  }
}
