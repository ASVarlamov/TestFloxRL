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

	public class ShowIntroScreenCommand implements ICommand
	{
		[Inject]
		public var floxService:IFloxService;

		[Inject]
		public var contextView:ContextView;

		public function execute():void
		{
			floxService.logToIntro();

			contextView.view.removeChildren();
			contextView.view.addChild(new IntroScreen());
		}
	}
}
