import 'bootstrap';

import { burgerAnimate } from '../components/navbar.js'
import { swipe, initMedia } from '../components/swipe.js'
import { selectSwitch } from '../components/geolocation.js'
import { btnForm } from '../components/form.js'
import { slider } from '../components/slider.js'
import { listenForJcrop, initJcrop } from '../components/jcrop.js'
import { conversation, activateConversation, isTyping } from '../components/conversation';
import { initSortable } from '../components/sortable.js'

burgerAnimate();

switch (location.pathname) {
  case '/':
    btnForm();
    selectSwitch();
    break;
  case '/discover':
    swipe();
    break;
  case '/settings':
    listenForJcrop();
    slider();
    initSortable();
    break;
  case '/conversations':
    activateConversation();
    isTyping();
    break;
  default:
    break;
}

conversation();

