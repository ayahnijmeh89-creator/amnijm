class SquatData {
  final int x;
  final int y;
  final String status;

  SquatData({
    required this.x,
    required this.y,
    required this.status,
  });

  factory SquatData.fromJson(Map<String, dynamic> json) {
    return SquatData(
      x: json['x'],
      y: json['y'],
      status: json['status'],
    );
  }
}


