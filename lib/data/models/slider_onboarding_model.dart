class SliderOnboarding {
  const SliderOnboarding({
    this.bold = '',
    this.label = '',
    this.topImage = '',
  });

  final String bold;
  final String label;
  final String topImage;

  SliderOnboarding copyWith({
    String? bold,
    String? label,
    String? topImage,
  }) {
    return SliderOnboarding(
      bold: bold ?? this.bold,
      label: label ?? this.label,
      topImage: topImage ?? this.topImage,
    );
  }
}
