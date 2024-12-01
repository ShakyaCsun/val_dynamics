import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// Agents label
  ///
  /// In en, this message translates to:
  /// **'Agents'**
  String get agents;

  /// Number of Agents
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} agents} zero{No agents} one{1 agent}}'**
  String nAgents(int count);

  /// Equal points
  ///
  /// In en, this message translates to:
  /// **'each with {count} points'**
  String equalPoints(double count);

  /// Nearly equal points
  ///
  /// In en, this message translates to:
  /// **'each with around {count} points'**
  String nearlyEqualPoints(double count);

  /// Different points range
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} different points from {low} to {high}}}'**
  String differentPointsRange(int count, double low, double high);

  /// The label for Default Roster
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultLabel;

  /// The label for Built-in Rosters
  ///
  /// In en, this message translates to:
  /// **'Built-in'**
  String get builtIn;

  /// The label for Agents Stats button
  ///
  /// In en, this message translates to:
  /// **'Agents Stats'**
  String get agentsStats;

  /// Add agents
  ///
  /// In en, this message translates to:
  /// **'Add Agents'**
  String get addAgents;

  /// Add matches
  ///
  /// In en, this message translates to:
  /// **'Add Matches'**
  String get addMatches;

  /// Roster name label
  ///
  /// In en, this message translates to:
  /// **'Roster Name'**
  String get rosterNameLabel;

  /// The error text if Roster Name is left empty.
  ///
  /// In en, this message translates to:
  /// **'Roster Name cannot be empty.'**
  String get emptyRosterNameError;

  /// Select json file
  ///
  /// In en, this message translates to:
  /// **'Select a JSON file'**
  String get selectJsonFile;

  /// Select json file please
  ///
  /// In en, this message translates to:
  /// **'Please select a JSON file'**
  String get selectJsonFilePlease;

  /// The label for button to import agents JSON file
  ///
  /// In en, this message translates to:
  /// **'Import Agents JSON'**
  String get importAgentsJson;

  /// Help Text describing how to create and import Agents JSON
  ///
  /// In en, this message translates to:
  /// **'Copy one of the JSON samples to create your own agents rating JSON file. Importing Agents is temporary (for now) and does not leave your browser.'**
  String get importAgentsHelp;

  /// The label for button to copy minimal agents sample.
  ///
  /// In en, this message translates to:
  /// **'Copy minimal Agents JSON'**
  String get copyMinAgentsSample;

  /// Help text for what copyMinAgentsSample does
  ///
  /// In en, this message translates to:
  /// **'Copies a JSON sample with minimum required fields to the clipboard.'**
  String get copyMinAgentsHelp;

  /// The label for button to copy agents sample
  ///
  /// In en, this message translates to:
  /// **'Copy Agents JSON'**
  String get copyAgentsSample;

  /// Copy agents help
  ///
  /// In en, this message translates to:
  /// **'Copies a JSON sample with all the fields for agents ratings to the clipboard.'**
  String get copyAgentsHelp;

  /// Add agent ratings
  ///
  /// In en, this message translates to:
  /// **'Add Agents Ratings'**
  String get addAgentRatings;

  /// The error text for invalid agents format.
  ///
  /// In en, this message translates to:
  /// **'The selected file is likely invalid. Please try again. Copy the samples if necessary'**
  String get invalidAgentsFormat;

  /// Agents added
  ///
  /// In en, this message translates to:
  /// **'Agent Ratings added successfully as \'{name}\'.'**
  String agentsAdded(String name);

  /// The label for button that downloads minimal agents CSV
  ///
  /// In en, this message translates to:
  /// **'Download Agents CSV (min)'**
  String get downloadAgentsSampleMin;

  /// The label for button that downloads sample agents CSV
  ///
  /// In en, this message translates to:
  /// **'Download Agents CSV'**
  String get downloadAgentsSample;

  /// The label for matches collection name
  ///
  /// In en, this message translates to:
  /// **'Event/Collection Name'**
  String get matchesCollectionNameLabel;

  /// The error text for when matches collection name is left empty
  ///
  /// In en, this message translates to:
  /// **'Event/Collection Name cannot be empty'**
  String get emptyMatchesCollectionNameError;

  /// The label for Select rib matches csv
  ///
  /// In en, this message translates to:
  /// **'Select a csv file with matches from Run it Back(rib.gg)'**
  String get selectRibMatchesCsv;

  /// The label for Select rib matches csv
  ///
  /// In en, this message translates to:
  /// **'Please select a csv file with matches from Run it Back(rib.gg)'**
  String get pleaseSelectRibMatchesCsv;

  /// The label for button to import CSV files
  ///
  /// In en, this message translates to:
  /// **'Import Matches CSV'**
  String get importMatchesCsv;

  /// Invalid matches csv error
  ///
  /// In en, this message translates to:
  /// **'The selected matches CSV is invalid. Please check the csv and ensure the csv has same format as output of rib matches.'**
  String get invalidMatchesCsvError;

  /// Matches added
  ///
  /// In en, this message translates to:
  /// **'The matches from {csvFile} was successfully added as {name}.'**
  String matchesAdded(String csvFile, String name);

  /// The label for Agents Roster Name input
  ///
  /// In en, this message translates to:
  /// **'Roster Name'**
  String get rosterName;

  /// The label for Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveLabel;

  /// The label for comps/compositions
  ///
  /// In en, this message translates to:
  /// **'Comps'**
  String get comps;

  /// Comps style description
  ///
  /// In en, this message translates to:
  /// **'{compsCount, plural, other{{compsCount} Comps} zero{No Comps} one{Single Comp}} of {stylesCount, plural, other{{stylesCount} different styles} one{singular Style}}'**
  String compsStyleDescription(int compsCount, int stylesCount);

  /// N comps of style
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} Comps} zero{No Comps} one{1 Comp}} of {style} style'**
  String nCompsOfStyle(int count, String style);

  /// N comps of style
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} Comps} zero{No Comps} one{1 Comp}} of {styleCount, plural, other{{styleCount} different styles} one{single style}}'**
  String nCompsOfDifferentStyle(int count, int styleCount);

  /// The message shown when no comps match selected filter
  ///
  /// In en, this message translates to:
  /// **'No Comps matching selected filters. Try Resetting'**
  String get noCompsForFilter;

  /// N different comps
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} different Comps} zero{No comps} one{Single Comp}}'**
  String nDifferentComps(int count);

  /// The label for Compositions of given style
  ///
  /// In en, this message translates to:
  /// **'{style} Comps'**
  String styledComps(String style);

  /// The label for filters button
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// Reset filters
  ///
  /// In en, this message translates to:
  /// **'Reset Filters'**
  String get resetFilters;

  /// The label for compositions header
  ///
  /// In en, this message translates to:
  /// **'Compositions'**
  String get compositions;

  /// Matches
  ///
  /// In en, this message translates to:
  /// **'Matches'**
  String get matches;

  /// The title of the Matches list page
  ///
  /// In en, this message translates to:
  /// **'Matches Database'**
  String get matchesTitle;

  /// N matches
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} Matches} zero{No Matches} one{A single match}}'**
  String nMatches(int count);

  /// Map select label
  ///
  /// In en, this message translates to:
  /// **'Select Maps'**
  String get mapSelect;

  /// Exclude matches label
  ///
  /// In en, this message translates to:
  /// **'Exclude Matches'**
  String get excludeMatches;

  /// The label for excluding matches with same stylistic points
  ///
  /// In en, this message translates to:
  /// **'Styles'**
  String get sameStyles;

  /// The label for excluding matches with same compositions
  ///
  /// In en, this message translates to:
  /// **'Comps'**
  String get sameComps;

  /// The label for excluding none of the matches i.e. include all of the matches
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get excludeNone;

  /// The label for button to view stats
  ///
  /// In en, this message translates to:
  /// **'View Stats'**
  String get viewStats;

  /// The label for button to view matches
  ///
  /// In en, this message translates to:
  /// **'View Matches'**
  String get viewMatches;

  /// The header for matches stats page
  ///
  /// In en, this message translates to:
  /// **'{collectionName} Stats'**
  String statsFor(String collectionName);

  /// attack
  ///
  /// In en, this message translates to:
  /// **'Attack'**
  String get attack;

  /// defense
  ///
  /// In en, this message translates to:
  /// **'Defense'**
  String get defense;

  /// Overall score
  ///
  /// In en, this message translates to:
  /// **'Overall Score'**
  String get overallScore;

  /// Attack score
  ///
  /// In en, this message translates to:
  /// **'Attack Score'**
  String get attackScore;

  /// Defense score
  ///
  /// In en, this message translates to:
  /// **'Defense Score'**
  String get defenseScore;

  /// Win rate percent
  ///
  /// In en, this message translates to:
  /// **'{winRate}'**
  String winRatePercent(double winRate);

  /// Styled matches
  ///
  /// In en, this message translates to:
  /// **'{style} Matches'**
  String styledMatches(String style);

  /// The label for matches between two Styles
  ///
  /// In en, this message translates to:
  /// **'{styleA} vs {styleB} Matches'**
  String stylisticMatchupLabel(String styleA, String styleB);

  /// The label for when styleA wins heavily against styleB
  ///
  /// In en, this message translates to:
  /// **'{styleA} beats {styleB} heavily'**
  String veryPositiveWinRate(String styleA, String styleB);

  /// The label for when styleA wins against styleB
  ///
  /// In en, this message translates to:
  /// **'{styleA} beats {styleB}'**
  String positiveWinRate(String styleA, String styleB);

  /// The label for when styleA is tied against styleB
  ///
  /// In en, this message translates to:
  /// **'{styleA} is tied against {styleB}'**
  String tiedWinRate(String styleA, String styleB);

  /// The label for when styleA loses against styleB
  ///
  /// In en, this message translates to:
  /// **'{styleA} loses to {styleB}'**
  String negativeWinRate(String styleA, String styleB);

  /// The label for when styleA loses heavily against styleB
  ///
  /// In en, this message translates to:
  /// **'{styleA} loses heavily to {styleB}'**
  String veryNegativeWinRate(String styleA, String styleB);

  /// Versus label
  ///
  /// In en, this message translates to:
  /// **'vs'**
  String get versusLabel;

  /// The tooltip label for button to view the source code of the app.
  ///
  /// In en, this message translates to:
  /// **'View Source Code'**
  String get viewSource;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
