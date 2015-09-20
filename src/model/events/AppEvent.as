/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package model.events
{
	import flash.events.Event;

	public class AppEvent extends Event
	{
		public static const INIT_COMPLETE:String = "init complete";

		public static const SHOW_INTRO_SCREEN:String = "show intro screen";
		public static const SHOW_MAIN_SCREEN:String = "show main screen";

		public static const SAVE_GAME_DATA:String = "save game data";
		public static const SAVE_GAME_DATA_COMPLETE:String = "save game data complete";

		private var _data:Object;

		public function AppEvent(event_type:String, bubbles:Boolean = false, cancelable:Boolean = false, event_data:Object = null)
		{
			super(event_type, bubbles, cancelable);
			_data = event_data;
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}
	}
}