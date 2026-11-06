import '../dominio/excepciones.dart';

/// Las claves NUNCA se escriben en el código. Entran al compilar:
///   flutter run --dart-define=NASA_API_KEY=tu_clave
///   flutter run --dart-define-from-file=secrets.json
class ConfigClaves {
  final String nasa;
  const ConfigClaves({required this.nasa});

  factory ConfigClaves.desdeEntorno() => const ConfigClaves(
        nasa: String.fromEnvironment('NASA_API_KEY', defaultValue: 'DEMO_KEY'),
      );

  bool get usaClaveDemo => nasa == 'DEMO_KEY';

  void validar() {
    if (nasa.trim().isEmpty) throw const ClaveFaltanteException('NASA_API_KEY');
  }

  @override
  String toString() => 'ConfigClaves(nasa: ${_ocultar(nasa)})';

  static String _ocultar(String s) =>
      s.length <= 4 ? '****' : '${s.substring(0, 2)}***${s.substring(s.length - 2)}';
}