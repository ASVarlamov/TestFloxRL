/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package controller
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;

	import service.IFloxService;

	public class SaveDataCommand implements ICommand
	{
		[Inject]
		public var floxService:IFloxService;

		public function execute():void
		{
			floxService.save();
		}
	}
}
