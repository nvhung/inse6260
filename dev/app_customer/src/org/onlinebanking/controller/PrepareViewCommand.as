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

	
	public class PrepareViewCommand extends SimpleCommand
	{
		override public function execute(note: INotification): void 
		{
			var main: Main = note.getBody() as Main;
			
			facade.registerMediator(new MainMediator(main));
			facade.registerMediator(new GuestHomeMediator(main.viewGuestHome));
			facade.registerMediator(new CustomerLoginMediator(main.viewCustomerLogin));
			facade.registerMediator(new CustomerPasswordMediator(main.viewCustomerPassword));
			
			facade.registerMediator(new CustomerMediator(main.viewCustomer));
			
			facade.registerMediator(new MyAccountsMediator(main.viewCustomer.tabMyAccounts));
			facade.registerMediator(new PaymentsMediator(main.viewCustomer.tabPayments));
		}
	}
}