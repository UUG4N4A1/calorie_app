class CaloriesData {
  // Method to calculate the average of last week's calories
  static double calculateAverage(List<int> lastWeekCalories) {
    return lastWeekCalories.reduce((a, b) => a + b) / lastWeekCalories.length;
  }
}
