use
	global document requestAnimationFrame window
	pixi Container WebGLRenderer Point
	.Water
	.WordControl

class
	construct!
		.container = new Container

		.div = document.getElementById "game"
		.canvas = document.createElement "canvas"
		.canvas.id := "game-canvas"
		.div.appendChild .canvas

		self = this # TODO:SYNTAX
		window.addEventListener "resize" !|
			self.resize!()

		.renderer = new WebGLRenderer .canvas.width .canvas.height
			view. .canvas
			transparent. true
			# TODO: this doesn't seem to work...
			antialias. true

		.word = new WordControl
		.container.addChild .word

		.water = new Water

		.resize!()

	"resize-self!" !|
		.width := .div.offsetWidth
		.height := .div.offsetHeight
		.canvas.style.width := "{.width}px"
		.canvas.style.height := "{.height}px"
		.canvas.width := .width
		.canvas.height := .height

	"resize!" !|
		.resize-self!()
		.renderer.resize .width .height
		# Text has problems if it's < 1 in size, so use a large size instead.
		standard-size = 1000
		size = min [ .width .height ]
		scale = / size standard-size
		.container.scale := new Point scale scale
		.container.position := new Point (/ .width 2) (/ .height 2)

	"update!" !|
		.renderer.render .container
		requestAnimationFrame !|
			.update!()

	###
	"load!" !|
		assets =
			img. "sprites/img.png"

		for! @p assets
			loader.add _ (p assets _)

		loader.once "complete" !|
			.loaded!()

		loader.load()

	"loaded!" !|
		# .container.addChild (Sprite.fromImage "sprites/img.png"
		pass
	###

###
Img. class
	construct!
		.sprite := Sprite.fromImage "sprites/halfway.png"

	"add-to!" !|container
		container.addChild .sprite

	"resize!" !|
		pass
###