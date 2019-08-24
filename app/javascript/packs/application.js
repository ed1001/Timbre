import 'bootstrap';

import { burgerAnimate } from '../components/navbar.js'
import { swipe } from '../components/swipe.js'
import { selectSwitch } from '../components/geolocation.js'
import { btnForm } from '../components/form.js'
import { slider } from '../components/slider.js'
import { initJcrop } from '../components/jcrop.js'
import { conversation, activateConversation } from '../components/conversation';

burgerAnimate();
initJcrop();

switch (location.pathname) {
  case '/':
    btnForm();
    selectSwitch();
    break;
  case '/discover':
    swipe();
    break;
  case '/settings':
    slider();
    break;
  case '/conversations':
    activateConversation();
    break;
  default:
    break;
}

conversation();
