package org.onlinebanking.data
{
	[Bindable]
	public class AccountSummaryData
	{
		public var type: String;
		public var accountNumber: String;
		public var balance: Number;
		
		public function AccountSummaryData(type: String = null, accountNumber: String = null, balance: Number = NaN)
		{
			this.type = type;
			this.accountNumber = accountNumber;
			this.balance = balance;
		}
	}
}