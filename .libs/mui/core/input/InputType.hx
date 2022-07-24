package mui.core.input;

enum abstract InputType(String) to String 
{
	/** A push button with no default behavior. */
	var Button_ = "button";

	/** A check box allowing single values to be selected/deselected. */
	var Checkbox = "checkbox";

	/** HTML5 A control for specifying a color. A color picker's UI has no required features other than accepting simple colors as text (more info). */
	var Color = "color";

	/** HTML5 A control for entering a date (year, month, and day, with no time). */
	var Date = "date";

	/** HTML5 A control for entering a date and time, with no time zone. */
	var DateTimeLocal = "datetime-local";

	/** HTML5 A field for editing an e-mail address. */
	var Email = "email";

	/** A control that lets the user select a file. Use the accept attribute to define the types of files that the control can select. */
	var File = "file";

	/** A control that is not displayed but whose value is submitted to the server. */
	var Hidden = "hidden";

	/** A graphical submit button. You must use the src attribute to define the source of the image and the alt attribute to define alternative text. You can use the height and width attributes to define the size of the image in pixels. */
	var Image = "image";

	/** HTML5 A control for entering a month and year, with no time zone. */
	var Month = "month";

	/** HTML5 A control for entering a number. */
	var Number = "number";

	/** A single-line text field whose value is obscured. Use the maxlength and minlength attributes to specify the maximum length of the value that can be entered. */
	// Note: Any forms involving sensitive information like passwords (e.g. login forms) should be served over HTTPS; Firefox now implements multiple mechanisms to warn against insecure login forms — see Insecure passwords. Other browsers are also implementing similar mechanisms.
	var Password = "password";

	/** A radio button, allowing a single value to be selected out of multiple choices. */
	var Radio = "radio";

	/** HTML5 A control for entering a number whose exact value is not important. */
	var Range = "range";

	/** A button that resets the contents of the form to default values. */
	var Reset = "reset";

	/** HTML5 A single-line text field for entering search strings. Line-breaks are automatically removed from the input value. */
	var Search = "search";

	/** A button that submits the form. */
	var Submit = "submit";

	/** HTML5 A control for entering a telephone number. */
	var Tel = "tel";

	/** A single-line text field. Line-breaks are automatically removed from the input value. */
	var Text = "text";

	/** HTML5 A control for entering a time value with no time zone. */
	var Time = "time";

	/** HTML5 A field for entering a URL. */
	var Url = "url";

	/** HTML5 A control for entering a date consisting of a week-year number and a week number with no time zone. */
	var Week = "week";
}
