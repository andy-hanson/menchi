use
	pixi Container Text

class Container
	construct!
		super()

		font-size = 100

		.style1 =
			font. "bold {font-size}px Arial"
			fill. "red"
		.style2 =
			font. "bold {font-size}px Arial"
			fill. "blue"

		.text1 = new Text "" .style1
		.text2 = new Text "" .style2

		y = * font-size -0.5
		.text1.y := y
		.text2.y := y

		.addChild .text1
		.addChild .text2

	"set-text!" !|str idx
		.text1.text := str.slice 0 idx
		.text2.text := str.slice idx

		text-width = + .text1.width .text2.width
		.text1.x := * text-width -0.5
		.text2.x := + .text1.x .text1.width

		###
		.text2.x := + .text1.x switch idx
			0
				# For some reason, .text1.width is 11 even when it's empty.
				1
			else
				.text1.width
		###
