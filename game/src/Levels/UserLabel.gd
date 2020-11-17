extends CanvasLayer
var my_url="https://digiseiklus.digikapp.ee/digiseiklus/scores.json"

onready var usernameL: Label = get_node("LabelUser")


func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$HTTPRequest.request(my_url)
	
func _on_request_completed( result, response_code, headers, body ):
	print("Processing the Response")
	var json = JSON.parse(body.get_string_from_utf8())
	var data = json.result
	print("GetData processed: ", data.username)
	GameData.playerCode = data.code
	GameData.userName = data.username
	usernameL.text= GameData.userName
	
