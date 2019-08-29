import Jcrop from 'jcrop'

const jcropEvent = new Event('jcrop-init');
const photoModal = document.querySelector('.photo-modal');

const listenForJcrop = () => {
  photoModal.addEventListener('jcrop-init', ()=> {
    initJcrop();
  })
}

const initJcrop = () => {
  $('#target').Jcrop({
      onSelect: showCoords,
      onChange: showCoords
  });
}

function showCoords(c)
{
  console.log(c.x);
};

export { listenForJcrop }
