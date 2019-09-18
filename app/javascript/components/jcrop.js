import Jcrop from 'Jcrop'

const jcropEvent = new Event('jcrop-init');
const photoModal = document.querySelector('.photo-modal');

const listenForJcrop = () => {
  photoModal.addEventListener('jcrop-init', ()=> {
    initJcrop();
  })
}

const initJcrop = () => {
  var photoId = $('#target')[0].dataset.id;
  var scale = parseFloat($('#target')[0].dataset.scale);
  var w = $('#target')[0].width;
  var h = $('#target')[0].height;
  var x = (w - (h * 0.75))/2;
  var select = [x, 0, w, h];

  $('#target').Jcrop({
      aspectRatio: 3/4,
      minSize: [30, 40],
      allowSelect: false,
      setSelect: select
  });

  document.querySelector('.crop-save').addEventListener('click', () => {
    var getCoords = document.querySelector('.jcrop-holder').firstElementChild.style;
    var width = parseInt(getCoords.width) / scale;
    var height = parseInt(getCoords.height) / scale;
    var y = parseInt(getCoords.top) / scale;
    var x = parseInt(getCoords.left) / scale;

    var imageCoords = `width=${width}&height=${height}&y=${y}&x=${x}&photo_id=${photoId}`

    Rails.ajax({
      url: "/photos/update",
      type: "patch",
      data: imageCoords
    });
  });

}


export { listenForJcrop, initJcrop }
