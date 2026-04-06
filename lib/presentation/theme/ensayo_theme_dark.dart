import 'package:ensayo/presentation/theme/i_personalized_theme.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// ---------------------------------------------------------------------------
// ENSAYO — Dark Theme
// Design System: "The Botanical Architect"
// Palette: Deep coniferous greens + misty sages + atmospheric neutrals
// Fonts: Space Grotesk (display/headlines) · Manrope (body/labels)
// ---------------------------------------------------------------------------

@Named('dark')
@Injectable(as: IPersonalizedTheme)
class EnsayoThemeDark implements IPersonalizedTheme {
  // -------------------------------------------------------------------------
  // COLOR SCHEME
  // Surface hierarchy follows the nested physical layers principle:
  //   Base (#0F1513) → Low (#171D1B) → Mid (#1B211F) → Highest (#303634)
  // -------------------------------------------------------------------------
  final colorScheme = const ColorScheme.dark(
    // -- Primary --
    // Light teal used ON dark backgrounds (M3 convention)
    primary: Color(0xFFA3CFC7),
    onPrimary: Color(0xFF0A2922),
    primaryContainer: Color(0xFF16423C),
    onPrimaryContainer: Color(0xFFCEEAE4),

    // -- Secondary --
    // Misty sage family
    secondary: Color(0xFF8FC2B2),
    onSecondary: Color(0xFF0D2B22),
    secondaryContainer: Color(0xFF1E4A3C),
    onSecondaryContainer: Color(0xFFB8D8CE),
    // -- Tertiary --
    // Soft neutral mint — used sparingly for a third accent
    tertiary: Color(0xFFC4DAD2),
    onTertiary: Color(0xFF1A3028),
    tertiaryContainer: Color(0xFF264038),
    onTertiaryContainer: Color(0xFFD8EDE7),

    // -- Error --
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),

    // -- Surface Hierarchy --
    // "Base" layer — scaffold background
    surface: Color(0xFF0F1513),
    onSurface: Color(0xFFDEE4E1),

    // Container tiers for nested layering (no borders, only tonal shifts)
    surfaceContainerLowest: Color(0xFF0A100E),
    surfaceContainerLow: Color(0xFF171D1B), // Large layout blocks
    surfaceContainer: Color(0xFF1B211F), // Primary content cards
    surfaceContainerHigh: Color(0xFF222927), // Elevated cards
    surfaceContainerHighest: Color(0xFF303634), // Interactive elements / modals
    // -- On Surface Variant --
    // Per DESIGN.md: use this for body text on dark, NOT pure white
    onSurfaceVariant: Color(0xFFC0C8C5),

    // -- Outline --
    // Ghost Border fallback at ~15% opacity in usage
    outline: Color(0xFF6A7370),
    outlineVariant: Color(0xFF3A4240),

    // -- Inverse --
    inverseSurface: Color(0xFFDEE4E1),
    onInverseSurface: Color(0xFF0F1513),
    inversePrimary: Color(0xFF16423C),

    // -- Misc --
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
  );

  // -------------------------------------------------------------------------
  // TEXT THEME
  // Space Grotesk → display + headlines (editorial voice)
  // Manrope       → body + labels    (functional voice)
  // -------------------------------------------------------------------------
  TextTheme get _textTheme => const TextTheme(
    // --- Display (Space Grotesk) ---
    displayLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      color: Color(0xFFDEE4E1),
    ),
    displayMedium: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: Color(0xFFDEE4E1),
    ),
    displaySmall: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: Color(0xFFDEE4E1),
    ),

    // --- Headline (Space Grotesk) ---
    headlineLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: Color(0xFFDEE4E1),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Color(0xFFDEE4E1),
    ),
    headlineSmall: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color(0xFFDEE4E1),
    ),

    // --- Title (Manrope — transitional) ---
    titleLarge: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFFDEE4E1),
    ),
    titleMedium: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: Color(0xFFDEE4E1),
    ),
    titleSmall: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: Color(0xFFDEE4E1),
    ),

    // --- Body (Manrope) ---
    bodyLarge: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Color(0xFFC0C8C5), // onSurfaceVariant — softer, premium
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Color(0xFFC0C8C5),
    ),
    bodySmall: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Color(0xFFC0C8C5),
    ),

    // --- Label (Manrope — uppercase buttons / tags) ---
    labelLarge: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.05 * 14, // 0.05em
      color: Color(0xFFDEE4E1),
    ),
    labelMedium: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Color(0xFFDEE4E1),
    ),
    labelSmall: TextStyle(
      fontFamily: 'Manrope',
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Color(0xFFC0C8C5),
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
      // Glassmorphic: surface at ~70% opacity in practice (set in widget layer
      // via ShaderMask or BackdropFilter; here we establish the base color)
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
      ),

      // -- Cards --
      // No dividers, xl rounding (24px), tonal depth only — no shadows
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainer,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // xl
        ),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),

      // -- Elevated Button --
      // Per spec: gradient primary → primaryContainer, 24px radius, uppercase
      // Note: ElevatedButton doesn't support gradient natively.
      // Use this as the fallback solid; for gradient wrap in Ink + ShaderMask.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              // +5% brightness on hover (not darker — per spec)
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

      // -- Outlined Button (Secondary style) --
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            colorScheme.surfaceContainerHighest,
          ),
          foregroundColor: WidgetStateProperty.all(colorScheme.onSurface),
          // Ghost border: outlineVariant at 15% opacity
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
      // Minimalist filled, no bottom line, xl rounding
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
            // primaryContainer at 20% opacity on focus
            color: colorScheme.primaryContainer.withValues(alpha: 0.2),
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
      // Tonal background, no elevation line
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
      // Per spec: avoid dividers. When absolutely needed, ghost opacity.
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant.withValues(alpha: 0.15),
        thickness: 1,
        space: 1,
      ),

      // -- Chip --
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHigh,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: _textTheme.labelMedium,
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
      // Glassmorphic feel — implement backdrop blur in the widget itself
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary.withValues(alpha: 0.85),
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
    );
  }
}
