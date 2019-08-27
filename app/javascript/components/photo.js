const photoForm = document.querySelector('.new_photo');


const autoUpload = () => {
  console.log('helllpsdfisdhsdfhdsf');
  photoForm.addEventListener('change', () => { photoForm.submit(); })
}

export { autoUpload }
