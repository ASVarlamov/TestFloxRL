/**
 * Автор: Александр Варламов
 * Дата: 21.09.2015
 */
package
{
	import core.AppConfig;

	import flash.display.Sprite;
	import flash.events.Event;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	[SWF (backgroundColor="#222222")]
	public class Main extends Sprite
	{
		protected var _context:IContext;

		public function Main()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}

		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);

			_context = new Context().
					install(new MVCSBundle()).
					configure(new ContextView(this)).
					configure(new AppConfig());
		}
	}
}