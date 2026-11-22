import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_okey_cesitleri/oyun_okey_cesitleri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('3 çeşit, kimlikler benzersiz, 33 dil', () {
    expect(okeyCesitConfigs.length, 3);
    expect(okeyCesitConfigs.map((c) => c.gameId).toSet().length, 3);
    expect(okeyCesitGroup.title.length, 33);
    for (final c in okeyCesitConfigs) {
      expect(c.title.length, 33);
      expect(c.tagline.length, 33);
      for (final s in c.tutorial) {
        expect(s.text.length, 33);
      }
    }
  });

  for (final rules in okeyCesitRules) {
    test('${rules.gameId}: bölümler kazanılabilir, el sonuna kadar oynanır', () {
      final planner = LevelPlanner(gameId: rules.gameId, optionalMechanics: const []);
      for (final lv in [1, 300, 12345, 49999]) {
        final gl = rules.build(planner.spec(lv));
        expect(gl.validation.ok, isTrue, reason: '${rules.gameId} $lv');
        final end = TableGameRules.simulate(gl.puzzle, quick: true);
        expect(end.over, isTrue);
      }
    });
  }
}
