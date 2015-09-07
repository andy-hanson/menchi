use
	msl.math.random random-int-upto
	msl.Object p

words =
	foofaw. "a happening"
	hoohaw. "a hoopening"
	joojaw. "dunno"

random-word. |
	word. random-element (Object.keys words)
	definition. p words word

random-element = |_:@
	arr = => Array _
	i = random-int-upto (count arr)
	arr[i]
