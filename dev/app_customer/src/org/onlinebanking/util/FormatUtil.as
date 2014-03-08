package org.onlinebanking.util
{
	import flash.globalization.DateTimeStyle;
	import flash.globalization.NumberFormatter;
	
	import spark.formatters.DateTimeFormatter;

	public class FormatUtil
	{
		public static function formatCurrency(amount: Number, showCurrency: Boolean = true): String {
			var formatter: NumberFormatter = new NumberFormatter("en_US");
			formatter.fractionalDigits = 2;
			return isNaN(amount)
				? ""
				: "$" + formatter.formatNumber(amount) + (showCurrency ? " CAD" : "");
		}
		
		public static function formatDate(date: Date): String {
			var formatter: DateTimeFormatter = new DateTimeFormatter();
			
			formatter.dateStyle = DateTimeStyle.SHORT;
			formatter.timeStyle = DateTimeStyle.NONE;
			
			return formatter.format(date);
		}
	}
}