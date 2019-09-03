const performIsTyping = (userId, convActive, status, ConvPrev) => {
  if (userId == convActive.dataset.userId){
    var typingStatus = document.querySelector('.type-indication');
    if (status === 'start') {
      typingStatus.classList.add('type-indication-active');
    } else {
      typingStatus.classList.remove('type-indication-active');
    }
  }
  ConvPrev.innerText = 'is typing...';
}

export { performIsTyping }
