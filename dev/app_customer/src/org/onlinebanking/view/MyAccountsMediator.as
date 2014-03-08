package org.onlinebanking.view
{
	import flash.events.MouseEvent;
	
	import org.onlinebanking.ApplicationFacade;
	import org.onlinebanking.model.AccountProxy;
	import org.onlinebanking.vo.AccountVO;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import spark.events.IndexChangeEvent;

	
	public class MyAccountsMediator extends Mediator
	{
		public static const NAME: String = "MyAccountsMediator";
		
		private var accountProxy: AccountProxy;
		
		
		public function MyAccountsMediator(view: MyAccounts)
		{
			super(NAME, view);
			
			initialize();
		}
		
		private function initialize(): void {
			accountProxy = facade.retrieveProxy(AccountProxy.NAME) as AccountProxy;
			
			view.menu.addEventListener(IndexChangeEvent.CHANGE, handleMenuIndexChange, false, 0, true);
		}
		
		protected function get view(): MyAccounts {
			return viewComponent as MyAccounts;
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
					
					view.accounts = accountProxy.accounts;
					view.accountSummary.accounts = accountProxy.accounts;
					view.accountSummary.totalBalance = accountProxy.totalBalance;
					
					view.menu.selectedIndex = 0;
					break;
			}
		}
		
		private function handleLoginClick(event: MouseEvent): void {
//			facade.sendNotification(ApplicationFacade.LOGIN);
		}
		
		private function handleMenuIndexChange(event: IndexChangeEvent): void {
			if (event.newIndex == 0) {
				view.viewStack.selectedIndex = 0;
			}
			else {
				var account: AccountVO = accountProxy.accounts.getItemAt(event.newIndex - 1) as AccountVO;
				
				view.viewStack.selectedIndex = 1;
				view.account.account = account;
				view.account.transactions.dataProvider = accountProxy.getTransactions(account);
				view.account.transactions.rowCount = accountProxy.getTransactions(account).length;
				
			}
		}
	}
}