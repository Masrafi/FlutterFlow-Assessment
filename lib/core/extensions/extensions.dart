extension CalorieExtension on String {
  double calculateCalories({
    required double weightKg,
    required double heightCm,
    required int age,
  }) {
    final gender = toLowerCase().trim();

    if (gender == 'male') {
      return 666.47 + (13.75 * weightKg) + (5 * heightCm) - (6.75 * age);
    } else if (gender == 'female') {
      return 655.1 + (9.56 * weightKg) + (1.85 * heightCm) - (4.67 * age);
    } else {
      throw ArgumentError('Invalid gender: must be "male" or "female"');
    }
  }
}
