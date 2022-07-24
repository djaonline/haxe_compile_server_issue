package app.form.about_product.reducer;

import app.form.about_product.action.AboutProductAction.ComponentData;

typedef AboutProductState =
{
	components: Array<ComponentData>,
	loading: Bool
} 