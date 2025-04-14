import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Agent NMRWR', () {
    test('is same for getAgentNmrwr and getAllAgentNmrwr', () {
      final allAgentsNmrwr = valorantMatchesSample.getAllAgentNmrwr();
      final allAgentsNmrwrIndividually = {
        for (final agent in allAgentsNmrwr.keys)
          agent: valorantMatchesSample.getAgentNmrwr(agent),
      };
      expect(allAgentsNmrwr, allAgentsNmrwrIndividually);
    });
  });
}
