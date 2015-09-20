/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package view.introScreen
{
	import flash.events.MouseEvent;

	import model.events.AppEvent;

	import view.base.BaseButton;
	import view.base.BaseScreen;

	public class IntroScreen extends BaseScreen
	{
		private var _btnGoToMain:BaseButton;

		public function IntroScreen()
		{
			super();
		}

		override public function init():void
		{
			_btnGoToMain = BaseButton.createButton("Go to Main");
			_btnGoToMain.addEventListener(MouseEvent.CLICK, onClick);

			_btnGoToMain.x = (stage.nativeWindow.width - _btnGoToMain.width) >> 1;
			_btnGoToMain.y = (stage.nativeWindow.height - _btnGoToMain.height) >> 1;

			addChild(_btnGoToMain);
		}

		override public function destroy():void
		{
			_btnGoToMain.removeEventListener(MouseEvent.CLICK, onClick);
			removeChildren();
		}

		private function onClick(e:MouseEvent):void
		{
			dispatchEvent(new AppEvent(AppEvent.SHOW_MAIN_SCREEN));
		}
	}
}