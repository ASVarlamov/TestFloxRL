/**
 * Автор: Александр Варламов
 * Дата: 20.09.2015
 */
package core
{
	import controller.InitCompleteCommand;
	import controller.SaveDataCommand;
	import controller.ShowIntroScreenCommand;
	import controller.ShowMainScreenCommand;

	import flash.events.IEventDispatcher;

	import model.AppModel;

	import model.SaveDataModel;
	import model.events.AppEvent;

	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	import service.FloxService;
	import service.IFloxService;

	import view.introScreen.IntroScreen;
	import view.introScreen.IntroScreenMediator;
	import view.mainScreen.MainScreen;
	import view.mainScreen.MainScreenMediator;

	public class AppConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var commandMap:IEventCommandMap;

		[Inject]
		public var injector:IInjector;

		[Inject]
		public var context:IContext;

		[Inject]
		public var eventDispatcher:IEventDispatcher;

		public function configure():void
		{
			injector.map(SaveDataModel).asSingleton();
			injector.map(AppModel).asSingleton();

			injector.map(IFloxService).toSingleton(FloxService);

			mediatorMap.map(MainScreen).toMediator(MainScreenMediator);
			mediatorMap.map(IntroScreen).toMediator(IntroScreenMediator);

			commandMap.map(AppEvent.INIT_COMPLETE).toCommand(InitCompleteCommand);
			commandMap.map(AppEvent.SAVE_GAME_DATA).toCommand(SaveDataCommand);
			commandMap.map(AppEvent.SHOW_INTRO_SCREEN).toCommand(ShowIntroScreenCommand);
			commandMap.map(AppEvent.SHOW_MAIN_SCREEN).toCommand(ShowMainScreenCommand);

			eventDispatcher.dispatchEvent(new AppEvent(AppEvent.INIT_COMPLETE));
		}
	}
}
