package org.onlinebanking.vo
{
	public class AccountType
	{
		public static const CHECKING: int = 1;
		public static const SAVING: int = 2;
		public static const ISA: int = 3;
		public static const TFSA: int = 4;
		public static const OPEN_TERM_GIC: int = 5;
		public static const FIXED_TERM_GIC: int = 6;
		
		
		public static function toString(type: int): String {
			switch (type) {
				case CHECKING:
					return "Checking";
				case SAVING:
					return "Saving";
				case ISA:
					return "Investment Saving";
				case TFSA:
					return "Tax Free Investment Saving";
				case OPEN_TERM_GIC:
					return "Cashable GIC";
				case FIXED_TERM_GIC:
					return "Non-Redeemable GIC";
			}
			
			return null;
		}
	}
}