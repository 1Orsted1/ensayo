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
	@override late final _Translations$logs$es logs = _Translations$logs$es._(_root);
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
	@override String get dashboard => 'Panel';
	@override String get plan => 'Plan';
	@override String get logs => 'Registros';
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
	@override String get title => 'Plan de práctica';
	@override String get hero => 'Arma Tu Repertorio';
	@override String get helper => 'Las piezas en las que estás trabajando, todas en un lugar.';
	@override String get bpmUnit => 'BPM';
	@override late final _Translations$plan$filter$es filter = _Translations$plan$filter$es._(_root);
	@override late final _Translations$plan$status$es status = _Translations$plan$status$es._(_root);
	@override late final _Translations$plan$tag$es tag = _Translations$plan$tag$es._(_root);
	@override late final _Translations$plan$form$es form = _Translations$plan$form$es._(_root);
	@override late final _Translations$plan$validation$es validation = _Translations$plan$validation$es._(_root);
	@override late final _Translations$plan$deleteDialog$es deleteDialog = _Translations$plan$deleteDialog$es._(_root);
	@override late final _Translations$plan$empty$es empty = _Translations$plan$empty$es._(_root);
	@override late final _Translations$plan$failure$es failure = _Translations$plan$failure$es._(_root);
}

// Path: session
class _Translations$session$es implements Translations$session$en {
	_Translations$session$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get live => 'EN VIVO';
	@override String get inProgress => 'Sesión en curso';
	@override String piecesCompleted({required num n, required Object count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: '${count} pieza completada',
		other: '${count} piezas completadas',
	);
	@override String piecePosition({required Object current, required Object total}) => 'PIEZA ${current} DE ${total}';
	@override String get moodLabel => '¿CÓMO TE SENTISTE?';
	@override String get noteLabel => 'OBSERVACIÓN Y NOTAS';
	@override String get noteHint => '¿Qué notaste?';
	@override String get durationLabel => 'DURACIÓN';
	@override String get tempoLabel => 'TEMPO';
	@override String get minutesUnit => 'min';
	@override late final _Translations$session$mood$es mood = _Translations$session$mood$es._(_root);
	@override late final _Translations$session$validation$es validation = _Translations$session$validation$es._(_root);
	@override String get logAndContinue => 'Guardar pieza y continuar';
	@override String get skip => 'Omitir';
	@override String get queueDone => 'Todas las piezas están listas. Termina cuando quieras.';
	@override String get freePractice => 'No hay piezas para registrar. Disfruta la práctica libre o añade piezas a tu plan la próxima vez.';
	@override String get finishSession => 'Terminar sesión';
	@override String get close => 'Cerrar sesión';
	@override late final _Translations$session$leave$es leave = _Translations$session$leave$es._(_root);
	@override late final _Translations$session$discardDialog$es discardDialog = _Translations$session$discardDialog$es._(_root);
	@override late final _Translations$session$failure$es failure = _Translations$session$failure$es._(_root);
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
	@override String days({required num n, required Object count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: '${count} día',
		other: '${count} días',
	);
	@override String get loadFailure => 'No se pudo cargar';
}

// Path: dailyGoal
class _Translations$dailyGoal$es implements Translations$dailyGoal$en {
	_Translations$dailyGoal$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meta diaria';
	@override String remaining({required Object goal}) => '/ ${goal} min';
	@override String get editorTitle => 'Editar meta diaria';
	@override String get minutesUnit => 'min';
	@override String get save => 'Guardar';
	@override String get saveFailure => 'No se pudo guardar tu meta.';
}

// Path: logs
class _Translations$logs$es implements Translations$logs$en {
	_Translations$logs$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registros';
	@override String get empty => 'Las sesiones terminadas aparecerán aquí.';
	@override String pieceCount({required num n, required Object count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n,
		one: '${count} pieza',
		other: '${count} piezas',
	);
	@override String get minutes => 'min';
	@override String get loadFailure => 'No se pudieron cargar tus registros.';
	@override String get retry => 'Intentar de nuevo';
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
	@override String get startSession => 'Iniciar sesión';
	@override String get resumeSession => 'Reanudar sesión';
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

// Path: plan.filter
class _Translations$plan$filter$es implements Translations$plan$filter$en {
	_Translations$plan$filter$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get all => 'Todas';
}

// Path: plan.status
class _Translations$plan$status$es implements Translations$plan$status$en {
	_Translations$plan$status$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get learning => 'Aprendiendo';
	@override String get polishing => 'Puliendo';
	@override String get performanceReady => 'Lista para tocar';
	@override String get archived => 'Archivada';
}

// Path: plan.tag
class _Translations$plan$tag$es implements Translations$plan$tag$en {
	_Translations$plan$tag$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get technique => 'Técnica';
	@override String get repertoire => 'Repertorio';
	@override String get sightReading => 'Lectura a primera vista';
	@override String get theory => 'Teoría';
	@override String get improvisation => 'Improvisación';
}

// Path: plan.form
class _Translations$plan$form$es implements Translations$plan$form$en {
	_Translations$plan$form$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get addTitle => 'Añadir Pieza al Plan';
	@override String get editTitle => 'Editar Pieza';
	@override String get titleLabel => 'TÍTULO';
	@override String get composerLabel => 'COMPOSITOR (OPCIONAL)';
	@override String get statusLabel => 'ESTADO ACTUAL';
	@override String get tempoLabel => 'TEMPO OBJETIVO';
	@override String get tagsLabel => 'ENFOQUES';
	@override String get save => 'Guardar pieza';
	@override String get discard => 'Descartar cambios';
	@override String get delete => 'Eliminar pieza';
}

// Path: plan.validation
class _Translations$plan$validation$es implements Translations$plan$validation$en {
	_Translations$plan$validation$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get titleRequired => 'Añade un título';
	@override String titleTooLong({required Object max}) => 'El título puede tener hasta ${max} caracteres';
	@override String composerTooLong({required Object max}) => 'El compositor puede tener hasta ${max} caracteres';
	@override String bpmOutOfRange({required Object min, required Object max}) => 'Usa un tempo de ${min} a ${max} BPM';
}

// Path: plan.deleteDialog
class _Translations$plan$deleteDialog$es implements Translations$plan$deleteDialog$en {
	_Translations$plan$deleteDialog$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Eliminar esta pieza?';
	@override String get body => 'Se quitará de tu plan para siempre. Para conservarla, cambia su estado a Archivada.';
	@override String get confirm => 'Eliminar';
	@override String get cancel => 'Cancelar';
}

// Path: plan.empty
class _Translations$plan$empty$es implements Translations$plan$empty$en {
	_Translations$plan$empty$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tu plan está vacío';
	@override String get body => 'Añade la primera pieza en la que estás trabajando.';
	@override String get action => 'Añadir una pieza';
	@override String get noMatches => 'Ninguna pieza coincide con este filtro.';
}

// Path: plan.failure
class _Translations$plan$failure$es implements Translations$plan$failure$en {
	_Translations$plan$failure$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get load => 'No se pudo cargar tu plan.';
	@override String get save => 'No se pudo guardar la pieza. Tus cambios siguen aquí.';
	@override String get delete => 'No se pudo eliminar la pieza.';
	@override String get retry => 'Intentar de nuevo';
}

// Path: session.mood
class _Translations$session$mood$es implements Translations$session$mood$en {
	_Translations$session$mood$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tough => 'Difícil';
	@override String get okay => 'Normal';
	@override String get calm => 'Tranquilo';
	@override String get inspired => 'Inspirado';
	@override String get proud => 'Orgulloso';
}

// Path: session.validation
class _Translations$session$validation$es implements Translations$session$validation$en {
	_Translations$session$validation$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String durationOutOfRange({required Object min, required Object max}) => 'Usa una duración de ${min} a ${max} minutos';
	@override String noteTooLong({required Object max}) => 'La nota puede tener hasta ${max} caracteres';
	@override String tempoOutOfRange({required Object min, required Object max}) => 'Usa un tempo de ${min} a ${max} BPM';
}

// Path: session.leave
class _Translations$session$leave$es implements Translations$session$leave$en {
	_Translations$session$leave$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Salir de esta sesión?';
	@override String get body => 'Puedes terminarla, descartarla o seguir practicando.';
	@override String get discard => 'Descartar sesión';
	@override String get keepPracticing => 'Seguir practicando';
}

// Path: session.discardDialog
class _Translations$session$discardDialog$es implements Translations$session$discardDialog$en {
	_Translations$session$discardDialog$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Descartar esta sesión?';
	@override String get body => 'Se eliminarán la sesión y sus registros de piezas.';
	@override String get confirm => 'Descartar';
	@override String get cancel => 'Cancelar';
}

// Path: session.failure
class _Translations$session$failure$es implements Translations$session$failure$en {
	_Translations$session$failure$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get restore => 'No se pudo recuperar tu sesión. Puedes empezar de nuevo.';
	@override String get start => 'No se pudo iniciar una sesión.';
	@override String get log => 'No se pudo guardar esta pieza. Tus cambios siguen aquí.';
	@override String get finish => 'No se pudo terminar la sesión. Puedes intentarlo de nuevo.';
	@override String get discard => 'No se pudo descartar la sesión. Puedes intentarlo de nuevo.';
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
			'nav.dashboard' => 'Panel',
			'nav.plan' => 'Plan',
			'nav.logs' => 'Registros',
			'nav.progress' => 'Progreso',
			'home.title' => 'Página de inicio',
			'home.quickStart.title' => 'Listo para tocar',
			'home.quickStart.subtitle' => 'Tu enfoque de hoy: destreza técnica',
			'home.recentPieces.title' => 'Piezas recientes',
			'home.recentPieces.viewAll' => 'Ver todo',
			'plan.title' => 'Plan de práctica',
			'plan.hero' => 'Arma Tu Repertorio',
			'plan.helper' => 'Las piezas en las que estás trabajando, todas en un lugar.',
			'plan.bpmUnit' => 'BPM',
			'plan.filter.all' => 'Todas',
			'plan.status.learning' => 'Aprendiendo',
			'plan.status.polishing' => 'Puliendo',
			'plan.status.performanceReady' => 'Lista para tocar',
			'plan.status.archived' => 'Archivada',
			'plan.tag.technique' => 'Técnica',
			'plan.tag.repertoire' => 'Repertorio',
			'plan.tag.sightReading' => 'Lectura a primera vista',
			'plan.tag.theory' => 'Teoría',
			'plan.tag.improvisation' => 'Improvisación',
			'plan.form.addTitle' => 'Añadir Pieza al Plan',
			'plan.form.editTitle' => 'Editar Pieza',
			'plan.form.titleLabel' => 'TÍTULO',
			'plan.form.composerLabel' => 'COMPOSITOR (OPCIONAL)',
			'plan.form.statusLabel' => 'ESTADO ACTUAL',
			'plan.form.tempoLabel' => 'TEMPO OBJETIVO',
			'plan.form.tagsLabel' => 'ENFOQUES',
			'plan.form.save' => 'Guardar pieza',
			'plan.form.discard' => 'Descartar cambios',
			'plan.form.delete' => 'Eliminar pieza',
			'plan.validation.titleRequired' => 'Añade un título',
			'plan.validation.titleTooLong' => ({required Object max}) => 'El título puede tener hasta ${max} caracteres',
			'plan.validation.composerTooLong' => ({required Object max}) => 'El compositor puede tener hasta ${max} caracteres',
			'plan.validation.bpmOutOfRange' => ({required Object min, required Object max}) => 'Usa un tempo de ${min} a ${max} BPM',
			'plan.deleteDialog.title' => '¿Eliminar esta pieza?',
			'plan.deleteDialog.body' => 'Se quitará de tu plan para siempre. Para conservarla, cambia su estado a Archivada.',
			'plan.deleteDialog.confirm' => 'Eliminar',
			'plan.deleteDialog.cancel' => 'Cancelar',
			'plan.empty.title' => 'Tu plan está vacío',
			'plan.empty.body' => 'Añade la primera pieza en la que estás trabajando.',
			'plan.empty.action' => 'Añadir una pieza',
			'plan.empty.noMatches' => 'Ninguna pieza coincide con este filtro.',
			'plan.failure.load' => 'No se pudo cargar tu plan.',
			'plan.failure.save' => 'No se pudo guardar la pieza. Tus cambios siguen aquí.',
			'plan.failure.delete' => 'No se pudo eliminar la pieza.',
			'plan.failure.retry' => 'Intentar de nuevo',
			'session.live' => 'EN VIVO',
			'session.inProgress' => 'Sesión en curso',
			'session.piecesCompleted' => ({required num n, required Object count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n, one: '${count} pieza completada', other: '${count} piezas completadas', ), 
			'session.piecePosition' => ({required Object current, required Object total}) => 'PIEZA ${current} DE ${total}',
			'session.moodLabel' => '¿CÓMO TE SENTISTE?',
			'session.noteLabel' => 'OBSERVACIÓN Y NOTAS',
			'session.noteHint' => '¿Qué notaste?',
			'session.durationLabel' => 'DURACIÓN',
			'session.tempoLabel' => 'TEMPO',
			'session.minutesUnit' => 'min',
			'session.mood.tough' => 'Difícil',
			'session.mood.okay' => 'Normal',
			'session.mood.calm' => 'Tranquilo',
			'session.mood.inspired' => 'Inspirado',
			'session.mood.proud' => 'Orgulloso',
			'session.validation.durationOutOfRange' => ({required Object min, required Object max}) => 'Usa una duración de ${min} a ${max} minutos',
			'session.validation.noteTooLong' => ({required Object max}) => 'La nota puede tener hasta ${max} caracteres',
			'session.validation.tempoOutOfRange' => ({required Object min, required Object max}) => 'Usa un tempo de ${min} a ${max} BPM',
			'session.logAndContinue' => 'Guardar pieza y continuar',
			'session.skip' => 'Omitir',
			'session.queueDone' => 'Todas las piezas están listas. Termina cuando quieras.',
			'session.freePractice' => 'No hay piezas para registrar. Disfruta la práctica libre o añade piezas a tu plan la próxima vez.',
			'session.finishSession' => 'Terminar sesión',
			'session.close' => 'Cerrar sesión',
			'session.leave.title' => '¿Salir de esta sesión?',
			'session.leave.body' => 'Puedes terminarla, descartarla o seguir practicando.',
			'session.leave.discard' => 'Descartar sesión',
			'session.leave.keepPracticing' => 'Seguir practicando',
			'session.discardDialog.title' => '¿Descartar esta sesión?',
			'session.discardDialog.body' => 'Se eliminarán la sesión y sus registros de piezas.',
			'session.discardDialog.confirm' => 'Descartar',
			'session.discardDialog.cancel' => 'Cancelar',
			'session.failure.restore' => 'No se pudo recuperar tu sesión. Puedes empezar de nuevo.',
			'session.failure.start' => 'No se pudo iniciar una sesión.',
			'session.failure.log' => 'No se pudo guardar esta pieza. Tus cambios siguen aquí.',
			'session.failure.finish' => 'No se pudo terminar la sesión. Puedes intentarlo de nuevo.',
			'session.failure.discard' => 'No se pudo descartar la sesión. Puedes intentarlo de nuevo.',
			'progress.title' => 'Página de progreso',
			'practiceStreak.title' => 'Racha de práctica',
			'practiceStreak.subtitle' => 'Esta es tu oportunidad de mejorar',
			'practiceStreak.days' => ({required num n, required Object count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n, one: '${count} día', other: '${count} días', ), 
			'practiceStreak.loadFailure' => 'No se pudo cargar',
			'dailyGoal.title' => 'Meta diaria',
			'dailyGoal.remaining' => ({required Object goal}) => '/ ${goal} min',
			'dailyGoal.editorTitle' => 'Editar meta diaria',
			'dailyGoal.minutesUnit' => 'min',
			'dailyGoal.save' => 'Guardar',
			'dailyGoal.saveFailure' => 'No se pudo guardar tu meta.',
			'logs.title' => 'Registros',
			'logs.empty' => 'Las sesiones terminadas aparecerán aquí.',
			'logs.pieceCount' => ({required num n, required Object count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(n, one: '${count} pieza', other: '${count} piezas', ), 
			'logs.minutes' => 'min',
			'logs.loadFailure' => 'No se pudieron cargar tus registros.',
			'logs.retry' => 'Intentar de nuevo',
			'metronome.title' => 'Metrónomo rápido',
			'metronome.bpm' => ({required Object count}) => '${count} bpm',
			'quickStartCard.startSession' => 'Iniciar sesión',
			'quickStartCard.resumeSession' => 'Reanudar sesión',
			_ => null,
		};
	}
}
