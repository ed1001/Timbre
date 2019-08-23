import Jcrop from 'jcrop'

const target = document.getElementById('target');

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

export { initJcrop }
