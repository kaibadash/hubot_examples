request = require("http")

module.exports = (robot) ->

  getCountKakuni = () ->
    return robot.brain.get('count_of_kakuni') or 0

  setPool = (str) ->
    brain_array = robot.brain.get('messages') or []
    set_str = str or "………。"
    brain_array.push(set_str)
    robot.brain.set 'messages', brain_array

  countupKakuni = () ->
    count = getCountKakuni() + 1
    robot.brain.set 'count_of_kakuni', count

  kakuniHandling = () ->
    countupKakuni()
    at_count = getCountKakuni()
    setPool("#{at_count}回")
    if at_count < 3
      msg.send "ごちそうさまでした。"
    else if at_count < 5
      msg.send "もう#{at_count}回も食べたんで、いいですわ。"
    else if at_count == 5
      msg.send "もういらない。。。"


  robot.hear /角煮/i, (msg) ->
    kakuniHandling()
