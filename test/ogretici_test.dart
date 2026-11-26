import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_okey_cesitleri/oyun_okey_cesitleri.dart';

void main() {
  test('ana ekranda öğretici mod kartı (33 dil)', () {
    expect(okeyEsliConfig.extraModes.single.id, 'ogretici');
    expect(okeyEsliConfig.extraModes.single.title.length, 33);
    expect(okeyKatlamaliConfig.extraModes.single.id, 'ogretici');
    expect(okeyKatlamaliConfig.extraModes.single.title.length, 33);
    expect(okeyIkiConfig.extraModes.single.id, 'ogretici');
    expect(okeyIkiConfig.extraModes.single.title.length, 33);
  });
}
