import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yilan_io/oyun_yilan_io.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yilanioConfig.title.length, 33);
    expect(yilanioConfig.tagline.length, 33);
    for (final s in yilanioConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yilanioRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yilanioId, optionalMechanics: yilanioRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yilanioRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
