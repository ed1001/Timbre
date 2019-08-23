const signUpActive = document.querySelector('.my-btn-right');

const selectSwitch = () => {
  signUpActive.addEventListener('click', () => {
    setTimeout(listenForSwitch, 100)
  })
}

const listenForSwitch = () => {
  const geoSwitch = document.querySelector('.switch').firstElementChild;

  geoSwitch.addEventListener('change', () => {
    if (geoSwitch.checked) {
      getLocation();
    } else {
      document.querySelector('.user_latitude').firstElementChild.value = ''
      document.querySelector('.user_longitude').firstElementChild.value = ''
    }
  })
}

const getLocation = () => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(setCoords);
  } else {
    console.log("Geolocation is not supported by this browser. Please choose location in settings");
  }
}

const setCoords = (position) => {
  var coordinates = `latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`
  console.log(position.coords.latitude);
  console.log(position.coords.longitude);
  document.querySelector('.user_latitude').firstElementChild.value = position.coords.latitude
  document.querySelector('.user_longitude').firstElementChild.value = position.coords.longitude
}

export { selectSwitch }


