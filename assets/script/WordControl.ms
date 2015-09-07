use
	pixi Container
	.dictionary random-word
	.Word

class Container
	construct!
		super()
		.add-word!()

	"add-word!" !|
		word = random-word().word
		.word := new Word word
		.addChild .word
		.word.on "complete" !|
			.emit "score"
			.removeChild .word
			.add-word!()
