package org.onlinebanking.controller
{
	import org.onlinebanking.model.AccountProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	
	public class PrepareModelCommand extends SimpleCommand
	{
		override public function execute(note: INotification) : void
		{
			facade.registerProxy(new AccountProxy());
		}
	}
}