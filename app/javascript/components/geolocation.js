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
      console.log('connect')
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
      spinner.style.display = "block";
      getLocation();
    } else {
      document.querySelector('.form-btn').disabled = true;
      spinner.style.display = "none";
      document.querySelector('.user_latitude').firstElementChild.value = ''
      document.querySelector('.user_longitude').firstElementChild.value = ''
    }
  })
}

const getLocation = () => {
  if (navigator.geolocation) {
    console.log('before')
    navigator.geolocation.getCurrentPosition(setCoords, failed);
    console.log('after')
  } else {
    alert("Geolocation is not supported by this browser. Please choose location in settings");
  }
}

const failed = () => {
  console.log('failed');
}

const setCoords = (position) => {
  console.log('got to setCoords')
  var coordinates = `latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`
  console.log(position.coords.latitude);
  console.log(position.coords.longitude);
  console.log('got past setCoords')
  document.querySelector('.user_latitude').firstElementChild.value = position.coords.latitude
  document.querySelector('.user_longitude').firstElementChild.value = position.coords.longitude
  document.querySelector('.spinner-border').style.display = "none";
  document.querySelector('.form-btn').disabled = false;
}

export { selectSwitch }


