class CountryCode {
  final String name;
  final String dialCode;
  final String code; // ISO country code
  final String flag;

  const CountryCode({
    required this.name,
    required this.dialCode,
    required this.code,
    required this.flag,
  });
}

// List of countries
final List<CountryCode> countries = [
  CountryCode(name: 'السعودية', dialCode: '+966', code: 'SA', flag: '🇸🇦'),
  CountryCode(name: 'مصر', dialCode: '+20', code: 'EG', flag: '🇪🇬'),
  CountryCode(name: 'الإمارات', dialCode: '+971', code: 'AE', flag: '🇦🇪'),
  CountryCode(name: 'الكويت', dialCode: '+965', code: 'KW', flag: '🇰🇼'),
  CountryCode(name: 'البحرين', dialCode: '+973', code: 'BH', flag: '🇧🇭'),
  CountryCode(name: 'قطر', dialCode: '+974', code: 'QA', flag: '🇶🇦'),
  CountryCode(name: 'عمان', dialCode: '+968', code: 'OM', flag: '🇴🇲'),
  CountryCode(name: 'الأردن', dialCode: '+962', code: 'JO', flag: '🇯🇴'),
  CountryCode(name: 'لبنان', dialCode: '+961', code: 'LB', flag: '🇱🇧'),
];