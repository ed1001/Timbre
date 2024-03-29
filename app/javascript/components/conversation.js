const burger = document.getElementById('nav-burger');
const messagesLink = document.getElementById('messages-link');
const matches = document.querySelectorAll('.match-box');

const conversation = () => {
  App.conversation = App.cable.subscriptions.create("ConversationChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
    // make burger red when new match without message
    if (data['new_match'] && location.pathname !== '/conversations') {
      burgerActivate();

    // show 'is typing' if opposed user has your chat open
    } else if (data['status'] && location.pathname === '/conversations' && document.querySelector('.conversation-box-active')) {
      if (data['user_id'] == document.querySelector('.conversation-box-active').dataset.userId){
        var typingStatus = document.querySelector('.type-indication');
        if (data['status'] === 'start') {
          typingStatus.classList.add('type-indication-active');
        } else {
          typingStatus.classList.remove('type-indication-active');
        }
      }

    // handle message
    } else if (data['message']) {

      // make burger red for notification
      var userId = document.getElementById('conv-user-id').dataset.userId
      if (userId != data.user_id && location.pathname !== '/conversations') {
        burgerActivate();
      }

      // get raw text for preview in convo box
      var rawText = data['message'].split('<p>')[1].split('</p>')[0];
      if (rawText.length > 30) {
        rawText = `${rawText.substring(0, 27)}...`;
      }

      var conId = data['conversation_id'].toString();


      //Make array of existing convos then map the convo Ids and check if incoming message is part of a new convo
      const newConvo = !Array.from(document.querySelectorAll('.conversation-box')).map(x => x.dataset['convoId'] ).includes(conId);

      // add new convo box if new convo
      if (newConvo && location.pathname === '/conversations') {
        // first remove match from matchbar of recipient
        var match = document.querySelector(`[data-match-id='${data.user_id}']`);
        match.parentNode.removeChild(match);

        document.querySelector('.conversation-bar').insertAdjacentHTML('afterbegin', `
          <a data-remote="true" href="/conversations/${conId}">
            <div class="conversation-box conversation-box-new" data-user-id=${data.user_id} data-convo-id="${data.conversation_id}">
                <img height="40" width="40" class="avatar" src="${data.sender_photo}">
              <div class="conv-box">
                <div class="conv-box-top">
                  <p class="conv-user-name">${data.sender_name}</p>
                  <p class="conv-time">${data.sent_at}</p>
                </div>
                <p class="conv-preview conv-preview-${conId}">
                ${rawText}
                </p>
              </div>
            </div>
          </a>`)
        // call activateConversation again to pick up newly entered convo box
        activateConversation();
      } else if (location.pathname === '/conversations') {
          // move convo box to the top when receiving a message
          const convos = document.querySelectorAll('.conversation-box');
          if (conId !== convos[0].dataset['convoId']) {
            convos[0].parentElement.before(document.querySelector(`[data-convo-id='${conId}']`).parentElement);
          }

          // code for adding to message preview
          document.querySelector(`.conv-preview-${conId}`).innerText = rawText

        // add content to conversation if it's open
        if (document.querySelector('.new-message-container') && document.querySelector('.conversation-box-active').querySelector(`.conv-preview-${conId}`)) {
          document.querySelector('.new-message-container').insertAdjacentHTML('beforebegin', data['message'])
          displayArea.scrollTop = displayArea.scrollHeight;

          // mark conversation as read if the convo is already open and user is not sender
          if (userId != data.user_id) {
            var conversationId = {
              id: conId
            }
            // ajax request to conversations controller
            var mydata = `id=${conId}`
            Rails.ajax({
              url: '/conversations/read',
              type: 'post',
              data: mydata
            });
          }

        } else {
           // if convo is not already open make burger red
           document.querySelector(`.conv-preview-${conId}`).parentElement.parentElement.classList.add('conversation-box-new')
             if (userId != data.user_id) {
                burger.classList.add('mail-active');
                messagesLink.classList.add('mail-active');
              }
            }
          }
      }
    },
    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    },
    typing_status: function(status, userId) {
      return this.perform('typing_status', {
        status: status,
        user_id: userId
      });
    },
    new_match: function(convoId) {
      return this.perform('new_match', {
        convo_id: convoId
      });
    },
  });

  // add to preview text in convo box as it's being populated
  // reset text in textfield
  // trigger speak function for Actioncable
  $(document).on('submit', '.new_message', function(e) {
    e.preventDefault();
    var values = $(this).serializeArray();
    document.querySelector('.conversation-box-active').querySelector('.conv-preview').innerText = values[2].value

    App.conversation.speak(values);
    $(this).trigger('reset');
  });
}

const activateConversation = () => {
  const convos = document.querySelectorAll('.conversation-box')
  if (document.querySelector('.conversation-box-new') == null) {
        burger.classList.remove('mail-active');
        messagesLink.classList.remove('mail-active');
      } else {
        burger.classList.add('mail-active');
        messagesLink.classList.add('mail-active');
      }
  convos.forEach((convo) => {
    convo.addEventListener('click', () => {
      convos.forEach((c) => {
        c.classList.remove('conversation-box-active')
      })
      convo.classList.add('conversation-box-active')
      convo.classList.remove('conversation-box-new')
      if (document.querySelector('.conversation-box-new') == null) {
        burger.classList.remove('mail-active');
        messagesLink.classList.remove('mail-active');
      } else {
        burger.classList.add('mail-active');
        messagesLink.classList.add('mail-active');
      }
    })
  })
}

const burgerActivate = () => {
  burger.classList.add('mail-active');
  messagesLink.classList.add('mail-active');
}

const listenForTextarea = () => {
  const textarea = $('.typing-area');
  const userId = $('.conversation-box-active')[0].dataset.userId;
  textarea.focus();
  textarea.focus(() => {
    var lastTypedTime = new Date(0);
    const typingDelayMillis = 700;
    var sent = false;
    var typingInterval = null;

    const refreshTypingStatus = () => {
        if (!textarea.is(':focus') || textarea.val() == '' || new Date().getTime() - lastTypedTime.getTime() > typingDelayMillis) {
            sent = false;
            stopInterval();
            App.conversation.typing_status('stop', userId);
        } else {
            if (!sent) {
              App.conversation.typing_status('start', userId);
              sent = true;
            }
        }
    }

    const updateLastTypedTime = () => {
        lastTypedTime = new Date();
        if (!sent) {
          startInterval();
        }
    }

    const startInterval = () => {
      clearInterval(typingInterval);
      typingInterval = setInterval(refreshTypingStatus, 100);
    }

    const stopInterval = () => {
      clearInterval(typingInterval);
    }

    startInterval();
    textarea.keypress(updateLastTypedTime);
  });
}

const observer = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {
      if ($('.typing-area')) {
        listenForTextarea();
        observer.disconnect();
      }
    });
 });

const isTyping = () => {
    $('.conversation-box').click(function() {
      observer.observe($('.conversation-display')[0], {
        childList: true,
      });
    });
}

export { conversation, activateConversation, isTyping }
