package org.onlinebanking
{
	import org.onlinebanking.controller.SignOutCommand;
	import org.onlinebanking.controller.StartupCommand;
	import org.onlinebanking.view.Main;
	import org.puremvc.as3.patterns.facade.Facade;

	
	public class ApplicationFacade extends Facade
	{
		public static const STARTUP:String = "startup";
		
		public static const NAVIGATE_TO_CUSTOMER_LOGIN: String = "navigateToCustomerLogin";
		public static const NAVIGATE_TO_CUSTOMER_PASSWORD: String = "navigateToCustomerPassword";
		public static const NAVIGATE_TO_ACCOUNT_SUMMARY: String = "navigateToAccountSummary";
		public static const NAVIGATE_TO_ACCOUNT: String = "navigateToAccount";
		public static const NAVIGATE_TO_PAYMENTS: String = "navigateToPayments";
		
		public static const LOGIN: String = "login";
		public static const LOGOUT: String = "logout";
		public static const LOGOUT_SUCCESS: String = "logoutSuccess";
		
		
		public static function getInstance(): ApplicationFacade
		{
			if ( instance == null ) {
				instance = new ApplicationFacade( );
			}
			
			return instance as ApplicationFacade;
		}
		
		public function startup(main: Main): void
		{
			sendNotification(STARTUP, main);
		}
		
		override protected function initializeController( ) : void
		{
			super.initializeController();
			
			registerCommand(STARTUP, StartupCommand);
			registerCommand(LOGOUT, SignOutCommand);
		}
	}
}