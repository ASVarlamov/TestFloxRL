/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package view.mainScreen
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import model.events.AppEvent;

	import view.base.BaseButton;
	import view.base.BaseScreen;

	public class MainScreen extends BaseScreen
	{
		private var _btnSave:BaseButton;
		private var _btnGoToIntro:BaseButton;

		public function MainScreen()
		{
			super();
		}

		override public function init():void
		{
			_btnSave = BaseButton.createButton("Save Data");
			_btnGoToIntro = BaseButton.createButton("Go to Intro");

			_btnGoToIntro.addEventListener(MouseEvent.CLICK, onNeedGoToIntro);
			_btnSave.addEventListener(MouseEvent.CLICK, onNeedSave);

			var container:Sprite = new Sprite();
			container.addChild(_btnGoToIntro);
			_btnSave.y = _btnGoToIntro.height + 4;
			container.addChild(_btnSave);

			container.x = (stage.nativeWindow.width - container.width) >> 1;
			container.y = (stage.nativeWindow.height - container.height) >> 1;

			addChild(container);
		}

		override public function destroy():void
		{
			_btnGoToIntro.removeEventListener(MouseEvent.CLICK, onNeedGoToIntro);
			_btnSave.removeEventListener(MouseEvent.CLICK, onNeedSave);
			removeChildren();
		}

		public function disable():void
		{
			_btnGoToIntro.mouseEnabled = _btnSave.mouseEnabled = false;
		}

		public function enable():void
		{
			_btnGoToIntro.mouseEnabled = _btnSave.mouseEnabled = true;
		}

		private function onNeedGoToIntro(e:MouseEvent):void
		{
			dispatchEvent(new AppEvent(AppEvent.SHOW_INTRO_SCREEN));
		}

		private function onNeedSave(e:MouseEvent):void
		{
			dispatchEvent(new AppEvent(AppEvent.SAVE_GAME_DATA));
		}
	}
}