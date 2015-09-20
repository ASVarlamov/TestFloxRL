/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package controller
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.extensions.contextView.ContextView;

	import service.IFloxService;

	import view.introScreen.IntroScreen;

	public class InitCompleteCommand implements ICommand
	{
		[Inject]
		public var contextView:ContextView;

		[Inject]
		public var floxService:IFloxService;

		public function execute():void
		{
			floxService.init();

			contextView.view.addChild(new IntroScreen());
		}
	}
}
