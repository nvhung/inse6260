package org.onlinebanking.view
{
	import flash.events.MouseEvent;
	
	import org.onlinebanking.ApplicationFacade;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	
	public class GuestHomeMediator extends Mediator
	{
		public static const NAME:String = 'GuestHomeMediator';
		
		
		public function GuestHomeMediator(view: GuestHome)
		{
			super(NAME, view);
			
			initialize();
		}
		
		protected function get view(): GuestHome {
			return viewComponent as GuestHome;
		}
		
		private function initialize(): void {
			view.btnLogin.addEventListener(MouseEvent.CLICK, handleLoginClick, false, 0, true);
		}
		
		override public function listNotificationInterests(): Array
		{
			return [
			];
		}
		
		override public function handleNotification(note: INotification): void
		{
//			switch ( note.getName() ) {
//				case LoginProxy.LOGIN_FAILED:
//					LoginPanel.loginVO = new LoginVO( );
//					loginPanel.loginStatus = LoginPanel.NOT_LOGGED_IN;
//					break;
//				case LoginProxy.LOGIN_SUCCESS:
//					loginPanel.loginStatus = LoginPanel.LOGGED_IN;
//					break;
//			}
		}
		
		private function handleLoginClick(event: MouseEvent): void {
			facade.sendNotification(ApplicationFacade.NAVIGATE_TO_CUSTOMER_LOGIN);
		}
	}
}