(function (lib, img, cjs) {

var p; // shortcut to reference prototypes

// library properties:
lib.properties = {
	width: 1280,
	height: 1024,
	fps: 12,
	color: "#FFFFFF",
	manifest: [
		{src:"sounds/btn05.mp3", id:"btn05"}
	]
};



// symbols:



// stage content:
(lib.ろ = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_17 = function() {
		playSound("btn05");
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(17).call(this.frame_17).wait(19));

	// FlashAICB
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#FF00FF").s().p("Ai8WHQgXgPgIgdQgIgeALgaQANgdAhgLIAogOQEphpD7ieQCShcBlhaQB+hvBKh4QCbj7hbkPQhJjai5hPQhRgjhwgHQhjgGhrASQjnAlj5BuQjnBkjgCJQhlA+hWA+QhKA0g+A0QgYAUgdABQgeABgXgWQgRgRgEgbQgFgcAPgTIAMgPIgBAAIABAAQCUi+DpjXQEgkBCPiBQEFjrCAiTQCOiiBaigQhCAMhOATIkSBEQlNBJjeg/QghgKgNgcQgMgZAIgdQAIgeAXgPQAagRAhAJQB1AiCTgLQBngICggkIEKhBQCdgkBygMQAsgFATAqQARAmgQAmQhiDmjNDrQiKCekCDqQh6BvjrDOQERiREIhOQEChMDMAKQEIAMCgCbQBbBYA3CAQA0B4ALCFQAMCSg2CTQgyCGhjB8QlNGfrPDzQgNAEgMAAQgSAAgPgJg");
	this.shape.setTransform(640,512);

	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("#241916").s().p("AgHD+QhJhIgPiHQgGiZgQhKQgHgiATgaQAQgXAegIQAdgIAYAMQAZANAHAiQAJAqADA+IAGBoQAFA3AHAdQANAwAcAcQAYAYgCAfQgCAbgVAWQgWAVgcACIgFAAQgcAAgUgVg");
	this.shape_1.setTransform(572.7,393);

	this.shape_2 = new cjs.Shape();
	this.shape_2.graphics.f("#241916").s().p("AsXN3QgagPgJgfQgKghASgYQCWjDDzjjQEhkACMh/QEFjrCCiUQCPiiBaigQhCANhPATIkUBDQlLBKjehAQgggJgOgcQgLgZAIgeQAIgdAXgQQAZgRAhAKQB1AhCTgLQBmgICfgkIEMhAQCdglBygMQAsgEATApQASAmgQAmQhjDnjNDrQiJCdkEDoQiJB+kdD6QjzDfiSC9QgTAagbAIQgKADgKAAQgSAAgSgKg");
	this.shape_2.setTransform(611.6,483);

	this.shape_3 = new cjs.Shape();
	this.shape_3.graphics.f("#241916").s().p("Ai+LZQgXgQgIgdQgIgdAMgZQANgcAhgJQEehLDnhqQCShDBig7QCChOBZhYQBThRAohQQAzhmgYheQgvi+iMhSQiahakCAPQjlAOkaBaQnqCaloDsQgdATgcgJQgagIgPgbQgQgaAFgcQAFgfAcgTIAGgEQF0jyHyidQEhhbDRgUQEkgcDQBgQBoAxBMBWQBKBWAlBuQArCDggCEQgeB6heBvQhcBtiNBgQhyBNieBLQkcCHk9BUQgLACgKAAQgUAAgSgLg");
	this.shape_3.setTransform(640.2,584.5);

	this.shape_4 = new cjs.Shape();
	this.shape_4.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgLi2QAAjMgOheQgFggAMgZQAOgbAfgIQAcgIAdAPQAdAQAEAdQAJA7AEBZIAHCUQAFBUAJAsQAPBIAiAvQASAYgKAhQgJAfgaAPQgSAKgSAAQgKAAgKgDg");
	this.shape_4.setTransform(571.7,388.7);

	this.shape_5 = new cjs.Shape();
	this.shape_5.graphics.f("#241916").s().p("AsXN3QgZgPgKgfQgKghASgYQCWjDD0jjQEgkBCMh/QEEjpCDiVQCPihBaihQhCANhPATIkUBDQlLBKjehAQgggJgOgcQgLgaAIgdQAIgdAXgQQAZgRAhAKQB1AhCTgLQBngICegkQCzgsBZgUQCdglBygMQAsgEATApQASAmgQAmQhjDnjNDqQiKCfkDDnQiJB+kdD6QjzDfiRC9QgUAagaAIQgLADgKAAQgSAAgSgKg");
	this.shape_5.setTransform(610.5,486.8);

	this.shape_6 = new cjs.Shape();
	this.shape_6.graphics.f("#241916").s().p("AlEKkQgWgYAAgeQAAgfAXgVQAUgTAggEQEiggEPhRQCegwBqgvQCOg/BhhQQDGimgojCQgni9iahaQiahaj4gKQjogKkNAwQjjAojUA+QjnBDiyBUQgfAOgegMQgbgKgPgaQgQgbAGgaQAGgcAfgPQA7gcBMgeQHOi3Hig3QEXggDFAZQENAhCkCMQBUBJAyBoQAxBnAGBxQAGB9hBB2Qg7BqhsBVQhwBZiXBFQh+A5ijAwQkcBUk9AjIgHAAQgZAAgVgVg");
	this.shape_6.setTransform(641.7,601.1);

	this.shape_7 = new cjs.Shape();
	this.shape_7.graphics.f("#241916").s().p("Aj4BJQgigIgNgcQgMgYAIgcQAIgdAYgQQAZgSAiAJQAQAEAZgCIAqgFQA0gHA9AAIB4ACQBIACAygCQAigCAVAXQASAUAAAfQAAAcgSAWQgVAYgiACQgxAChbgDQhfgCgsABQghABhDAIQgUACgSAAQgjAAgagHg");
	this.shape_7.setTransform(594.3,376.3);

	this.shape_8 = new cjs.Shape();
	this.shape_8.graphics.f("#241916").s().p("AhSCEQh3gPhOgaQhxglg2hCQgUgagBgbQgBgfAWgWQAVgVAhgBQAigCASAYQAXAcAlATQAdAPAsAMQBuAeBFAEQBRAGCCgGQCzgHAhAAQAiAAAUAVQATAVAAAeQAAAfgTAVQgUAYgiAAQhQAAigAJIhOABQhaAAhFgJg");
	this.shape_8.setTransform(578.1,641.6);

	this.shape_9 = new cjs.Shape();
	this.shape_9.graphics.f("#241916").s().p("Ar1LIQgcgCgVgWQgWgVgCgcQgCgfAYgYQCaibDziuQEcjDCKhgQEIi4ByhiQCBhvBXhxQg6AJhCAMIkUA0QlLA5jdgxQgigIgNgbQgMgYAIgdQAIgeAXgQQAagSAiAHQB1AaCTgJQBlgGCggcIENgyQCdgcBwgKQArgDAVAoQAVAogUAkQhqDAjSC4Qh/BxkLC4QiIBhkbDBQjyCsiYCZQgWAWgbAAIgGAAg");
	this.shape_9.setTransform(612.4,491);

	this.shape_10 = new cjs.Shape();
	this.shape_10.graphics.f("#241916").s().p("AlDKkQgXgYAAgeQAAgfAXgVQAUgTAggEQEjggEOhRQCegwBqgvQCOg/BhhQQDGimgojCQgni+iahZQiahaj4gKQjogKkNAwQjjAojTA+QjnBDizBUQgfAOgegMQgbgKgPgaQgQgbAGgaQAGgcAfgPQBJghA+gYQHOi4Hig3QEXggDFAZQEOAiCjCMQBUBIAyBoQAxBnAGBxQAHB9hCB2Qg6BphtBWQhwBZiXBFQh+A5ijAwQkZBUlAAjIgHAAQgZAAgUgVg");
	this.shape_10.setTransform(640,585.4);

	this.shape_11 = new cjs.Shape();
	this.shape_11.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgLi3QAAjLgOheQgFggANgZQAOgbAegJQAdgHAdAPQAcAQAFAdQAJA7AEBZIAGCUQAFBVAJArQAPBIAjAvQARAYgKAhQgJAfgZAPQgSAKgTAAQgKAAgKgDg");
	this.shape_11.setTransform(573.2,408.3);

	this.shape_12 = new cjs.Shape();
	this.shape_12.graphics.f("#241916").s().p("AnGBLQgigBgUgXQgSgVAAgeQAAgdASgVQAUgYAiAAIOMAAQAjAAAUAYQASAVAAAdQAAAegSAVQgUAXgjABg");
	this.shape_12.setTransform(626.9,377.9);

	this.shape_13 = new cjs.Shape();
	this.shape_13.graphics.f("#241916").s().p("AAUEHQhhhegtiHQgwiQAph5QALggAdgNQAbgMAdAIQAdAIANAXQAQAZgLAhQgbBVAjBoQAhBcBHBDQAZAYgCAfQgCAbgVAWQgWAVgcACIgGAAQgcAAgWgVg");
	this.shape_13.setTransform(534,611.1);

	this.shape_14 = new cjs.Shape();
	this.shape_14.graphics.f("#241916").s().p("AhSCFQh4gQhNgZQhxgng2hBQgUgagBgbQgBgfAWgWQAVgVAhgBQAigBASAXQAWAcAmATQAdAPAsAMQBtAeBGAEQBRAGCCgFQCwgIAkAAQAiAAAUAVQATAVAAAfQAAAegTAWQgUAXgiAAIjwAJIhQABQhZAAhEgIg");
	this.shape_14.setTransform(580.9,639.5);

	this.shape_15 = new cjs.Shape();
	this.shape_15.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgLi3QAAjMgOheQgFggANgYQAOgcAegIQAdgIAdAQQAcAQAEAdQAKA7ADBZIAHCUQAFBVAJArQAPBIAiAvQASAYgKAhQgJAfgaAPQgRAKgTAAQgKAAgKgDg");
	this.shape_15.setTransform(583.4,408.5);

	this.shape_16 = new cjs.Shape();
	this.shape_16.graphics.f("#241916").s().p("Ar1LIQgcgCgVgWQgWgVgCgcQgCgfAYgYQCaibDyiuQCMhkEbi+QEKi6BvhgQCBhwBYhxQg6AJhCAMQi4AlhcAPQlLA5jdgxQgigIgNgbQgMgYAIgdQAIgeAXgQQAagSAiAHQB0AaCUgJQBmgGCfgcQBagPCygjQCegcBwgKQArgDAVApQAVAngUAkQhqDAjSC4Qh/BwkLC5QkYC/iLBjQjyCsiYCZQgWAWgbAAIgGAAg");
	this.shape_16.setTransform(622.5,488);

	this.shape_17 = new cjs.Shape();
	this.shape_17.graphics.f("#241916").s().p("AlEKjQgWgYAAgdQAAggAXgUQAUgTAggEQEkghENhRQCegvBqgvQCOg/BhhRQDGilgojDQgmi8ibhbQiahZj4gLQjogJkNAwQjiAojVA+QjmBDizBTQgfAPgegMQgbgLgPgaQgQgaAGgaQAGgdAfgOQA9gdBKgdQHQi3Hgg4QEXggDFAZQENAiCkCMQBUBIAyBpQAxBnAGBwQAHB9hCB2Qg6BqhtBWQhwBYiXBFQh+A6ijAwQkXBTlCAkIgHABQgZAAgVgXg");
	this.shape_17.setTransform(650.1,582.5);

	this.shape_18 = new cjs.Shape();
	this.shape_18.graphics.f("#241916").s().p("ApfBLQgigBgUgXQgSgVAAgeQAAgdASgVQAUgYAiAAIS+AAQAiAAAVAYQASAVAAAdQAAAegSAVQgVAXgiABg");
	this.shape_18.setTransform(641.4,376.4);

	this.shape_19 = new cjs.Shape();
	this.shape_19.graphics.f("#241916").s().p("AA5H2Qh6hOhCifQg7iOADifQADibA+h3QBFiGB/g9QAfgPAeAMQAbAKAPAbQAPAagFAaQgHAdgfAOQhhAvgxBjQgqBZACB1QACB4AkBkQAtB6BXA3QAdASAFAfQAFAcgQAaQgPAbgaAIQgKADgKAAQgTAAgTgMg");
	this.shape_19.setTransform(538.3,595.9);

	this.shape_20 = new cjs.Shape();
	this.shape_20.graphics.f("#241916").s().p("AhSCFQh5gQhMgZQhxgmg2hCQgUgagBgbQgBgfAWgWQAVgVAhgBQAigBATAXQAWAcAlATQAeAPArAMQBtAeBGAFQBRAFCCgFQCtgIAnAAQAiAAAVAVQASAVAAAfQAAAegSAWQgVAXgiAAIjwAJIhOABQhaAAhFgIg");
	this.shape_20.setTransform(580.5,640.9);

	this.shape_21 = new cjs.Shape();
	this.shape_21.graphics.f("#241916").s().p("AlDKkQgXgYAAgeQAAggAXgUQAUgTAggEQEpgiEIhQQCegvBqgvQCOg/BhhQQDHimgpjCQgni+iahZQiZhaj5gLQjogJkNAwQjiAojUA+QjnBDizBTQgfAPgegMQgbgKgPgbQgQgaAGgaQAGgdAfgOQA/gdBIgdQHRi3Hgg4QEWggDFAZQEOAiCjCMQBUBIAyBpQAxBmAGBxQAHB9hCB2Qg6BqhtBWQhwBYiXBFQh9A6ikAwQkXBTlCAkIgHABQgZAAgUgWg");
	this.shape_21.setTransform(649.7,583.9);

	this.shape_22 = new cjs.Shape();
	this.shape_22.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgLi3QAAjMgOheQgFggANgYQAOgbAegJQAdgIAdAQQAcAQAFAdQAJA7AEBZIAGCUQAFBVAJArQAPBIAjAvQARAYgKAhQgJAfgZAPQgSAKgSAAQgKAAgLgDg");
	this.shape_22.setTransform(582.6,410.7);

	this.shape_23 = new cjs.Shape();
	this.shape_23.graphics.f("#241916").s().p("AsnKIQgdgDgWgWQgVgVgBgbQgCgdAagXQCmiOD8iZQCShYEnimQEgioBzhUQCOhnBihtQg3AEg/AHQi7AWhdAJQlPAejYhCQghgKgNgdQgMgZAIgeQAIgdAXgPQAagRAhAKQDNA/FGggQBagIC0gXQCggRBrgBQAqAAAXAmQAXAngXAkQh5C2jcCnQiKBpkSCfQkpCoiUBYQkCCaikCMQgWATgbAAIgIAAg");
	this.shape_23.setTransform(621.6,490);

	this.shape_24 = new cjs.Shape();
	this.shape_24.graphics.f("#241916").s().p("AgdEPQgagNgGgiQgShbgCh8IAAjWQAAgiAYgUQAVgSAfAAQAcAAAVASQAXAUAAAiIgCDEQABBxAPBQQAGAigSAaQgSAXgdAIQgMADgKAAQgPAAgOgHg");
	this.shape_24.setTransform(743,570.9);

	this.shape_25 = new cjs.Shape();
	this.shape_25.graphics.f("#241916").s().p("AvFBLQgjAAgTgYQgTgVABgeQgBgdATgVQATgXAjgBIeLAAQAiABAUAXQASAVABAdQgBAegSAVQgUAYgiAAg");
	this.shape_25.setTransform(635.9,550.3);

	this.shape_26 = new cjs.Shape();
	this.shape_26.graphics.f("#241916").s().p("AgyCgQgXgUgBgiIAAjTQABgjAXgUQAVgSAdAAQAeAAAVASQAYAUgBAjIAADTQABAigYAUQgVATgeAAQgdAAgVgTg");
	this.shape_26.setTransform(702.9,388.3);

	this.shape_27 = new cjs.Shape();
	this.shape_27.graphics.f("#241916").s().p("ApeBLQgigBgVgXQgSgVAAgeQAAgdASgVQAVgYAiAAIS+AAQAiAAAUAYQASAVAAAdQAAAegSAVQgUAXgiABg");
	this.shape_27.setTransform(641.6,375.2);

	this.shape_28 = new cjs.Shape();
	this.shape_28.graphics.f("#241916").s().p("AhSCFQh4gQhNgZQhxgng2hBQgUgagBgbQgBgfAWgWQAVgVAhgBQAigCASAYQAXAcAlATQAdAPAsAMQBuAeBFAEQBRAGCCgFQCwgIAkAAQAiAAAUAVQATAVAAAfQAAAegTAWQgUAXgiAAIjwAJIhQABQhZAAhEgIg");
	this.shape_28.setTransform(575.8,642.2);

	this.shape_29 = new cjs.Shape();
	this.shape_29.graphics.f("#241916").s().p("AqbEqQgWgYAAgdQAAggAWgVQAVgTAggDQC1gUCMgaQCsgfCNguQCrg1B5hGQCXhXBWh3QATgaAbgIQAdgIAcAQQAZAPAJAfQAKAggRAYQjAEFmKCCQj+BVnFAyIgHAAQgZAAgVgWg");
	this.shape_29.setTransform(679.3,622.9);

	this.shape_30 = new cjs.Shape();
	this.shape_30.graphics.f("#241916").s().p("AsnKIQgdgDgWgWQgVgVgBgbQgCgdAagXQCmiOD8iZQCShZEnimQEhipByhSQCPhoBihsQg4AEhAAHQi6AWhdAIQlQAfjXhCQghgKgNgdQgMgaAIgdQAIgdAXgPQAagRAhAKQDNA/FGggQBagJC0gWQCggSBrAAQApAAAYAmQAXAngXAkQh5C2jcCnQiMBqkQCeQkpCoiUBYQkCCaikCMQgWATgbAAIgIAAg");
	this.shape_30.setTransform(616.9,491.4);

	this.shape_31 = new cjs.Shape();
	this.shape_31.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgKi3QgBjMgOheQgFggANgYQAOgbAegJQAdgIAdAQQAcAQAFAdQAJA7AEBZIAGCUQAFBVAJArQAPBIAjAvQARAYgKAhQgJAfgZAPQgSAKgSAAQgKAAgLgDg");
	this.shape_31.setTransform(584.5,405.9);

	this.shape_32 = new cjs.Shape();
	this.shape_32.graphics.f("#241916").s().p("AgyILQgYgVABgiIAAunQgBgjAYgUQAVgSAdAAQAeAAAVASQAXAUAAAjIAAOnQAAAigXAVQgVASgeAAQgdAAgVgSg");
	this.shape_32.setTransform(745.6,597.8);

	this.shape_33 = new cjs.Shape();
	this.shape_33.graphics.f("#241916").s().p("AosBKQgjABgUgYQgSgVAAgeQAAgdASgVQAUgYAjAAIRZAAQAiAAAUAYQATAVAAAdQAAAegTAVQgUAYgigBg");
	this.shape_33.setTransform(688.9,644.7);

	this.shape_34 = new cjs.Shape();
	this.shape_34.graphics.f("#241916").s().p("AvFBKQgiABgVgYQgSgVAAgeQAAgdASgVQAVgXAiAAIeKAAQAjAAAUAXQASAVAAAdQAAAegSAVQgUAYgjgBg");
	this.shape_34.setTransform(648.1,550.3);

	this.shape_35 = new cjs.Shape();
	this.shape_35.graphics.f("#241916").s().p("AgyFDQgYgUABgjIAAoYQgBgiAYgUQAVgSAdAAQAeAAAVASQAXAUAAAiIAAIYQAAAjgXAUQgVASgeAAQgdAAgVgSg");
	this.shape_35.setTransform(715.1,404.5);

	this.shape_36 = new cjs.Shape();
	this.shape_36.graphics.f("#241916").s().p("ApeBKQgjABgUgYQgSgVAAgeQAAgdASgVQAUgYAjAAIS9AAQAiAAAVAYQASAVAAAdQAAAegSAVQgVAYgigBg");
	this.shape_36.setTransform(653.9,375.1);

	this.shape_37 = new cjs.Shape();
	this.shape_37.graphics.f("#241916").s().p("AA5H2Qh6hOhCifQg7iOADigQADiaA+h4QBFiFB/g9QAfgPAeAMQAbAKAPAbQAPAagFAaQgHAdgfAOQhhAvgxBjQgqBZACB1QACB4AkBkQAtB6BXA3QAdASAFAfQAFAcgQAaQgPAbgaAIQgKADgKAAQgTAAgTgMg");
	this.shape_37.setTransform(545.8,597.2);

	this.shape_38 = new cjs.Shape();
	this.shape_38.graphics.f("#241916").s().p("AhSCFQh5gQhMgZQhxgmg2hCQgUgagBgbQgBgfAWgWQAVgVAhgBQAigBATAXQAWAcAlATQAeAPArAMQBuAeBGAEQBQAGCCgFQCwgIAkAAQAiAAAVAVQASAVAAAfQAAAegSAWQgVAXgiAAIjvAJIhOABQhbAAhFgIg");
	this.shape_38.setTransform(588,642.2);

	this.shape_39 = new cjs.Shape();
	this.shape_39.graphics.f("#241916").s().p("AsnKIQgdgDgWgWQgVgVgBgbQgCgdAagXQCmiOD8iZQCShYEnimQEgioBzhUQCOhnBihtQg3AEg/AHQi7AWhdAJQlPAejYhCQghgKgNgdQgLgZAIgeQAIgdAXgPQAZgRAhAKQDNA/FGggQBagIC0gXQCggRBrgBQAqAAAXAmQAXAngXAkQh5C2jcCnQiKBpkSCfQkpCoiUBYQkCCaikCMQgWATgbAAIgIAAg");
	this.shape_39.setTransform(629.1,491.3);

	this.shape_40 = new cjs.Shape();
	this.shape_40.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgLi3QAAjLgOheQgFggAMgZQAOgbAfgJQAcgIAdAQQAdAQAEAdQAJA7AEBZIAHCUQAFBUAJAsQAPBIAiAvQASAYgKAhQgJAfgaAPQgSAKgSAAQgKAAgKgDg");
	this.shape_40.setTransform(596.8,405.8);

	this.shape_41 = new cjs.Shape();
	this.shape_41.graphics.f("#241916").s().p("AgyILQgYgVAAgiIAAunQAAgjAYgUQAVgSAdAAQAeAAAVASQAYAUgBAjIAAOnQABAigYAVQgVASgeAAQgdAAgVgSg");
	this.shape_41.setTransform(544.5,599.2);

	this.shape_42 = new cjs.Shape();
	this.shape_42.graphics.f("#241916").s().p("AgyILQgYgVAAgiIAAunQAAgjAYgUQAVgSAdAAQAeAAAVASQAXAUABAjIAAOnQgBAigXAVQgVASgeAAQgdAAgVgSg");
	this.shape_42.setTransform(738.6,599.9);

	this.shape_43 = new cjs.Shape();
	this.shape_43.graphics.f("#241916").s().p("AvFBKQgiABgUgYQgSgVAAgeQAAgdASgVQAUgYAiAAIeLAAQAiAAAUAYQASAVAAAdQAAAegSAVQgUAYgigBg");
	this.shape_43.setTransform(641.1,646.8);

	this.shape_44 = new cjs.Shape();
	this.shape_44.graphics.f("#241916").s().p("AvFBKQgiABgUgYQgSgVAAgeQAAgdASgVQAUgXAiAAIeLAAQAiAAAUAXQASAVAAAdQAAAegSAVQgUAYgigBg");
	this.shape_44.setTransform(641.1,552.4);

	this.shape_45 = new cjs.Shape();
	this.shape_45.graphics.f("#241916").s().p("ApfBKQgiABgUgYQgSgVAAgeQAAgdASgVQAUgYAiAAIS+AAQAjAAAUAYQASAVAAAdQAAAegSAVQgUAYgjgBg");
	this.shape_45.setTransform(646.9,377.3);

	this.shape_46 = new cjs.Shape();
	this.shape_46.graphics.f("#241916").s().p("AozA6QghgKgNgdQgMgXAIgeQAIgdAXgPQAagRAgAKQDOA/FFggQBbgIC0gXQCggRBrgBQAiAAAUAXQASAVAAAfQAAAcgSAWQgUAXgiAAQhvABinARQi6AWhbAJQhqAKheAAQjNAAiUgug");
	this.shape_46.setTransform(648.1,439.1);

	this.shape_47 = new cjs.Shape();
	this.shape_47.graphics.f("#241916").s().p("AsoKGQgdgDgVgVQgWgWgBgaQgBgeAagWQCliOD8iZQCShZEnimQEfinB0hUQDcigByisQATgdAggFQAcgEAaAPQAbAPAIAaQAJAdgTAcQh4C3jcCmQiLBpkSCfQkpCoiUBZQkCCZijCNQgXATgaAAIgJgBg");
	this.shape_47.setTransform(622.2,493.6);

	this.shape_48 = new cjs.Shape();
	this.shape_48.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgLi3QAAjLgOheQgFghANgYQANgbAfgJQAdgIAdAQQAcAQAEAdQAKA7ADBZIAHCUQAFBVAJArQAPBIAiAvQASAYgKAhQgJAfgaAPQgSAKgSAAQgKAAgKgDg");
	this.shape_48.setTransform(589.8,408);

	this.shape_49 = new cjs.Shape();
	this.shape_49.graphics.f("#241916").s().p("AouBKQgiAAgUgXQgSgVAAgeQAAgdASgVQAUgYAiABIRcAAQAjgBAUAYQASAVAAAdQAAAegSAVQgUAXgjAAg");
	this.shape_49.setTransform(648.7,449.1);

	this.shape_50 = new cjs.Shape();
	this.shape_50.graphics.f("#241916").s().p("AgyIKQgXgUgBgiIAAuoQABghAXgVQAVgSAdAAQAeAAAVASQAXAVABAhIAAOoQgBAigXAUQgVATgeAAQgdAAgVgTg");
	this.shape_50.setTransform(543,588.3);

	this.shape_51 = new cjs.Shape();
	this.shape_51.graphics.f("#241916").s().p("AvFBKQgiAAgUgXQgSgVgBgeQABgdASgVQATgYAjABIeLAAQAigBAUAYQATAVAAAdQAAAegTAVQgUAXgiAAg");
	this.shape_51.setTransform(639.6,635.9);

	this.shape_52 = new cjs.Shape();
	this.shape_52.graphics.f("#241916").s().p("AvFBLQgiAAgUgYQgSgVgBgeQABgdASgVQATgYAjABIeLAAQAigBAUAYQATAVAAAdQAAAegTAVQgUAYgiAAg");
	this.shape_52.setTransform(639.6,541.5);

	this.shape_53 = new cjs.Shape();
	this.shape_53.graphics.f("#241916").s().p("AgyFDQgYgVAAgiIAAoXQAAgjAYgUQAVgSAdAAQAeAAAVASQAYAUgBAjIAAIXQABAigYAVQgVASgeAAQgdAAgVgSg");
	this.shape_53.setTransform(707.1,417.6);

	this.shape_54 = new cjs.Shape();
	this.shape_54.graphics.f("#241916").s().p("ApeBKQgjABgUgYQgSgVAAgeQAAgdASgVQAUgXAjAAIS+AAQAhAAAVAXQASAVAAAdQAAAegSAVQgVAYghgBg");
	this.shape_54.setTransform(645.8,388.2);

	this.shape_55 = new cjs.Shape();
	this.shape_55.graphics.f("#241916").s().p("AAZFhQgZgIgTgaQhJhjgLi3QAAjMgOheQgFggANgYQAOgcAegIQAdgIAdAQQAcAQAEAdQAKA7ADBYIAHCVQAFBVAJArQAPBIAiAvQASAYgKAhQgJAfgaAPQgRAKgTAAQgKAAgKgDg");
	this.shape_55.setTransform(588.7,418.9);

	this.shape_56 = new cjs.Shape();
	this.shape_56.graphics.f("#241916").s().p("As7IEQgZgJgQgaQgPgaAEgdQAFgfAdgTQCqhwEAh0QCUhDEnh8QCIg8BUgpQB3g6Bfg3QBeg4BBgxQBSg/A5hDQAWgaAeABQAaABAWAVQAVAWADAdQAEAggWAaQh+CWjjCAQh2BCkkB/QknB9iTBDQkAB0iqBxQgUAMgTAAQgJAAgKgCg");
	this.shape_56.setTransform(623.8,497.3);

	this.shape_57 = new cjs.Shape();
	this.shape_57.graphics.f("#241916").s().p("AgyILQgXgVgBgiIAAunQABgjAXgUQAVgSAdAAQAeAAAVASQAYAUgBAjIAAOnQABAigYAVQgVASgeAAQgdAAgVgSg");
	this.shape_57.setTransform(737.1,589);

	this.shape_58 = new cjs.Shape();
	this.shape_58.graphics.f("#0099FF").s().p("AvJUhQgiAAgVgYQgLgNgEgRQgFgNAAgPIAAuqQAAgiAXgVIAGgEQATgPAbAAIFSAAQBbhjCKhvQBZhFC0iJQCkiBBThSQBKhIA1hJIrIAAQgiAAgUgXQgSgUAAgeQg/hhgKioQAAjPgOheQgFggANgYIACgEQADgVAOgPQAUgYAiAAIS+AAQAiAAAVAYQAPARACAZQAIAPAAATIAAIaQAAAigYAVIgDACQgDAYgPARQgUAXgiAAIjhAAQhGB6hwBzQhhBiigB9Qi5CJhaBIQhDA1g4AyIVhAAQAhAAATAVIAJAGQAXAUAAAiIAAOqQAAAigXAVQgPAMgTAEQgMAEgPAAgAt+SLIb9AAIAAsaI3FAAQgIABgHAAIgKgBIkfAAgAF+q+IDVAAIAAnMIwwAAQADAkABAqIAHCVQAFBXAJArQAMA8AaArIMGAAIALgBIALABg");
	this.shape_58.setTransform(640,512);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape}]}).to({state:[{t:this.shape_3},{t:this.shape_2},{t:this.shape_1}]},8).to({state:[{t:this.shape_6},{t:this.shape_5},{t:this.shape_4}]},1).to({state:[{t:this.shape_11},{t:this.shape_10},{t:this.shape_9},{t:this.shape_8},{t:this.shape_7}]},1).to({state:[{t:this.shape_17},{t:this.shape_16},{t:this.shape_15},{t:this.shape_14},{t:this.shape_13},{t:this.shape_12}]},1).to({state:[{t:this.shape_23},{t:this.shape_22},{t:this.shape_21},{t:this.shape_20},{t:this.shape_19},{t:this.shape_18}]},1).to({state:[{t:this.shape_31},{t:this.shape_30},{t:this.shape_29},{t:this.shape_28},{t:this.shape_27},{t:this.shape_26},{t:this.shape_25},{t:this.shape_24}]},1).to({state:[{t:this.shape_40},{t:this.shape_39},{t:this.shape_38},{t:this.shape_37},{t:this.shape_36},{t:this.shape_35,p:{x:715.1,y:404.5}},{t:this.shape_34},{t:this.shape_33},{t:this.shape_32}]},1).to({state:[{t:this.shape_48},{t:this.shape_47},{t:this.shape_46},{t:this.shape_45},{t:this.shape_35,p:{x:708.1,y:406.6}},{t:this.shape_44},{t:this.shape_43},{t:this.shape_42},{t:this.shape_41}]},1).to({state:[{t:this.shape_57},{t:this.shape_56},{t:this.shape_55},{t:this.shape_54},{t:this.shape_53},{t:this.shape_52},{t:this.shape_51},{t:this.shape_50},{t:this.shape_49}]},1).to({state:[{t:this.shape_58}]},1).to({state:[{t:this.shape_57},{t:this.shape_56},{t:this.shape_55},{t:this.shape_54},{t:this.shape_53},{t:this.shape_52},{t:this.shape_51},{t:this.shape_50},{t:this.shape_49}]},8).to({state:[{t:this.shape_48},{t:this.shape_47},{t:this.shape_46},{t:this.shape_45},{t:this.shape_35,p:{x:708.1,y:406.6}},{t:this.shape_44},{t:this.shape_43},{t:this.shape_42},{t:this.shape_41}]},1).to({state:[{t:this.shape_40},{t:this.shape_39},{t:this.shape_38},{t:this.shape_37},{t:this.shape_36},{t:this.shape_35,p:{x:715.1,y:404.5}},{t:this.shape_34},{t:this.shape_33},{t:this.shape_32}]},1).to({state:[{t:this.shape_31},{t:this.shape_30},{t:this.shape_29},{t:this.shape_28},{t:this.shape_27},{t:this.shape_26},{t:this.shape_25},{t:this.shape_24}]},1).to({state:[{t:this.shape_23},{t:this.shape_22},{t:this.shape_21},{t:this.shape_20},{t:this.shape_19},{t:this.shape_18}]},1).to({state:[{t:this.shape_23},{t:this.shape_22},{t:this.shape_21},{t:this.shape_20},{t:this.shape_19},{t:this.shape_18}]},1).to({state:[{t:this.shape_17},{t:this.shape_16},{t:this.shape_15},{t:this.shape_14},{t:this.shape_13},{t:this.shape_12}]},1).to({state:[{t:this.shape_11},{t:this.shape_10},{t:this.shape_9},{t:this.shape_8},{t:this.shape_7}]},1).to({state:[{t:this.shape_6},{t:this.shape_5},{t:this.shape_4}]},1).to({state:[{t:this.shape_3},{t:this.shape_2},{t:this.shape_1}]},1).to({state:[{t:this.shape}]},1).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(1168.5,881.5,223.1,285);

})(lib = lib||{}, images = images||{}, createjs = createjs||{});
var lib, images, createjs;