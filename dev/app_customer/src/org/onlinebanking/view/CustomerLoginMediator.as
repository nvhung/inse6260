package org.onlinebanking.view
{
	import flash.events.MouseEvent;
	
	import org.onlinebanking.ApplicationFacade;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	
	public class CustomerLoginMediator extends Mediator
	{
		public static const NAME: String = "CustomerLoginMediator";
		
		
		public function CustomerLoginMediator(view: CustomerLogin)
		{
			super(NAME, view);
			
			initialize();
		}
		
		private function initialize(): void {
			view.btnContinue.addEventListener(MouseEvent.CLICK, handleContinueClick, false, 0, true);
		}
		
		protected function get view(): CustomerLogin {
			return viewComponent as CustomerLogin;
		}
		
		override public function listNotificationInterests(): Array
		{
			return [
			];
		}
		
		override public function handleNotification(note: INotification): void
		{
//			switch (note.getName()) {
//				case ApplicationFacade.NAVIGATE_TO_CUSTOMER_LOGIN:
//					view.selectedIndex = 1;
//					break;
//			}
		}
		
		private function handleContinueClick(event: MouseEvent): void {
			facade.sendNotification(ApplicationFacade.NAVIGATE_TO_CUSTOMER_PASSWORD);
		}
	}
}