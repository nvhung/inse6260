package org.onlinebanking.vo
{
	[Bindable]
	public class TransactionVO
	{
		public var date: Date;
		public var description: String;
		public var debit: Number;
		public var credit: Number;
		public var balance: Number;
		
		
		public function TransactionVO(date: Date = null, description: String = null, debit: Number = NaN, credit: Number = NaN, balance: Number = NaN)
		{
			this.date = date;
			this.description = description;
			this.debit = debit;
			this.credit = credit;
			this.balance = balance;
		}
	}
}