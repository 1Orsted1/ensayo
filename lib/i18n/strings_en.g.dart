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

	/// en: 'Practice Plan'
	String get title => 'Practice Plan';

	/// en: 'Curate Your Setlist'
	String get hero => 'Curate Your Setlist';

	/// en: 'The pieces you're working on, all in one place.'
	String get helper => 'The pieces you\'re working on, all in one place.';

	/// en: 'BPM'
	String get bpmUnit => 'BPM';

	late final Translations$plan$filter$en filter = Translations$plan$filter$en._(_root);
	late final Translations$plan$status$en status = Translations$plan$status$en._(_root);
	late final Translations$plan$tag$en tag = Translations$plan$tag$en._(_root);
	late final Translations$plan$form$en form = Translations$plan$form$en._(_root);
	late final Translations$plan$validation$en validation = Translations$plan$validation$en._(_root);
	late final Translations$plan$deleteDialog$en deleteDialog = Translations$plan$deleteDialog$en._(_root);
	late final Translations$plan$empty$en empty = Translations$plan$empty$en._(_root);
	late final Translations$plan$failure$en failure = Translations$plan$failure$en._(_root);
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

// Path: plan.filter
class Translations$plan$filter$en {
	Translations$plan$filter$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All'
	String get all => 'All';
}

// Path: plan.status
class Translations$plan$status$en {
	Translations$plan$status$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Learning'
	String get learning => 'Learning';

	/// en: 'Polishing'
	String get polishing => 'Polishing';

	/// en: 'Performance Ready'
	String get performanceReady => 'Performance Ready';

	/// en: 'Archived'
	String get archived => 'Archived';
}

// Path: plan.tag
class Translations$plan$tag$en {
	Translations$plan$tag$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Technique'
	String get technique => 'Technique';

	/// en: 'Repertoire'
	String get repertoire => 'Repertoire';

	/// en: 'Sight-reading'
	String get sightReading => 'Sight-reading';

	/// en: 'Theory'
	String get theory => 'Theory';

	/// en: 'Improvisation'
	String get improvisation => 'Improvisation';
}

// Path: plan.form
class Translations$plan$form$en {
	Translations$plan$form$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add Piece to Plan'
	String get addTitle => 'Add Piece to Plan';

	/// en: 'Edit Piece'
	String get editTitle => 'Edit Piece';

	/// en: 'TITLE'
	String get titleLabel => 'TITLE';

	/// en: 'COMPOSER (OPTIONAL)'
	String get composerLabel => 'COMPOSER (OPTIONAL)';

	/// en: 'CURRENT STATUS'
	String get statusLabel => 'CURRENT STATUS';

	/// en: 'TARGET TEMPO'
	String get tempoLabel => 'TARGET TEMPO';

	/// en: 'FOCUS TAGS'
	String get tagsLabel => 'FOCUS TAGS';

	/// en: 'Save Piece'
	String get save => 'Save Piece';

	/// en: 'Discard Changes'
	String get discard => 'Discard Changes';

	/// en: 'Delete piece'
	String get delete => 'Delete piece';
}

// Path: plan.validation
class Translations$plan$validation$en {
	Translations$plan$validation$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add a title'
	String get titleRequired => 'Add a title';

	/// en: 'Keep the title to $max characters or fewer'
	String titleTooLong({required Object max}) => 'Keep the title to ${max} characters or fewer';

	/// en: 'Keep the composer to $max characters or fewer'
	String composerTooLong({required Object max}) => 'Keep the composer to ${max} characters or fewer';

	/// en: 'Use a tempo from $min to $max BPM'
	String bpmOutOfRange({required Object min, required Object max}) => 'Use a tempo from ${min} to ${max} BPM';
}

// Path: plan.deleteDialog
class Translations$plan$deleteDialog$en {
	Translations$plan$deleteDialog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete this piece?'
	String get title => 'Delete this piece?';

