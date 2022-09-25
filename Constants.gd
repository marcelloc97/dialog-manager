extends Node

const CHARACTERS_IMAGES := [
	preload("res://assets/images/characters/blaidd-portrait.png"),
	preload("res://assets/images/characters/melina-portrait.png"),
	preload("res://assets/images/characters/malenia-protrait.png"),
	preload("res://assets/images/characters/maliketh-portrait.png"),
	preload("res://assets/images/characters/ranni-protrait.png")
]

const CHARACTERS_ID := {
	"Blaidd": 0,
	"Melina": 1,
	"Malenia": 2,
	"Maliketh": 3,
	"Ranni": 4
}

const CHARACTERS := {
	0: {
		"name": "Blaidd",
		"texture": preload("res://assets/images/characters/blaidd-portrait.png")
	},
	1: {
		"name": "Melina",
		"texture": preload("res://assets/images/characters/melina-portrait.png")
	},
	2: {
		"name": "Malenia",
		"texture": preload("res://assets/images/characters/malenia-protrait.png")
	},
	3: {
		"name": "Maliketh",
		"texture": preload("res://assets/images/characters/maliketh-portrait.png")
	},
	4: {
		"name": "Ranni",
		"texture": preload("res://assets/images/characters/ranni-protrait.png")
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
