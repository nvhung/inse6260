package org.onlinebanking.view
{
	import flash.events.MouseEvent;
	
	import org.onlinebanking.ApplicationFacade;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class MainMediator extends Mediator
	{
		public static const NAME: String = "MainMediator";
		
		
		public function MainMediator(main: Main)
		{
			super(NAME, main);
			initialize();
		}
		
		private function initialize(): void {
			view.viewSigOutMessage.btnSignInAgain.addEventListener(MouseEvent.CLICK, handleSignInAgainClick, false, 0, true);
		}
		
		protected function get view(): Main {
			return viewComponent as Main;
		}
		
		override public function listNotificationInterests(): Array
		{
			return [
				ApplicationFacade.NAVIGATE_TO_CUSTOMER_LOGIN,
				ApplicationFacade.NAVIGATE_TO_CUSTOMER_PASSWORD,
				ApplicationFacade.LOGIN,
				ApplicationFacade.LOGOUT
			];
		}
		
		override public function handleNotification(note: INotification): void
		{
			switch (note.getName()) {
				case ApplicationFacade.NAVIGATE_TO_CUSTOMER_LOGIN:
					view.selectedIndex = 1;
					break;
				
				case ApplicationFacade.NAVIGATE_TO_CUSTOMER_PASSWORD:
					view.selectedIndex = 2;
					break;
				
				case ApplicationFacade.LOGIN:
					view.selectedIndex = 4;
					facade.sendNotification(ApplicationFacade.NAVIGATE_TO_ACCOUNT_SUMMARY);
					break;
				
				case ApplicationFacade.LOGOUT:
					view.selectedIndex = 5;
			}
		}
		
		private function handleSignInAgainClick(event: MouseEvent): void {
			facade.sendNotification(ApplicationFacade.NAVIGATE_TO_CUSTOMER_LOGIN);
		}
	}
}