///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Hello $name'
	String hello({required Object name}) => 'Hello ${name}';

	/// en: 'Save'
	String get save => 'Save';

	late final Translations$login$en login = Translations$login$en._(_root);
	late final Translations$nav$en nav = Translations$nav$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$plan$en plan = Translations$plan$en._(_root);
	late final Translations$session$en session = Translations$session$en._(_root);
	late final Translations$progress$en progress = Translations$progress$en._(_root);
	late final Translations$practiceStreak$en practiceStreak = Translations$practiceStreak$en._(_root);
	late final Translations$dailyGoal$en dailyGoal = Translations$dailyGoal$en._(_root);
	late final Translations$metronome$en metronome = Translations$metronome$en._(_root);
	late final Translations$quickStartCard$en quickStartCard = Translations$quickStartCard$en._(_root);
}

// Path: login
class Translations$login$en {
	Translations$login$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logged in successfully'
	String get success => 'Logged in successfully';

	/// en: 'Logged in failed'
	String get fail => 'Logged in failed';
}

// Path: nav
class Translations$nav$en {
	Translations$nav$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Plan'
	String get plan => 'Plan';

	/// en: 'Session'
	String get session => 'Session';

	/// en: 'Progress'
	String get progress => 'Progress';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home page'
	String get title => 'Home page';

	late final Translations$home$quickStart$en quickStart = Translations$home$quickStart$en._(_root);
	late final Translations$home$recentPieces$en recentPieces = Translations$home$recentPieces$en._(_root);
}

// Path: plan
class Translations$plan$en {
	Translations$plan$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Plan page'
	String get title => 'Plan page';
}

// Path: session
class Translations$session$en {
	Translations$session$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Session page'
	String get title => 'Session page';
}

// Path: progress
class Translations$progress$en {
	Translations$progress$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Progress page'
	String get title => 'Progress page';
}

// Path: practiceStreak
class Translations$practiceStreak$en {
	Translations$practiceStreak$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Practice streak'
	String get title => 'Practice streak';

	/// en: 'This is your opportunity to improve'
	String get subtitle => 'This is your opportunity to improve';

	/// en: '$count days'
	String days({required Object count}) => '${count} days';
}

// Path: dailyGoal
class Translations$dailyGoal$en {
	Translations$dailyGoal$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Daily goal'
	String get title => 'Daily goal';

	/// en: '/$goal min'
	String remaining({required Object goal}) => '/${goal} min';
}

// Path: metronome
class Translations$metronome$en {
	Translations$metronome$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Quick metronome'
	String get title => 'Quick metronome';

	/// en: '$count bpm'
	String bpm({required Object count}) => '${count} bpm';
}

// Path: quickStartCard
class Translations$quickStartCard$en {
	Translations$quickStartCard$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Start Session'
	String get startSession => 'Start Session';
}

// Path: home.quickStart
class Translations$home$quickStart$en {
	Translations$home$quickStart$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ready to play'
	String get title => 'Ready to play';

	/// en: 'Your focus today: technical proficiency'
	String get subtitle => 'Your focus today: technical proficiency';
}

// Path: home.recentPieces
class Translations$home$recentPieces$en {
	Translations$home$recentPieces$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Recent pieces'
	String get title => 'Recent pieces';

	/// en: 'View all'
	String get viewAll => 'View all';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'hello' => ({required Object name}) => 'Hello ${name}',
			'save' => 'Save',
			'login.success' => 'Logged in successfully',
			'login.fail' => 'Logged in failed',
			'nav.home' => 'Home',
			'nav.plan' => 'Plan',
			'nav.session' => 'Session',
			'nav.progress' => 'Progress',
			'home.title' => 'Home page',
			'home.quickStart.title' => 'Ready to play',
			'home.quickStart.subtitle' => 'Your focus today: technical proficiency',
			'home.recentPieces.title' => 'Recent pieces',
			'home.recentPieces.viewAll' => 'View all',
			'plan.title' => 'Plan page',
			'session.title' => 'Session page',
			'progress.title' => 'Progress page',
			'practiceStreak.title' => 'Practice streak',
			'practiceStreak.subtitle' => 'This is your opportunity to improve',
			'practiceStreak.days' => ({required Object count}) => '${count} days',
			'dailyGoal.title' => 'Daily goal',
			'dailyGoal.remaining' => ({required Object goal}) => '/${goal} min',
			'metronome.title' => 'Quick metronome',
			'metronome.bpm' => ({required Object count}) => '${count} bpm',
			'quickStartCard.startSession' => 'Start Session',
			_ => null,
		};
	}
}
