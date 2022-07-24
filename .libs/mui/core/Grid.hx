package mui.core;

import css.FlexDirection;
import css.FlexWrap;

enum abstract GridAlignContent(String) to String 
{
	var Center = "center";
	var FlexStart = "flex-start";
	var FlexEnd = "flex-end";
	var SpaceBetween = "space-between";
	var SpaceAround = "space-around";
	var Stretch = "stretch";
}

enum abstract GridAlignItems(String) to String 
{
	var Stretch = "stretch";
	var Center = "center";
	var FlexStart = "flex-start";
	var FlexEnd = "flex-end";
	var Baseline = "baseline";
}

enum abstract GridJustifyContent(String) to String 
{
	var Center = "center";
	var FlexStart = "flex-start";
	var FlexEnd = "flex-end";
	var SpaceBetween = "space-between";
	var SpaceAround = "space-around";
	var SpaceEvenly = "space-evenly";
}

enum abstract GridsNumber(Dynamic) from Bool from Int 
{
	var True = true;
	var Auto = "auto";

	var Grids_1 = 1;
	var Grids_2 = 2;
	var Grids_3 = 3;
	var Grids_4 = 4;
	var Grids_5 = 5;
	var Grids_6 = 6;
	var Grids_7 = 7;
	var Grids_8 = 8;
	var Grids_9 = 9;
	var Grids_10 = 10;
	var Grids_11 = 11;
	var Grids_12 = 12;
}

enum abstract GridSpacing(Int) to Int 
{
	var Spacing_0 = 0;
	var Spacing_1 = 1;
	var Spacing_2 = 2;
	var Spacing_3 = 3;
	var Spacing_4 = 4;
	var Spacing_5 = 5;
	var Spacing_6 = 6;
	var Spacing_7 = 7;
	var Spacing_8 = 8;
	var Spacing_9 = 9;
	var Spacing_10 = 10;
}

typedef GridClassProps<T> = Dynamic;

typedef GridProps = 
{
	>StandardDOMAttributes,
	?classes: GridClassProps<String>,
	?alignContent: GridAlignContent,
	?alignItems: GridAlignItems,
	?children: ReactFragment,
	?component: ReactType,
	?container: Bool,
	?direction: FlexDirection,
	?item: Bool,
	?justify: GridJustifyContent,
	?lg: GridsNumber,
	?md: GridsNumber,
	?sm: GridsNumber,
	?spacing: GridSpacing,
	?wrap: FlexWrap,
	?xl: GridsNumber,
	?xs: GridsNumber,
	?zeroMinWidth: Bool
};

@:jsRequire('@material-ui/core', 'Grid')
extern class Grid extends ReactComponentOfProps<GridProps>
{
}

