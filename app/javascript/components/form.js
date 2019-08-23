const myBtns = document.querySelectorAll('.my-btn');
const loginForm = document.querySelector('.login-form');

const btnForm = () => {
  myBtns.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      if (!btn.classList.contains('my-btn-active')){
        myBtns.forEach((b) => {
          b.classList.remove('my-btn-active');
        })
        btn.classList.add('my-btn-active');
        var mydata = `option=${btn.dataset.option}`
        Rails.ajax({
          url: "/pages/chooseform",
          type: "GET",
          data: mydata
        });
        setTimeout(scrollToForm, 50);
      }
    })
  });
}

var scrollToForm = () => {
  loginForm.scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
}

export { btnForm }


