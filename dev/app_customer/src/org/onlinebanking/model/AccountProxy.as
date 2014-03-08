package org.onlinebanking.model
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	
	import org.onlinebanking.vo.AccountType;
	import org.onlinebanking.vo.AccountVO;
	import org.onlinebanking.vo.TransactionVO;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class AccountProxy extends Proxy
	{
		public static const NAME: String = "AccountProxy";
		
		private var _accounts: ArrayList;
		
		
		public function AccountProxy()
		{
			super(NAME);
			
			_accounts = new ArrayList([
				new AccountVO(AccountType.CHECKING, "0001", 100),
				new AccountVO(AccountType.SAVING, "0002", 200),
				new AccountVO(AccountType.ISA, "0003", 300),
				new AccountVO(AccountType.TFSA, "0004", 400),
				new AccountVO(AccountType.OPEN_TERM_GIC, "0005", 500),
				new AccountVO(AccountType.FIXED_TERM_GIC, "0006", 600)
			]);
		}
		
		public function get accounts(): ArrayList {
			return _accounts;
		}
		
		public function get totalBalance(): Number {
			var ret: Number = 0;
			
			if (_accounts != null) {
				for (var index: int = 0; index < _accounts.length; index++) {
					ret += (_accounts.getItemAt(index) as AccountVO).balance;
				}
			}
			
			return ret;
		}
		
		public function getTransactions(account: AccountVO): ArrayCollection {
			var transactions: ArrayCollection = new ArrayCollection();
			
			transactions.addItem(new TransactionVO(new Date(2014, 2, 3), "IGA", 38.06, NaN, 136.34));
			transactions.addItem(new TransactionVO(new Date(2014, 2, 1), "Home Depot", 54.35, NaN, 176.78));
			
			return transactions;
		}
	}
}