extends Node

const CHARACTERS_IMAGES := [
	preload("res://assets/images/characters/blaidd-portrait.png"),
	preload("res://assets/images/characters/melina-portrait.png"),
	preload("res://assets/images/characters/malenia-portrait.png"),
	preload("res://assets/images/characters/maliketh-portrait.png"),
	preload("res://assets/images/characters/ranni-portrait.png"),
	preload("res://assets/images/characters/godrick-portrait.png"),
]

const CHARACTERS_ID := {
	"Custom": -1,
	"Blaidd": 0,
	"Melina": 1,
	"Malenia": 2,
	"Maliketh": 3,
	"Ranni": 4,
	"Godrick": 5
}

const CHARACTERS := {
	0: {
		"name": "Blaidd",
		"texture": CHARACTERS_IMAGES[0]
	},
	1: {
		"name": "Melina",
		"texture": CHARACTERS_IMAGES[1]
	},
	2: {
		"name": "Malenia",
		"texture": CHARACTERS_IMAGES[2]
	},
	3: {
		"name": "Maliketh",
		"texture": CHARACTERS_IMAGES[3]
	},
	4: {
		"name": "Ranni",
		"texture": CHARACTERS_IMAGES[4]
	},
	5: {
		"name": "Godrick",
		"texture": CHARACTERS_IMAGES[5]
	}
}

var CURSORS_MAP := {
	"arrow": {
		"texture": preload("res://assets/images/cursors/arrow.png"),
		"type": Input.CURSOR_ARROW,
	},
	"ibeam": {
		"texture": preload("res://assets/images/cursors/i_beam.png"),
		"type": Input.CURSOR_IBEAM
	}
}
