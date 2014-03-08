package org.onlinebanking.view
{
	import flash.events.MouseEvent;
	
	import org.onlinebanking.ApplicationFacade;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class CustomerPasswordMediator extends Mediator
	{
		public static const NAME: String = "CustomerPasswordMediator";
		
		
		public function CustomerPasswordMediator(view: CustomerPassword)
		{
			super(NAME, view);
			
			initialize();
		}
		
		private function initialize(): void {
			view.btnLogin.addEventListener(MouseEvent.CLICK, handleLoginClick, false, 0, true);
		}
		
		protected function get view(): CustomerPassword {
			return viewComponent as CustomerPassword;
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
		
		private function handleLoginClick(event: MouseEvent): void {
			facade.sendNotification(ApplicationFacade.LOGIN);
		}
	}
}