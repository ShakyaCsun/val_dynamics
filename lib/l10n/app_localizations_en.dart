// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get agents => 'Agents';

  @override
  String nAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 agent',
      zero: 'No agents',
      other: '$count agents',
    );
    return '$_temp0';
  }

  @override
  String equalPoints(double count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'each with $countString points';
  }

  @override
  String nearlyEqualPoints(double count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'each with around $countString points';
  }

  @override
  String differentPointsRange(int count, double low, double high) {
    final intl.NumberFormat lowNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String lowString = lowNumberFormat.format(low);
    final intl.NumberFormat highNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String highString = highNumberFormat.format(high);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count different points from $lowString to $highString',
    );
    return '$_temp0';
  }

  @override
  String get defaultLabel => 'Default';

  @override
  String get builtIn => 'Built-in';

  @override
  String get agentsStats => 'Agents Stats';

  @override
  String get addAgents => 'Add Agents';

  @override
  String get addMatches => 'Add Matches';

  @override
  String get rosterNameLabel => 'Roster Name';

  @override
  String get emptyRosterNameError => 'Roster Name cannot be empty.';

  @override
  String get selectJsonFile => 'Select a JSON file';

  @override
  String get selectJsonFilePlease => 'Please select a JSON file';

  @override
  String get importAgentsJson => 'Import Agents JSON';

  @override
  String get importAgentsHelp => 'Copy one of the JSON samples to create your own agents rating JSON file. Importing Agents is temporary (for now) and does not leave your browser.';

  @override
  String get copyMinAgentsSample => 'Copy minimal Agents JSON';

  @override
  String get copyMinAgentsHelp => 'Copies a JSON sample with minimum required fields to the clipboard.';

  @override
  String get copyAgentsSample => 'Copy Agents JSON';

  @override
  String get copyAgentsHelp => 'Copies a JSON sample with all the fields for agents ratings to the clipboard.';

  @override
  String get agentsCopiedMessage => 'Sample Agents JSON copied to clipboard';

  @override
  String get addAgentRatings => 'Add Agents Ratings';

  @override
  String get invalidAgentsFormat => 'The selected file is likely invalid. Please try again. Copy the samples if necessary';

  @override
  String get invalidForm => 'Invalid Form Data';

  @override
  String get unknownError => 'Unknown Error Occurred';

  @override
  String agentsAdded(String name) {
    return 'Agent Ratings added successfully as \'$name\'.';
  }

  @override
  String get downloadAgentsSampleMin => 'Download Agents CSV (min)';

  @override
  String get downloadAgentsSample => 'Download Agents CSV';

  @override
  String get matchesCollectionNameLabel => 'Event/Collection Name';

  @override
  String get emptyMatchesCollectionNameError => 'Event/Collection Name cannot be empty';

  @override
  String get selectRibMatchesCsv => 'Select a csv file with matches from Run it Back(rib.gg)';

  @override
  String get pleaseSelectRibMatchesCsv => 'Please select a csv file with matches from Run it Back(rib.gg)';

  @override
  String get importMatchesCsv => 'Import Matches CSV';

  @override
  String get invalidMatchesCsvError => 'The selected matches CSV is invalid. Please check the csv and ensure the csv has same format as output of rib matches.';

  @override
  String matchesAdded(String csvFile, String name) {
    return 'The matches from $csvFile was successfully added as $name.';
  }

  @override
  String get rosterName => 'Roster Name';

  @override
  String get saveLabel => 'Save';

  @override
  String get comps => 'Comps';

  @override
  String compsStyleDescription(int compsCount, int stylesCount) {
    String _temp0 = intl.Intl.pluralLogic(
      compsCount,
      locale: localeName,
      one: 'Single Comp',
      zero: 'No Comps',
      other: '$compsCount Comps',
    );
    String _temp1 = intl.Intl.pluralLogic(
      stylesCount,
      locale: localeName,
      one: 'singular Style',
      other: '$stylesCount different styles',
    );
    return '$_temp0 of $_temp1';
  }

  @override
  String nCompsOfStyle(int count, String style) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 Comp',
      zero: 'No Comps',
      other: '$count Comps',
    );
    return '$_temp0 of $style style';
  }

  @override
  String nCompsOfDifferentStyle(int count, int styleCount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 Comp',
      zero: 'No Comps',
      other: '$count Comps',
    );
    String _temp1 = intl.Intl.pluralLogic(
      styleCount,
      locale: localeName,
      one: 'single style',
      other: '$styleCount different styles',
    );
    return '$_temp0 of $_temp1';
  }

  @override
  String get noCompsForFilter => 'No Comps matching selected filters. Try Resetting';

  @override
  String nDifferentComps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Single Comp',
      zero: 'No comps',
      other: '$count different Comps',
    );
    return '$_temp0';
  }

  @override
  String styledComps(String style) {
    return '$style Comps';
  }

  @override
  String get filters => 'Filters';

  @override
  String get resetFilters => 'Reset Filters';

  @override
  String get compositions => 'Compositions';

  @override
  String get matches => 'Matches';

  @override
  String get matchesTitle => 'Matches Database';

  @override
  String nMatches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'A single match',
      zero: 'No Matches',
      other: '$count Matches',
    );
    return '$_temp0';
  }

  @override
  String get mapSelect => 'Select Maps';

  @override
  String get excludeMatches => 'Exclude Matches';

  @override
  String get sameStyles => 'Styles';

  @override
  String get sameComps => 'Comps';

  @override
  String get excludeNone => 'None';

  @override
  String get selectAcmLabel => 'Choose an ACM value';

  @override
  String get statsLabel => 'Stats';

  @override
  String get synergiesLabel => 'Synergies';

  @override
  String get viewMatches => 'View Matches';

  @override
  String noMatchesForCollection(String collectionName) {
    return '$collectionName Matches is Empty';
  }

  @override
  String get backButtonLabel => 'Go Back';

  @override
  String statsFor(String collectionName) {
    return '$collectionName Stats';
  }

  @override
  String get attack => 'Attack';

  @override
  String get defense => 'Defense';

  @override
  String get overallScore => 'Overall Score';

  @override
  String get attackScore => 'Attack Score';

  @override
  String get defenseScore => 'Defense Score';

  @override
  String winRatePercent(double winRate) {
    final intl.NumberFormat winRateNumberFormat = intl.NumberFormat.decimalPercentPattern(
      locale: localeName,
      decimalDigits: 2
    );
    final String winRateString = winRateNumberFormat.format(winRate);

    return '$winRateString';
  }

  @override
  String styledMatches(String style) {
    return '$style Matches';
  }

  @override
  String stylisticMatchupLabel(String styleA, String styleB) {
    return '$styleA vs $styleB Matches';
  }

  @override
  String veryPositiveWinRate(String styleA, String styleB) {
    return '$styleA beats $styleB heavily';
  }

  @override
  String positiveWinRate(String styleA, String styleB) {
    return '$styleA beats $styleB';
  }

  @override
  String tiedWinRate(String styleA, String styleB) {
    return '$styleA is tied against $styleB';
  }

  @override
  String negativeWinRate(String styleA, String styleB) {
    return '$styleA loses to $styleB';
  }

  @override
  String veryNegativeWinRate(String styleA, String styleB) {
    return '$styleA loses heavily to $styleB';
  }

  @override
  String get statsForCurrentStyle => 'You are looking at stats for this style';

  @override
  String nMirrorStyledMatches(int matchesCount) {
    return '$matchesCount mirror styled matches';
  }

  @override
  String collectionSynergiesTitle(String collectionName) {
    return '$collectionName Agent Combo Synergies';
  }

  @override
  String get synergiesTooltip => 'Agent combo synergies';

  @override
  String comboMatchesTitle(String collectionName, String comboName) {
    return '$collectionName Matches for $comboName';
  }

  @override
  String noComboMatches(String comboName) {
    return 'No matches for $comboName with selected filters';
  }

  @override
  String get comboNonMirrorCriteria => 'Non-Mirror Criteria';

  @override
  String get soloCriteriaTooltip => 'Removes matches where either agent appears on the opposing team';

  @override
  String get compositeCriteriaTooltip => 'Only removes matches where both agents appear on the opposing team';

  @override
  String get winRateFilter => 'Win Rates';

  @override
  String get winningFilterTooltip => 'Only shows Combos with WR >= 50%';

  @override
  String get losingFilterTooltip => 'Only shows Combos with WR < 50%';

  @override
  String get allCombosFilterTooltip => 'Shows All Combos with valid WR';

  @override
  String get roleComboFilter => 'Role Combos';

  @override
  String get table => 'Table';

  @override
  String get triangle => 'Triangle';

  @override
  String get versusLabel => 'vs';

  @override
  String get viewSource => 'View Source Code';
}
