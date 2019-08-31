import Jcrop from 'Jcrop'

const jcropEvent = new Event('jcrop-init');
const photoModal = document.querySelector('.photo-modal');

const listenForJcrop = () => {
  photoModal.addEventListener('jcrop-init', ()=> {
    console.log('triggered');
    initJcrop();
  })
}

const initJcrop = () => {
  var photoId = $('#target')[0].dataset.id;
  var scale = parseFloat($('#target')[0].dataset.scale);
  console.log(`scale = ${scale}`)
  var w = $('#target')[0].width;
  var h = $('#target')[0].height;
  var x = (w - (h * 0.75))/2;
  var select = [x, 0, w, h];

  $('#target').Jcrop({
      aspectRatio: 3/4,
      allowSelect: false,
      setSelect: select
  });

  document.querySelector('.crop-save').addEventListener('click', () => {
    var getCoords = document.querySelector('.jcrop-holder').firstElementChild.style;
    var width = parseInt(getCoords.width) / scale;
    var height = parseInt(getCoords.height) / scale;
    var top = parseInt(getCoords.top) / scale;
    var left = parseInt(getCoords.left) / scale;
    console.log(top)

    var imageCoords = `width=${width}&height=${height}&top=${top}&left=${left}&photo_id=${photoId}`

    Rails.ajax({
      url: "/updatephoto",
      type: "patch",
      data: imageCoords
    });
  });

}


export { listenForJcrop, initJcrop }
