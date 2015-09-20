/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package model
{
	import com.gamua.flox.Entity;

	import service.FloxConsts;

	public class SaveDataModel extends Entity
	{
		private var _date:Number = -1;

		public function SaveDataModel()
		{
			super();
			id = FloxConsts.SAVE_ID;
		}

		public function get date():Number
		{
			return _date;
		}

		public function set date(value:Number):void
		{
			_date = value;
		}
	}
}
