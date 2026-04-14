import '../models/squat_data.dart';

class SquatController {
  int totalReps = 0;
  int goodReps = 0;
  int badReps = 0;

  bool isDown = false;

  void processData(SquatData data) {

    if (data.x < 115 && !isDown) {
      isDown = true;
    }

    if (data.x > 130 && isDown) {
      totalReps++;
      isDown = false;

      if (data.status == "good") {
        goodReps++;
      } else if (data.status == "bad") {
        badReps++;
      }
    }
  }

  double get accuracy {
    if (totalReps == 0) return 0;
    return (goodReps / totalReps) * 100;
  }
}


