import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('.photo-row');
  Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
    draggable: ".sort",
    filter: ".no-sort",
    onEnd: (event) => {
      var positions = `old=${event.oldIndex}&new=${event.newIndex}`
      if (event.newIndex != event.oldIndex) {
        Rails.ajax({
          url: "/photos/update_position",
          type: "patch",
          data: positions
        });
      }
    }
  });
};

export { initSortable };
