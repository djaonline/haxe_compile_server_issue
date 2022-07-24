package mui.core.styles;

import css.Properties;
import haxe.extern.EitherType;
import mui.common.Breakpoint;
import mui.core.colors.Colors;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.TypeTools;
#end

typedef Theme<
	TBreakpoints: MuiBreakpoints,
	TMixins: MuiMixins,
	TOverrides: MuiOverrides,
	TPaletteAction: MuiPaletteAction,
	TPaletteCommon: MuiPaletteCommon,
	TPaletteBackground: MuiPaletteBackground,
	TPaletteText: MuiPaletteText,
	TPalette: MuiPalette<
		TPaletteAction,
		TPaletteCommon,
		TPaletteBackground,
		TPaletteText
	>,
	TProps: MuiProps,
	TTypography: MuiTypography,
	TShape: MuiShape,
	TTransitions: MuiTransitions,
	TZIndexes: MuiZIndexes> = 
{
	?breakpoints: TBreakpoints,
	?direction: Direction,
	?mixins: TMixins,
	?overrides: TOverrides,
	?palette: TPalette,
	?props: TProps,
	?shadows: Array<String>,
	?typography: TTypography,
	?spacing: Float -> ?Float -> ?Float -> ?Float -> Float,
	?shape: TShape,
	?transitions: TTransitions,
	?zIndex: TZIndexes
}

typedef MuiBreakpoints = 
{
	keys: Array<String>, // ["xs", "sm", "md", "lg", "xl"]
	values:
	{
		xs: Int, // 0
		sm: Int, // 600
		md: Int, // 960
		lg: Int, // 1280
		xl: Int // 1920
	},
	up: (key: BreakpointOrNumber) -> String,
	down: (key: BreakpointOrNumber) -> String,
	between: (start: Breakpoint, end: Breakpoint) -> String,
	only: (key: Breakpoint) -> String,
	width: (key: Breakpoint) -> Int
}

typedef MuiMixins = 
{
	gutters: Properties -> Properties,
	toolbar: Properties 
}

typedef MuiOverrides = {}

typedef MuiPaletteAction = 
{
	active: ColorString,
	hover: ColorString,
	hoverOpacity: Float,
	selected: ColorString,
	disabled: ColorString,
	disabledBackground: ColorString
}

typedef MuiPaletteCommon = 
{
	black: ColorString,
	white: ColorString
}

typedef MuiPaletteBackground =
{
	?paper: ColorString,
}

typedef MuiPaletteText = 
{
	primary: ColorString,
	secondary: ColorString,
	disabled: ColorString,
	hint: ColorString
}

typedef MuiPalette<
	TAction: MuiPaletteAction,
	TCommon: MuiPaletteCommon,
	TBackground: MuiPaletteBackground,
	TText: MuiPaletteText> = 
{
	?type: PaletteType, // Light
	?contrastThreshold: Float, // 3
	?tonalOffset: Float, // 0.2
	?shadows: Array<String>,
	?getContrastText: (background: ColorString) -> String,
	?augmentColor:(color: PaletteIntention, ?mainShade: Int, ?lightShade: Int, ?darkShade: Int) -> PaletteIntention,
	?primary: PaletteIntention,
	?secondary: PaletteIntention,
	?error: PaletteIntention,
	?action: TAction,
	?divider: ColorString,
	?common: TCommon,
	?background: TBackground,
	?grey: ColorDefinition,
	?text: TText
}

typedef MuiProps = {}


typedef MuiTypography = 
{
	?htmlFontSize: Int,
	?pxToRem: Int->Float, // TODO: check signatur
	?round: Float->Int, // TODO: check signatur
	?fontFamily: EitherType<String, Array<String>>,
	?fontSize: Int,
	?fontWeightLight: Int,
	?fontWeightRegular: Int,
	?fontWeightMedium: Int,
	?fontWeightBold: Int,
	?h1: Properties,
	?h2: Properties,
	?h3: Properties,
	?h4: Properties,
	?h5: Properties,
	?h6: Properties,
	?subtitle1: Properties,
	?subtitle2: Properties,
	?body1: Properties,
	?body2: Properties,
	?button: Properties,
	?caption: Properties,
	?overline: Properties,
}

