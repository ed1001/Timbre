const signUpActive = [document.querySelector('.my-btn-right'), document.querySelector('.signup-nav')]

const observer = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {
      if (document.querySelector('.switch')) {
        listenForSwitch();
        observer.disconnect();
      }
    });
 });

const selectSwitch = () => {
  signUpActive.forEach((link) => {
    link.addEventListener('click', () => {
      observer.observe(document.querySelector('.login-form'), {
        childList: true,
      });
    });
  });
}

const listenForSwitch = () => {
  const geoSwitch = document.querySelector('.switch').firstElementChild;
  const spinner = document.querySelector('.spinner-border');

  geoSwitch.addEventListener('change', () => {
    if (geoSwitch.checked) {
      spinner.style.display = 'block';
      getLocation();
    } else {
      document.querySelector('.form-btn').disabled = true;
      spinner.style.display = 'none';
      document.querySelector('.switch-label').innerText = 'Allow geolocation services';
      document.querySelector('.user_latitude').firstElementChild.value = ''
      document.querySelector('.user_longitude').firstElementChild.value = ''
    }
  })
}

const getLocation = () => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(setCoords, coordsFail);
  } else {
    alert('Geolocation is not supported by this browser.');
  }
}

const setCoords = (position) => {
  var coordinates = `latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`
  document.querySelector('.user_latitude').firstElementChild.value = position.coords.latitude
  document.querySelector('.user_longitude').firstElementChild.value = position.coords.longitude
  document.querySelector('.spinner-border').style.display = 'none';
  document.querySelector('.form-btn').disabled = false;
  document.querySelector('.switch-label').innerText = 'Geolocation allowed';
}

const coordsFail = () => {
  document.querySelector('.spinner-border').style.display = 'none';
  document.querySelector('.switch-label').innerText = 'Unblock geolocation to sign in';
}

export { selectSwitch }


