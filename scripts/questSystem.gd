extends Node

enum QUESTTYPE {Distance}
const QUEST = preload("uid://cvbpksdahe48b")
var quests_table : QuestTable = null
var player : Player = null # gamemanager!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var current_quests : Dictionary[QuestInfo, QuestUI] = {}
var playerInitialPosition : float

func addQuest(quest : QuestInfo) -> void:
	current_quests[quest] = Enter(quest)

func _process(delta: float) -> void:
	for questInfo in current_quests:
		var quest = current_quests[questInfo]
		if questInfo.type == QUESTTYPE.Distance:
			print(player.position.x)
			var progress = remap(abs(questInfo.targetX - player.getCharacterPosition().x), abs(questInfo.targetX - playerInitialPosition), 100, 0, 100)
			quest.updateResult(progress)

func Enter(resource: QuestInfo) -> QuestUI:
	var quest : QuestUI = QUEST.instantiate()
	quests_table.addChild(quest)
	quest.setText(resource.text)
	quest.setDescritiption(resource.description)
	quest.setRequirement(resource.requirement)
	playerInitialPosition = player.getCharacterPosition().x
	return quest
