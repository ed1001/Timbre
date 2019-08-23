const navBurger = document.getElementById('nav-burger');
const revealOptions = document.querySelector('.reveal-options')

const burgerAnimate = () => {
  navBurger.addEventListener('click', () => {
    navBurger.classList.toggle('open');
    revealOptions.classList.toggle('reveal-options-active');
  });
}

export { burgerAnimate }
