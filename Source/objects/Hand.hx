package objects;

import openfl.display.Sprite;
import managers.CardsManager;
import utils.Utils;

class Hand extends Sprite {
    public function update(deltaTime:Float) {
		var dist = Utils.CARD_WIDTH + Utils.HAND_SPACING;
		var hand = CardsManager.instance.hand;
		var count = hand.length;
		for (i in 0...count) {
			if (!hand[i].dragging) {
				var newX = (dist * count * .5) - (dist * (count - i - .5));

				hand[i].x = Utils.Lerp(hand[i].x, newX, deltaTime * 5);
				hand[i].y = Utils.Lerp(hand[i].y, 0, deltaTime * 5);

				hand[i].scaleX = Utils.Lerp(hand[i].scaleX, 1, deltaTime * 5);
                hand[i].scaleY = Utils.Lerp(hand[i].scaleY, 1, deltaTime * 5);
			}
		}
    }
}
