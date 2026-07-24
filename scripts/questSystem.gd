extends Node

enum QUESTTYPE {Distance}
const QUEST = preload("uid://cvbpksdahe48b")
var quests_table : QuestTable = UiQuestTable
var player : Player = null
var current_quests : Dictionary[QuestInfo, QuestUI] = {}
var playerInitialPosition : float

func addQuest(quest : QuestInfo) -> void:
	current_quests[quest] = Enter(quest)

func _process(delta: float) -> void:
	for questInfo in current_quests:
		var quest = current_quests[questInfo]
		if questInfo.type == QUESTTYPE.Distance and is_instance_valid(player):
			var progress = remap(abs(questInfo.targetX - player.getCharacterPosition().x), abs(questInfo.targetX - playerInitialPosition), 100, 0, 100)
			quest.updateResult(progress)

func clearAllQuests() -> void:
	for questInfo in current_quests:
		var quest = current_quests[questInfo]
		quest.queue_free()
	current_quests.clear()

func clearQuest(questInfo : QuestInfo) -> void:
	var quest = current_quests[questInfo]
	quest.queue_free()
	current_quests.erase(questInfo)

func Enter(resource: QuestInfo) -> QuestUI:
	var quest : QuestUI = QUEST.instantiate()
	UiQuestTable.addChild(quest)
	quest.setText(resource.text)
	quest.setDescritiption(resource.description)
	quest.setRequirement(resource.requirement)
	if resource.type == QUESTTYPE.Distance and is_instance_valid(player):
		playerInitialPosition = player.getCharacterPosition().x
	return quest