typedef MuiShape = 
{
	borderRadius: Float
}

typedef MuiTransitions = 
{
	create: Dynamic -> Dynamic -> String,
	?getAutoHeightDuration: Float->Float, // TODO: check vs Int
	?easing: MuiTransitionsEasing,
	?duration: MuiTransitionsDuration
}

typedef MuiTransitionsEasing = 
{
	easeInOut: String,
	easeOut: String,
	easeIn: String,
	sharp: String
}

typedef MuiTransitionsDuration = 
{
	shortest: Int,
	shorter: Int,
	short: Int,
	standard: Int,
	complex: Int,
	enteringScreen: Int,
	leavingScreen: Int
}

typedef MuiZIndexes = 
{
	mobileStepper: Int, // 1000
	speedDial: Int, // 1050
	appBar: Int, // 1100
	drawer: Int, // 1200
	modal: Int, // 1300
	snackbar: Int, // 1400
	tooltip: Int // 1500
}

enum abstract Direction(String) 
{
	var Ltr = "ltr";
	var Rtl = "rtl";
}

enum abstract PaletteType(String) from String to String 
{
	var Light = "light";
	var Dark = "dark";
}

typedef PaletteIntention = 
{
	main: ColorString,
	?contrastText: ColorString,
	?dark: ColorString,
	?light: ColorString
}

class MuiTheme 
{
#if macro
	static var DefaultThemeCT = macro :mui.core.styles.MuiTheme.DefaultTheme;
#end

	public static macro function createMuiTheme(overrides: Expr): Expr 
	{
		var expectedType = switch (Context.getExpectedType()) 
		{
			case TMono(_):
				DefaultThemeCT;

			case t: TypeTools.toComplexType(t);
		};
		return macro mui.core.styles.MuiTheme.MuiThemeExtern.createMuiTheme(
			($overrides:$expectedType)
		);
	}
}

@:jsRequire('@material-ui/core/styles')
extern class MuiThemeExtern 
{
	#if !macro
	public static function createMuiTheme<
		TBreakpoints: MuiBreakpoints,
		TMixins: MuiMixins,
		TOverrides: MuiOverrides,
		TPaletteAction: MuiPaletteAction,
		TPaletteCommon: MuiPaletteCommon,
		TPaletteBackground: MuiPaletteBackground,
		TPaletteText: MuiPaletteText,
		TPalette: MuiPalette<
			TPaletteAction,
			TPaletteCommon,
			TPaletteBackground,
			TPaletteText>,
		TProps: MuiProps,
		TTypography: MuiTypography,
		TShape: MuiShape,
		TTransitions: MuiTransitions,
		TZIndexes: MuiZIndexes,
		TTheme: Theme<
			TBreakpoints,
			TMixins,
			TOverrides,
			TPaletteAction,
			TPaletteCommon,
			TPaletteBackground,
			TPaletteText,
			TPalette,
			TProps,
			TTypography,
			TShape,
			TTransitions,
			TZIndexes>>
		(overrides: TTheme): TTheme;

	public static function createUntypedTheme<T, TOverrides>(
		overrides: TOverrides
	): T;
	#end
}

typedef DefaultTheme = 
{
	>Theme<
		MuiBreakpoints,
		MuiMixins,
		MuiOverrides,
		MuiPaletteAction,
		MuiPaletteCommon,
		MuiPaletteBackground,
		MuiPaletteText,
		DefaultPalette,
		MuiProps,
		MuiTypography,
		MuiShape,
		MuiTransitions,
		MuiZIndexes>,
}

typedef DefaultPalette = 
{
	>MuiPalette<
		MuiPaletteAction,
		MuiPaletteCommon,
		MuiPaletteBackground,
		MuiPaletteText
	>,
}
