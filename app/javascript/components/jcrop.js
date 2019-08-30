import Jcrop from 'jcrop'

const jcropEvent = new Event('jcrop-init');
const photoModal = document.querySelector('.photo-modal');

const listenForJcrop = () => {
  console.log('dsfsfdsfsfdsfdsfsdfdsf');
  photoModal.addEventListener('jcrop-init', ()=> {
    initJcrop();
  })
}

const initJcrop = () => {
  var w = $('#target')[0].width;
  var h = $('#target')[0].height;
  var x = (w - (h * 0.75))/2
  var select = h > w ? [0, 0, w, h] : [x, 0, w, h];

  $('#target').Jcrop({
      aspectRatio: 3/4,
      allowSelect: false,
      setSelect: select
  });

  document.querySelector('.crop-save').addEventListener('click', () => {
    var getCoords = document.querySelector('.jcrop-holder').firstElementChild.style;
    var width = parseInt(getCoords.width)
    var height = parseInt(getCoords.height)
    var top = parseInt(getCoords.top)
    var left = parseInt(getCoords.left)

    var imageCoords = `width=${width}&height=${height}&top=${top}&left=${left}`

    Rails.ajax({
      url: "/updatephoto",
      type: "patch",
      data: imageCoords
    });
  });

}


export { listenForJcrop, initJcrop }
