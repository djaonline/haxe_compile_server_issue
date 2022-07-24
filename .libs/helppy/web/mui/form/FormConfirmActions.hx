package helppy.web.mui.form;

import css.JustifyContent;
import helppy.core.lang.Language;
import helppy.web.lang.view.LangLabel;
import helppy.web.modal_new.action.ModalWinAction;
import mui.common.Color;
import mui.core.Box;
import mui.core.Button;
import mui.core.styles.MuiTheme.DefaultTheme;
import mui.core.styles.Styles.makeStyles;
import react.ReactEvent;
import react.ReactFragment;
import redux.Redux.Dispatch;
import react.ReactMacro.jsx;

using helppy.core.lang.LangManager;
using helppy.web.util.CssUtil;

typedef FormConfirmActionsProps =
{
	var ?confirmLabelId: String;
	var ?confirmStartIcon: ReactFragment;
	var ?fullWidth: Bool;
	var ?justifyContent: JustifyContent;
	var ?buttonPadding: String;
	var ?hideCancelButton: Bool;
	var ?autoHideModal: Bool;
	var ?marginTop: Float;
	var ?marginBottom: Float;
	var ?showDeleteButton: Bool;
	var ?onConfirm: Void -> Void;
	var ?onCancel: Void -> Void;
	var ?onDelete: Void -> Void;
	var dispatch: Dispatch;
} 

@:jsxStatic('render')
class FormConfirmActions
{
	static final useStyle = makeStyles((theme: DefaultTheme) -> 
	{
		root:
		{
			display: 'flex',
			width: '100%'
		},
		indent: 
		{
			marginLeft: theme.spacing(1)
		},
		padding:
		{
			padding: untyped props -> props.buttonPadding
		}
	});

	public static function render(props: FormConfirmActionsProps) 
	{
		final classes = useStyle(props);
		final hideModal = () -> props.dispatch(ModalWinAction.Hide);
		final onConfirm = (e: ReactEvent) ->
		{
			if (props.autoHideModal)
				hideModal();
			if (props.onConfirm != null)
				props.onConfirm();
		};
		final onCancel = (e: ReactEvent) ->
		{
			hideModal();
			if (props.onCancel != null)
				props.onCancel();
		};
		final onDelete = (e: ReactEvent) ->
		{
			hideModal();
			if (props.onDelete != null)
				props.onDelete();
		};
		final confirmLabelId = props.confirmLabelId == null ? 'ok' : props.confirmLabelId;
		final cancelBtn = props.hideCancelButton ? null :
			jsx('
				<$Button className=${classes.indent + " " + classes.padding}
					variant=${ButtonVariant.Contained} 
					color=${Color.Secondary}
					size=${ButtonSize.Small}
					fullWidth=${props.fullWidth}
					onClick=${onCancel}>
					<$LangLabel textId="cancel"
						name=${"cancel".getTextByLanguage(Language.RU)} />
				</$Button>
			');
		final deleteBtn = props.showDeleteButton ?
			jsx('
				<$Button className=${classes.indent + " " + classes.padding}
					variant=${ButtonVariant.Contained} 
					color=${Color.Secondary}
					size=${ButtonSize.Small}
					fullWidth=${props.fullWidth}
					onClick=${onDelete}>
					<$LangLabel textId="delete"
						name=${"delete".getTextByLanguage(Language.RU)} />
				</$Button>
			')
			: null;
		final justifyContent = props.justifyContent != null ? props.justifyContent : JustifyContent.Center;
		return jsx('
			<$Box className=${classes.root.addStyle(props)}
				justifyContent=${justifyContent}
				marginTop=${props.marginTop}
				marginBottom=${props.marginBottom}>
				<$Button className=${classes.padding}
					variant=${ButtonVariant.Contained} 
					color=${Color.Primary}
					size=${ButtonSize.Small}
					fullWidth=${props.fullWidth}
					startIcon=${props.confirmStartIcon}
					onClick=${onConfirm}>
					<$LangLabel textId=${confirmLabelId}
						name=${confirmLabelId.getTextByLanguage(Language.RU)} />
				</$Button>
				${cancelBtn}
				${deleteBtn}
			</$Box>
		');
	}
}