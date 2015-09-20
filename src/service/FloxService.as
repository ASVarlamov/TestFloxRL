/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package service
{
	import com.gamua.flox.Flox;

	import core.AppSettings;

	import flash.events.IEventDispatcher;

	import model.AppModel;
	import model.SaveDataModel;
	import model.events.AppEvent;

	public class FloxService implements IFloxService
	{
		[Inject]
		public var appModel:AppModel;

		[Inject]
		public var saveModel:SaveDataModel;

		[Inject]
		public var eventDispatcher:IEventDispatcher;

		public function init():void
		{
			Flox.init(AppSettings.GAME_ID, AppSettings.GAME_KEY, AppSettings.API_VERSION);
		}

		public function logToMain():void
		{
			appModel.toMainClickCount++;
			Flox.logEvent(FloxConsts.EVENT_TO_MAIN, {times: appModel.toMainClickCount});
		}

		public function logToIntro():void
		{
			Flox.logEvent(FloxConsts.EVENT_TO_INTRO);
		}

		public function save():void
		{
			Flox.getTime(dateReceiveComplete, dateReceiveError);
		}

		private function dateReceiveComplete(date:Object):void
		{
			saveModel.date = (date as Date).date;
			saveModel.save(onSaveComplete, onSaveError);
		}

		private function dateReceiveError(data:Object = null):void
		{
			trace(data.toString());
		}

		private function onSaveComplete(data:Object = null):void
		{
			eventDispatcher.dispatchEvent(new AppEvent(AppEvent.SAVE_GAME_DATA_COMPLETE))
		}

		private function onSaveError(data:Object = null):void
		{
			trace("Error: ", JSON.stringify(data));
		}
	}
}
