///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEs with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String hello({required Object name}) => 'Hola ${name}';
	@override String get save => 'Guardar';
	@override late final _Translations$login$es login = _Translations$login$es._(_root);
	@override late final _Translations$nav$es nav = _Translations$nav$es._(_root);
	@override late final _Translations$home$es home = _Translations$home$es._(_root);
	@override late final _Translations$plan$es plan = _Translations$plan$es._(_root);
	@override late final _Translations$session$es session = _Translations$session$es._(_root);
	@override late final _Translations$progress$es progress = _Translations$progress$es._(_root);
	@override late final _Translations$practiceStreak$es practiceStreak = _Translations$practiceStreak$es._(_root);
	@override late final _Translations$dailyGoal$es dailyGoal = _Translations$dailyGoal$es._(_root);
	@override late final _Translations$metronome$es metronome = _Translations$metronome$es._(_root);
	@override late final _Translations$quickStartCard$es quickStartCard = _Translations$quickStartCard$es._(_root);
}

// Path: login
class _Translations$login$es implements Translations$login$en {
	_Translations$login$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Login exitoso';
	@override String get fail => 'Login fallido';
}

// Path: nav
class _Translations$nav$es implements Translations$nav$en {
	_Translations$nav$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get plan => 'Plan';
	@override String get session => 'Sesión';
	@override String get progress => 'Progreso';
}

// Path: home
class _Translations$home$es implements Translations$home$en {
	_Translations$home$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Página de inicio';
	@override late final _Translations$home$quickStart$es quickStart = _Translations$home$quickStart$es._(_root);
	@override late final _Translations$home$recentPieces$es recentPieces = _Translations$home$recentPieces$es._(_root);
}

// Path: plan
class _Translations$plan$es implements Translations$plan$en {
	_Translations$plan$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Página de plan';
}

// Path: session
class _Translations$session$es implements Translations$session$en {
	_Translations$session$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Página de sesión';
}

// Path: progress
class _Translations$progress$es implements Translations$progress$en {
	_Translations$progress$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Página de progreso';
}

// Path: practiceStreak
class _Translations$practiceStreak$es implements Translations$practiceStreak$en {
	_Translations$practiceStreak$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Racha de práctica';
	@override String get subtitle => 'Esta es tu oportunidad de mejorar';
	@override String days({required Object count}) => '${count} días';
}

// Path: dailyGoal
class _Translations$dailyGoal$es implements Translations$dailyGoal$en {
	_Translations$dailyGoal$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meta diaria';
	@override String remaining({required Object goal}) => '/${goal} min';
}

// Path: metronome
class _Translations$metronome$es implements Translations$metronome$en {
	_Translations$metronome$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Metrónomo rápido';
	@override String bpm({required Object count}) => '${count} bpm';
}

// Path: quickStartCard
class _Translations$quickStartCard$es implements Translations$quickStartCard$en {
	_Translations$quickStartCard$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get startSession => 'Iniciar práctica';
}

// Path: home.quickStart
class _Translations$home$quickStart$es implements Translations$home$quickStart$en {
	_Translations$home$quickStart$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Listo para tocar';
	@override String get subtitle => 'Tu enfoque de hoy: destreza técnica';
}

// Path: home.recentPieces
class _Translations$home$recentPieces$es implements Translations$home$recentPieces$en {
	_Translations$home$recentPieces$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Piezas recientes';
	@override String get viewAll => 'Ver todo';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'hello' => ({required Object name}) => 'Hola ${name}',
			'save' => 'Guardar',
			'login.success' => 'Login exitoso',
			'login.fail' => 'Login fallido',
			'nav.home' => 'Inicio',
			'nav.plan' => 'Plan',
			'nav.session' => 'Sesión',
			'nav.progress' => 'Progreso',
			'home.title' => 'Página de inicio',
			'home.quickStart.title' => 'Listo para tocar',
			'home.quickStart.subtitle' => 'Tu enfoque de hoy: destreza técnica',
			'home.recentPieces.title' => 'Piezas recientes',
			'home.recentPieces.viewAll' => 'Ver todo',
			'plan.title' => 'Página de plan',
			'session.title' => 'Página de sesión',
			'progress.title' => 'Página de progreso',
			'practiceStreak.title' => 'Racha de práctica',
			'practiceStreak.subtitle' => 'Esta es tu oportunidad de mejorar',
			'practiceStreak.days' => ({required Object count}) => '${count} días',
			'dailyGoal.title' => 'Meta diaria',
			'dailyGoal.remaining' => ({required Object goal}) => '/${goal} min',
			'metronome.title' => 'Metrónomo rápido',
			'metronome.bpm' => ({required Object count}) => '${count} bpm',
			'quickStartCard.startSession' => 'Iniciar práctica',
			_ => null,
		};
	}
}
