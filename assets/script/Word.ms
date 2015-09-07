use
	global document
	pixi Container
	.WordDisplay

class Container
	construct! str
		super()
		.str = str
		.idx ::= 0

		.display = with new WordDisplay
			_.set-text! .str .idx
		.addChild .display

		document.addEventListener "keypress" !|event
			.press! event.charCode

		.-complete? ::= false

	"press!" !|char-code
		unless! .-complete?
			.idx := switch char-code
				.str.charCodeAt .idx
					+ 1 .idx
				else
					0
			if! =? .idx .str.length
				.-complete? := true
				.emit "complete"
			.display.set-text! .str .idx
