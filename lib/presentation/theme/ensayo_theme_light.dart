import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/domain/theme/i_personalized_theme.dart';
import 'package:ensayo/presentation/theme/extensions/custom_card_style.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// ---------------------------------------------------------------------------
// ENSAYO — Light Theme
// Design System: "The Botanical Architect"
// Light mode inverts the hierarchy: deep greens become primary actions,
// surfaces lift to pale mints and whites, maintaining the organic depth.
// ---------------------------------------------------------------------------

@Named(kLight)
@Injectable(as: IPersonalizedTheme)
class EnsayoThemeLight implements IPersonalizedTheme {
  // -------------------------------------------------------------------------
  // COLOR SCHEME
  // Surface hierarchy (light):
  //   Lowest (#FFFFFF) → Low (#EEF4F1) → Mid (#E8F0ED) → Highest (#DCE5E2)
  // -------------------------------------------------------------------------
  final colorScheme = const ColorScheme.light(
    // -- Primary --
    // Deep forest green as the action color on light backgrounds
    primary: Color(0xFF16423C),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFCEEAE4),
    onPrimaryContainer: Color(0xFF0A2922),

    // -- Secondary --
    // Mid-range sage for secondary actions
    secondary: Color(0xFF3D7A6A),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFB8D8CE),
    onSecondaryContainer: Color(0xFF0D2B22),

    // -- Tertiary --
    tertiary: Color(0xFF4A6E64),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD8EDE7),
    onTertiaryContainer: Color(0xFF1A3028),

    // -- Error --
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),

    // -- Surface Hierarchy --
    // "Base" — scaffold background (pale mint-white)
    surface: Color(0xFFF4F9F7),
    onSurface: Color(0xFF0F1513),

    // Container tiers — tonal shifts replace borders
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFEEF4F1), // Large layout blocks
    surfaceContainer: Color(0xFFE8F0ED), // Primary content cards
    surfaceContainerHigh: Color(0xFFE2EAE7), // Elevated cards
    surfaceContainerHighest: Color(0xFFDCE5E2), // Interactive elements
    // Per spec: softer than pure black, still legible
    onSurfaceVariant: Color(0xFF3D4844),

    // -- Outline --
    outline: Color(0xFF6A7370),
    outlineVariant: Color(0xFFC0C8C5),

    // -- Inverse --
    inverseSurface: Color(0xFF2B3230),
    onInverseSurface: Color(0xFFEEF4F1),
    inversePrimary: Color(0xFFA3CFC7),

    // -- Misc --
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
  );

  // -------------------------------------------------------------------------
  // TEXT THEME
  // Same dual-font strategy, colors adapted for light backgrounds
  // -------------------------------------------------------------------------
  TextTheme get _textTheme => const TextTheme(
    // --- Display (Space Grotesk) ---
    displayLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      color: Color(0xFF0F1513),
    ),
    displayMedium: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: Color(0xFF0F1513),
    ),
    displaySmall: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: Color(0xFF0F1513),
    ),

    // --- Headline (Space Grotesk) ---
    headlineLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: Color(0xFF0F1513),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Color(0xFF0F1513),
    ),
    headlineSmall: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color(0xFF0F1513),
    ),

    // --- Title (Manrope) ---
    titleLarge: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFF0F1513),
    ),
    titleMedium: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: Color(0xFF0F1513),
    ),
    titleSmall: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: Color(0xFF0F1513),
    ),

    // --- Body (Manrope) ---
    bodyLarge: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Color(0xFF3D4844), // onSurfaceVariant
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Color(0xFF3D4844),
    ),
    bodySmall: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Color(0xFF3D4844),
    ),

    // --- Label (Manrope) ---
    labelLarge: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.05 * 14,
      color: Color(0xFF0F1513),
    ),
    labelMedium: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Color(0xFF0F1513),
    ),
    labelSmall: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Color(0xFF3D4844),
    ),
  );

  // -------------------------------------------------------------------------
  // THEME DATA
  // -------------------------------------------------------------------------
  @override
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Manrope',
      colorScheme: colorScheme,
      textTheme: _textTheme,

      // -- Scaffold --
      scaffoldBackgroundColor: colorScheme.surface,

      // -- AppBar --
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface.withValues(alpha: 0.7),
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: _textTheme.titleLarge?.copyWith(
          fontFamily: 'SpaceGrotesk',
          color: colorScheme.onSurface,
        ),
        iconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
        actionsIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
        // Ambient shadow: tinted, very low opacity (per spec: 4-8%)
        shadowColor: const Color(0xFFDEE4E1).withValues(alpha: 0.06),
      ),

      // -- Cards --
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainer,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),

      // -- Elevated Button --
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primary.withValues(alpha: 0.92);
            }
            return colorScheme.primary;
          }),
          foregroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
          elevation: WidgetStateProperty.all(0),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          textStyle: WidgetStateProperty.all(
            _textTheme.labelLarge?.copyWith(
              fontFamily: 'Manrope',
              letterSpacing: 0.05 * 14,
            ),
          ),
        ),
      ),

      // -- Text Button --
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(colorScheme.primary),
          textStyle: WidgetStateProperty.all(_textTheme.labelLarge),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
        ),
      ),

      // -- Outlined Button (Secondary) --
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            colorScheme.surfaceContainerHighest,
          ),
          foregroundColor: WidgetStateProperty.all(colorScheme.onSurface),
          side: WidgetStateProperty.all(
            BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          textStyle: WidgetStateProperty.all(_textTheme.labelLarge),
        ),
      ),

      // -- Input Fields --
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: colorScheme.primaryContainer.withValues(alpha: 0.6),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        hintStyle: _textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
        ),
        labelStyle: _textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),

      // -- Bottom Navigation Bar --
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surfaceContainerLow,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: _textTheme.labelSmall,
        unselectedLabelStyle: _textTheme.labelSmall,
      ),

      // -- Navigation Bar (M3) --
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surfaceContainerLow,
        indicatorColor: colorScheme.primaryContainer,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colorScheme.onPrimaryContainer);
          }
          return IconThemeData(color: colorScheme.onSurfaceVariant);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _textTheme.labelSmall?.copyWith(color: colorScheme.primary);
          }
          return _textTheme.labelSmall;
        }),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),

      // -- Divider --
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant.withValues(alpha: 0.15),
        thickness: 1,
        space: 1,
      ),

      // -- Chip --
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHigh,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: _textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // -- List Tile --
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        iconColor: colorScheme.onSurfaceVariant,
        titleTextStyle: _textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
        subtitleTextStyle: _textTheme.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      ),

      // -- Icon --
      iconTheme: IconThemeData(color: colorScheme.onSurfaceVariant, size: 24),

      // -- FAB --
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      // -- Snackbar --
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: _textTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),

      // -- Custom extensions --
      extensions: [
        CustomCardStyle(
          backgroundColor: colorScheme.primaryContainer,
          titleStyle: _textTheme.titleLarge!.copyWith(
            fontFamily: 'SpaceGrotesk',
            color: colorScheme.onPrimaryContainer,
          ),
          subtitleStyle: _textTheme.bodyMedium!.copyWith(
            color: colorScheme.onPrimaryContainer,
          ),
          buttonStyle: OutlinedButton.styleFrom(
            foregroundColor: colorScheme.onPrimaryContainer,
            backgroundColor: colorScheme.primaryContainer,
            side: BorderSide(color: colorScheme.onPrimaryContainer),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          padding: const EdgeInsets.all(20),
          borderRadius: BorderRadius.circular(24),
        ),
      ],
    );
  }
}
