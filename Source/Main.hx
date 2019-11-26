package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import objects.*;
import utils.Utils;
import managers.CardsManager;

class Main extends Sprite {	
	private var _hand:Hand;
	private var _reserve:Reserve;
	private var _discard:Discard;

	// DELTA TIME
	private var _deltaTime:Float = 0;
	private var _curFrame:Float = 0;
	private var _prevFrame:Float = 0;

	public function new() {
		super();

		_hand = new Hand();
		_hand.x = stage.stageWidth / 2;
		_hand.y = stage.stageHeight - 50;
		addChild(_hand);

		_reserve = new Reserve();
		_reserve.x = stage.stageWidth / 2;
		_reserve.y = stage.stageHeight + 500;
		addChild(_reserve);

		_discard = new Discard();
		_discard.x = stage.stageWidth / 2;
		_discard.y = stage.stageHeight + 500;
		addChild(_discard);

		stage.color = Utils.PALETTE[0];

		stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);

		_prevFrame = Lib.getTimer();

		CardsManager.instance.SetupPiles(_hand, _reserve, _discard);
	}

	private function enterFrame(e:Event) {
		_curFrame = Lib.getTimer();
		_deltaTime = (_curFrame - _prevFrame) * 0.001;
		_prevFrame = _curFrame;

		_hand.update(_deltaTime);
		_reserve.update(_deltaTime);
		_discard.update(_deltaTime);
	}

	private function keyDown(e:KeyboardEvent) {
		trace("keyDown: " + e.keyCode);

		if (e.keyCode == 68) {
			CardsManager.instance.Draw();
		}
		if (e.keyCode == 82) {
			CardsManager.instance.Shuffle();
		}
	}
}