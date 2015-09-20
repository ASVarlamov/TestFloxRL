/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package view.mainScreen
{
	import model.events.AppEvent;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class MainScreenMediator extends Mediator
	{
		[Inject]
		public var view:MainScreen;

		override public function initialize():void
		{
			addViewListener(AppEvent.SHOW_INTRO_SCREEN, onNeedShowIntro);
			addViewListener(AppEvent.SAVE_GAME_DATA, onNeedSave);

			addContextListener(AppEvent.SAVE_GAME_DATA_COMPLETE, onSaveComplete);

			view.init();
		}

		override public function destroy():void
		{
			removeViewListener(AppEvent.SHOW_INTRO_SCREEN, onNeedShowIntro);
			removeViewListener(AppEvent.SAVE_GAME_DATA, onNeedSave);

			removeContextListener(AppEvent.SAVE_GAME_DATA_COMPLETE, onSaveComplete);

			view.destroy();

			super.destroy();
		}

		private function onNeedSave(e:AppEvent):void
		{
			view.disable();
			dispatch(e);
		}

		private function onNeedShowIntro(e:AppEvent):void
		{
			dispatch(e);
		}

		private function onSaveComplete(e:AppEvent):void
		{
			view.enable();
		}
	}
}