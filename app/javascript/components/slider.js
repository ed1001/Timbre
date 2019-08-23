const rangeSlider = document.getElementById("rs-range-line");
const rangeBullet = document.getElementById("rs-bullet");

const slider = () => {

  rangeSlider.addEventListener('mouseup', () => {
    console.log(rangeBullet.innerText);
    var mydata = `range=${rangeBullet.innerText}`
    Rails.ajax({
      url: "/profiles/range",
      type: "POST",
      data: mydata
    });
  })
  rangeSlider.addEventListener('input', showSliderValue, false);
}

const showSliderValue = () => {
  rangeBullet.innerHTML = rangeSlider.value;
  var bulletPosition = (rangeSlider.value /rangeSlider.max);
  rangeBullet.style.left = (bulletPosition * 578) + "px";
}

export { slider }

