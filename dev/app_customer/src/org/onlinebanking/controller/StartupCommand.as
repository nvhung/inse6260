package org.onlinebanking.controller
{
	import org.puremvc.as3.patterns.command.MacroCommand;

	public class StartupCommand extends MacroCommand
	{
		override protected function initializeMacroCommand() : void
		{
			addSubCommand(PrepareModelCommand);
			addSubCommand(PrepareViewCommand);
		}
	}
}