package org.onlinebanking.view
{
	import flash.events.MouseEvent;
	
	import org.onlinebanking.ApplicationFacade;
	import org.onlinebanking.model.AccountProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import spark.events.IndexChangeEvent;

	public class CustomerMediator extends Mediator
	{
		public static const NAME: String = "CustomerMediator";
		
		private var accountProxy: AccountProxy;
		
		public function CustomerMediator(view: Customer)
		{
			super(NAME, view);
			
			initialize();
		}
		
		private function initialize(): void {
			accountProxy = facade.retrieveProxy(AccountProxy.NAME) as AccountProxy;
			
//			view.menu.addEventListener(IndexChangeEvent.CHANGE, handleMenuIndexChange, false, 0, true);
			view.tabBar.addEventListener(IndexChangeEvent.CHANGE, handleTabBarChange, false, 0, true);
			view.header.btnSignOut.addEventListener(MouseEvent.CLICK, handleSignOutClick, false, 0, true);
		}
		
		protected function get view(): Customer {
			return viewComponent as Customer;
		}
		
		override public function listNotificationInterests(): Array
		{
			return [
				ApplicationFacade.NAVIGATE_TO_ACCOUNT_SUMMARY
			];
		}
		
		override public function handleNotification(note: INotification): void
		{
			switch (note.getName()) {
				case ApplicationFacade.NAVIGATE_TO_ACCOUNT_SUMMARY:
					
//					view.accounts = accountProxy.accounts;
//					view.accountSummary.accounts = accountProxy.accounts;
//					view.accountSummary.totalBalance = accountProxy.totalBalance;
//					
//					view.menu.selectedIndex = 0;
					break;
			}
		}
		
		private function handleTabBarChange(event: IndexChangeEvent): void {
			switch (event.newIndex) {
				case 0:
					facade.sendNotification(ApplicationFacade.NAVIGATE_TO_ACCOUNT_SUMMARY);
					break;
				case 1:
					facade.sendNotification(ApplicationFacade.NAVIGATE_TO_PAYMENTS);
					break;
				case 2: 
					break;
				case 3:
					break;
			}
		}
		
		private function handleSignOutClick(event: MouseEvent): void {
			facade.sendNotification(ApplicationFacade.LOGOUT);
		}
	}
}