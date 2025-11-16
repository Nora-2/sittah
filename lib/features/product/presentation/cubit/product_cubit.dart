class ProductState {
  final Map<String, String> values;
  final String? activePickerKey;

  ProductState({
    this.values = const {},
    this.activePickerKey,
  });

  ProductState copyWith({
    Map<String, String>? values,
    String? activePickerKey,
    bool clearPicker = false,
  }) {
    return ProductState(
      values: values ?? this.values,
      activePickerKey: clearPicker ? null : (activePickerKey ?? this.activePickerKey),
    );
  }
}
