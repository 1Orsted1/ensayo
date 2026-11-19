const int minGoal = 5;
const int maxGoal = 240;
const int goalStep = 5;
const int defaultGoal = 60;

int clampGoal(int minutes) => minutes.clamp(minGoal, maxGoal);
