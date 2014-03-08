package org.onlinebanking.controller
{
	import org.onlinebanking.ApplicationFacade;
	import org.onlinebanking.view.CustomerLoginMediator;
	import org.onlinebanking.view.CustomerMediator;
	import org.onlinebanking.view.CustomerPasswordMediator;
	import org.onlinebanking.view.GuestHomeMediator;
	import org.onlinebanking.view.Main;
	import org.onlinebanking.view.MainMediator;
	import org.onlinebanking.view.MyAccountsMediator;
	import org.onlinebanking.view.PaymentsMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	
	public class SignOutCommand extends SimpleCommand
	{
		override public function execute(note: INotification): void 
		{
			facade.sendNotification(ApplicationFacade.LOGOUT_SUCCESS);
		}
	}
}