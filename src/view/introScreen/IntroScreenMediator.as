/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package view.introScreen
{
	import model.events.AppEvent;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class IntroScreenMediator extends Mediator
	{
		[Inject]
		public var view:IntroScreen;

		override public function initialize():void
		{
			view.init();
			addViewListener(AppEvent.SHOW_MAIN_SCREEN, onNeedShowMain);
			super.initialize();
		}

		override public function destroy():void
		{
			removeViewListener(AppEvent.SHOW_MAIN_SCREEN, onNeedShowMain);
			view.destroy();
			super.destroy();
		}

		private function onNeedShowMain(event:AppEvent):void
		{
			dispatch(event);
		}
	}
}