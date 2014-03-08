package org.onlinebanking.vo
{
	import org.onlinebanking.util.FormatUtil;

	[Bindable]
	public class AccountVO
	{
		public var type: int; // AccountType
		public var accountNumber: String;
		public var balance: Number;
		
		public function AccountVO(type: int = 0, accountNumber: String = null, balance: Number = NaN)
		{
			this.type = type;
			this.accountNumber = accountNumber;
			this.balance = balance;
		}
		
		[Bindable(event="typeChanged")]
		public function getTypeLabel(): String {
			return AccountType.toString(type);
		}
		
		[Bindable(event="balanceChanged")]
		public function getFormattedBalance(): String {
			return FormatUtil.formatCurrency(balance);
		}
	}
}