extends Resource
class_name QuestInfo

enum QUESTTYPE {Distance}

@export var text : String
@export var description : String
@export_range(0, 100, 1) var requirement : int
@export var type : QUESTTYPE
@export var targetX := -500
