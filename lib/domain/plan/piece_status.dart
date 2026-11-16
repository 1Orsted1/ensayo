/// Where a piece is in the musician's practice journey.
///
/// Stored in the database by [name] (see `Songs.status`), so values can be
/// added or reordered without remapping existing rows.
enum PieceStatus { learning, polishing, performanceReady, archived }
