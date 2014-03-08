package org.onlinebanking.view
{
	import org.onlinebanking.ApplicationFacade;
	import org.onlinebanking.model.AccountProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class PaymentsMediator extends Mediator
	{
		public static const NAME: String = "PaymentsMediator";
		
		private var accountProxy: AccountProxy;
		
		
		public function PaymentsMediator(view: Payments)
		{
			super(NAME, view);
			
			initialize();
		}
		
		private function initialize(): void {
			accountProxy = facade.retrieveProxy(AccountProxy.NAME) as AccountProxy;
			
//			view.menu.addEventListener(IndexChangeEvent.CHANGE, handleMenuIndexChange, false, 0, true);
		}
		
		protected function get view(): Payments {
			return viewComponent as Payments;
		}
		
		override public function listNotificationInterests(): Array
		{
			return [
				ApplicationFacade.NAVIGATE_TO_PAYMENTS
			];
		}
		
		override public function handleNotification(note: INotification): void
		{
			switch (note.getName()) {
				case ApplicationFacade.NAVIGATE_TO_PAYMENTS:
					
//					view.accounts = accountProxy.accounts;
//					view.accountSummary.accounts = accountProxy.accounts;
//					view.accountSummary.totalBalance = accountProxy.totalBalance;
//					
//					view.menu.selectedIndex = 0;
					break;
			}
		}
	}
}