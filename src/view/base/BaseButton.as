/**
 * Автор: Александр Варламов
 * Дата: 03.02.2015
 */
package view.base
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class BaseButton extends Sprite
	{
		private var _textField:TextField;
		private var _button:SimpleButton;

		public static var textFieldFormat:TextFormat = new TextFormat(null, 20, 0xffffff, true);

		public function BaseButton(text:String,
		                           upState:DisplayObject = null,
		                           overState:DisplayObject = null,
		                           downState:DisplayObject = null,
		                           hitTestState:DisplayObject = null)
		{
			super();
			_button = new SimpleButton(upState, overState, downState, hitTestState);

			_textField = new TextField();
			_textField.width = upState.width - 10;
			_textField.height = upState.height - 4;
			_textField.defaultTextFormat = textFieldFormat;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.filters = [new GlowFilter(0x000000, .7, 2, 2, 2)];

			_textField.autoSize = TextFieldAutoSize.CENTER;
			_textField.text = text;

			_textField.x = (upState.width - _textField.width) * .5;
			_textField.y = (upState.height - _textField.height) * .5;
			_textField.mouseEnabled = false;

			addChild(_button);
			addChild(_textField);

		}

		public function setText(text:String):void
		{
			_textField.text = text;

			_textField.x = (_button.width - _textField.width) * .5;
			_textField.y = (_button.height - _textField.height) * .5;
		}

		public function get button():SimpleButton
		{
			return _button;
		}

		public static function createButton(title:String):BaseButton
		{
			var button:BaseButton = new BaseButton(
					title,
					drawShape(0x5f9a00, 240),
					drawShape(0xb3df53, 240),
					drawShape(0xc0c953, 240),
					drawShape(0xc0c953, 240)
			);
			button.mouseEnabled = true;
			button.useHandCursor = true;

			return button;
		}


		private static function drawShape(color:uint, width:int):Shape
		{
			var state_shape:Shape = new Shape();
			with (state_shape.graphics)
			{
				beginFill(color);
				drawRoundRect(0, 0, width, 40, 10, 10);
				endFill();
			}

			return state_shape;
		}

		public function get title():String
		{
			return _textField.text;
		}
	}
}
