var Chat = {
  init (socket) {
    var username = document.getElementById('username').innerHTML
    var userId = document.getElementById('user-id').innerHTML
    var input = document.getElementById('message-input')
    var messages = document.getElementById('messages')
    socket.onOpen(e => console.log('Open', e))
    socket.onError(e => console.log('Error', e))
    socket.onClose(e => console.log('Close', e))

    var channel = socket.channel('room:general')
    channel.join()
      .receive('ignore', () => console.log('Error'))
      .receive('ok', () => console.log('Joined ok'))
      .receive('timeout', () => console.log('Connection Timeout'))

    channel.onError(e => console.log('Something went wrong'))
    channel.onClose(e => console.log('Channel closed'))

    input.addEventListener('keypress', e => {
      if (e.keyCode === 13) {
        channel.push('new:msg', {user: username, body: input.value, id: userId}, 10000)
        input.value = ''
      }
    }, false)

    channel.on('new:msg', msg => {
      messages.innerHTML = `<p>${msg.user}&nbsp; ${msg.body}</p>` + messages.innerHTML
    })
  }
}

export default Chat
