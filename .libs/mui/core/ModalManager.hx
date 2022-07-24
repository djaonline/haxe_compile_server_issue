package mui.core;

typedef ModalManagerOptions = 
{
	?hideSiblingNodes: Bool,
	?handleContainerOverflow: Bool
}

@:jsRequire('@material-ui/core', 'ModalManager')
extern class ModalManager
{
	public function new(options: ModalManagerOptions);
	public function add(modal: Any, container: Any): Int;
	public function remove(modal: Any): Void;
	public function isTopModal(modal: Any): Bool;
}
