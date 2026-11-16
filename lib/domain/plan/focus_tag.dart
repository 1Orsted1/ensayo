/// The fixed set of focus areas a piece can be tagged with.
///
/// Each value's [name] is the stable key stored in `Tags.name`; the UI
/// translates it, so the database never holds language-specific labels.
enum FocusTag { technique, repertoire, sightReading, theory, improvisation }
