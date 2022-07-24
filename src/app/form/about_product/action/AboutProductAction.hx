package app.form.about_product.action;

enum AboutProductAction
{
	ShowWin;
	UpdateComponents(components: Array<ComponentData>);
	Loading(loading: Bool);
}

typedef ComponentData = 
{
	name: String,
	version: String,
	buildDate: String
}