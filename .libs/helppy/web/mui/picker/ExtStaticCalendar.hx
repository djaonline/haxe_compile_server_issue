package helppy.web.mui.picker;

import app.main.theme.ColorPallete;
import css.Overflow.OverflowCompo;
import helppy.core.data.Partial;
import js.html.HtmlElement;
import js.lib.Date as JsDate;
import js.lib.Object;
import js.npm.moment.IMoment;
import js.npm.moment.Moment;
import mui.core.IconButton;
import mui.core.Paper;
import mui.core.Tooltip;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.React;
import react.ReactComponent;
import react.ReactFragment;
import react.ReactMacro.jsx;

using helppy.web.util.CssUtil;

typedef DayData =
{
	?id: String,
	date: JsDate,
	?hintText: String
}

typedef ExtStaticCalendarProps =
{
	?date: JsDate,
	?holidays: Array<DayData>,
	?workdays: Array<DayData>,
	?focused: Bool,
	?isStatic: Bool,
	?onChange: DayData -> Void,
	?onClick: DayData -> Void,
	?onDoubleClick: DayData -> Void
}

class ExtStaticCalendar extends ReactComponentOfProps<ExtStaticCalendarProps>
{
	static final useStyle = makeStyles((theme: DefaultTheme) ->
	{
		container:
		{
			width: "300px",
			padding: theme.spacing(1.4, 2.2, 2.2, 2.2),
			border: '1px solid ${ColorPallete.TRASNPARENT}',
			borderRadius: theme.spacing(1),
			overflow: OverflowCompo.Hidden,
			'&:focus-within':
			{
				border: '1px solid ${ColorPallete.PRIMARY}'
			}
		},
		transitionContainer:
		{
			minHeight: "210px"
		},
		arrowHidden:
		{
			display: "none"
		}
	});

	var _container: HtmlElement;
	
	override function render()
	{
		return jsx('<$ExtStaticCalendarImpl />');
	}

	function ExtStaticCalendarImpl() 
	{
		final classes = useStyle();
		final arrowButtonProps = getArrowButtonProps();
		return jsx('
			<$Paper className=${classes.container.addStyle(props)}
				tabIndex=${0}
				ref=${onGetRef}>
				<$StaticCalendar classes=${{ 
						transitionContainer: classes.transitionContainer
					}}
					date=${getDate()}
					leftArrowButtonProps=${arrowButtonProps}
					rightArrowButtonProps=${arrowButtonProps}
					renderDay=${renderDay}
					onChange=${onChange} />
			</$Paper>
		');
	}

	function renderDay(day: IMoment, selectedDate: IMoment, dayInCurrentMonth: Bool, dayComponent: ReactFragment): ReactFragment
	{
		final data = getDayData(day.toDate());
		final style = getStyleByDay(day.toDate(), selectedDate.toDate(), dayInCurrentMonth);
		final component = React.cloneElement(dayComponent, 
		{ 
			style: style,
			onClick: onClick.bind(day.toDate()),
			onDoubleClick: onDoubleClick.bind(day.toDate())
		});
		return if (data.hintText != null)
			jsx('
				<$Tooltip title=${data.hintText}>
					<div>${component}</div>
				</$Tooltip>
			');
		else
			component;
	}

	function getDate(): IMoment
	{
		var date = new JsDate();
		if (props.date != null)
			date = props.date;
		return Moment.call(date);
	}

	function getStyleByDay(day: JsDate, selectedDate: JsDate, dayInCurrentMonth: Bool) 
	{
		final style = if (dayInCurrentMonth)
		{
			if (day.toDateString() == new JsDate().toDateString())
				getStyleForToday();
			else if (isHoliday(day))
				getStyleForHoliday();
			else
				getStyleForDay();
		}
		else
		{
			getStyleForDay();
		};
		final baseStyle = getBaseStyleForDay();
		Object.assign(baseStyle, style);
		return baseStyle;
	}

	function isHoliday(day: JsDate): Bool
	{
		return if (props.holidays != null)
		{
			final holidays = props.holidays.map((f) -> f.date.toDateString());
			final workdays = props.workdays.map((f) -> f.date.toDateString());
			final weekDay = day.getDay();
			(weekDay == 0 || weekDay == 6 || holidays.indexOf(day.toDateString()) != -1) && (workdays.indexOf(day.toDateString()) == -1);
		}
		else
		{
			false;
		}
	}

	function getBaseStyleForDay()
	{
		return { width: "28px", height: "28px", margin: "4px 5px" };
	}

	function getStyleForDay()
	{
		return { backgroundColor: ColorPallete.TRASNPARENT, color: ColorPallete.GREY_900 };
	}

	function getStyleForToday() 
	{
		return { backgroundColor: ColorPallete.PRIMARY, color: ColorPallete.WHITE };
	}

	function getStyleForHoliday()
	{
		return { backgroundColor: ColorPallete.SECONDARY, color: ColorPallete.PRIMARY };
	}

	function getArrowButtonProps(): Partial<IconButtonProps>
	{
		final classes = useStyle();
		return props.isStatic ? { classes: { root: classes.arrowHidden } } : null;
	}

	function findDayData(date: JsDate, days: Array<DayData>): DayData
	{
		if (days != null)
		{
			for (i in 0...days.length) 
			{
				final day = days[i];
				if (day.date.getTime() == date.getTime())
					return day;
			}
		}
		return null;
	}

	function getDayData(date: JsDate): DayData
	{
		final holidayData = findDayData(date, props.holidays);
		final workingData = findDayData(date, props.workdays);
		return if (holidayData != null)
			holidayData;
		else if (workingData != null)
			workingData;
		else
			{ date: date };
	}

	function onChange(date: IMoment) 
	{
		if (props.onChange != null)
			props.onChange(getDayData(date.toDate()));
	}

	function onClick(date: JsDate)
	{
		if (props.onClick != null)
			props.onClick(getDayData(date));		
	}

	function onDoubleClick(date: JsDate) 
	{
		if (props.onDoubleClick != null)
			props.onDoubleClick(getDayData(date));
	}

	function onGetRef(e: HtmlElement)
	{
		if (e != null)
			_container = e;
	}

	override function componentDidMount() 
	{
		if (props.focused && _container != null)
			_container.focus();
	}
}