	/// en: 'It will be removed from your plan for good. To keep it, set its status to Archived instead.'
	String get body => 'It will be removed from your plan for good. To keep it, set its status to Archived instead.';

	/// en: 'Delete'
	String get confirm => 'Delete';

	/// en: 'Cancel'
	String get cancel => 'Cancel';
}

// Path: plan.empty
class Translations$plan$empty$en {
	Translations$plan$empty$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your plan is empty'
	String get title => 'Your plan is empty';

	/// en: 'Add the first piece you're working on.'
	String get body => 'Add the first piece you\'re working on.';

	/// en: 'Add a piece'
	String get action => 'Add a piece';

	/// en: 'No pieces match this filter.'
	String get noMatches => 'No pieces match this filter.';
}

// Path: plan.failure
class Translations$plan$failure$en {
	Translations$plan$failure$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Couldn't load your plan.'
	String get load => 'Couldn\'t load your plan.';

	/// en: 'Couldn't save the piece. Your changes are still here.'
	String get save => 'Couldn\'t save the piece. Your changes are still here.';

	/// en: 'Couldn't delete the piece.'
	String get delete => 'Couldn\'t delete the piece.';

	/// en: 'Try again'
	String get retry => 'Try again';
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
			'plan.title' => 'Practice Plan',
			'plan.hero' => 'Curate Your Setlist',
			'plan.helper' => 'The pieces you\'re working on, all in one place.',
			'plan.bpmUnit' => 'BPM',
			'plan.filter.all' => 'All',
			'plan.status.learning' => 'Learning',
			'plan.status.polishing' => 'Polishing',
			'plan.status.performanceReady' => 'Performance Ready',
			'plan.status.archived' => 'Archived',
			'plan.tag.technique' => 'Technique',
			'plan.tag.repertoire' => 'Repertoire',
			'plan.tag.sightReading' => 'Sight-reading',
			'plan.tag.theory' => 'Theory',
			'plan.tag.improvisation' => 'Improvisation',
			'plan.form.addTitle' => 'Add Piece to Plan',
			'plan.form.editTitle' => 'Edit Piece',
			'plan.form.titleLabel' => 'TITLE',
			'plan.form.composerLabel' => 'COMPOSER (OPTIONAL)',
			'plan.form.statusLabel' => 'CURRENT STATUS',
			'plan.form.tempoLabel' => 'TARGET TEMPO',
			'plan.form.tagsLabel' => 'FOCUS TAGS',
			'plan.form.save' => 'Save Piece',
			'plan.form.discard' => 'Discard Changes',
			'plan.form.delete' => 'Delete piece',
			'plan.validation.titleRequired' => 'Add a title',
			'plan.validation.titleTooLong' => ({required Object max}) => 'Keep the title to ${max} characters or fewer',
			'plan.validation.composerTooLong' => ({required Object max}) => 'Keep the composer to ${max} characters or fewer',
			'plan.validation.bpmOutOfRange' => ({required Object min, required Object max}) => 'Use a tempo from ${min} to ${max} BPM',
			'plan.deleteDialog.title' => 'Delete this piece?',
			'plan.deleteDialog.body' => 'It will be removed from your plan for good. To keep it, set its status to Archived instead.',
			'plan.deleteDialog.confirm' => 'Delete',
			'plan.deleteDialog.cancel' => 'Cancel',
			'plan.empty.title' => 'Your plan is empty',
			'plan.empty.body' => 'Add the first piece you\'re working on.',
			'plan.empty.action' => 'Add a piece',
			'plan.empty.noMatches' => 'No pieces match this filter.',
			'plan.failure.load' => 'Couldn\'t load your plan.',
			'plan.failure.save' => 'Couldn\'t save the piece. Your changes are still here.',
			'plan.failure.delete' => 'Couldn\'t delete the piece.',
			'plan.failure.retry' => 'Try again',
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
