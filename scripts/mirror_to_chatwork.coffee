request = require("http")

module.exports = (robot) ->
  sendToChatwork = (data) ->
    robot.http('https://api.chatwork.com/v1/rooms/'+ process.env.HUBOT_CHATWORK_ROOM +'/messages')
    .headers
        'Content-Type': 'application/x-www-form-urlencoded'
        'X-ChatWorkToken': process.env.HUBOT_CHATWORK_TOKEN
    .post('body=' + data) (err, r, body) ->
      msg.send "Chatwork Error:#{body}" if err

  # For New relic alert.
  robot.hear /app violated Response time/i, (msg) ->
    sendToChatwork(msg.message)
    msg.send msg.message.user.name
