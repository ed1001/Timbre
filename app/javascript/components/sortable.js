import Sortable from 'sortablejs';

const initSortable = () => {
  Sortable.create(document.querySelector('.photo-row'), {
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
    },
    onMove: function(e) {
      return !e.related.classList.contains('no-sort');
    }
  });
};

export { initSortable };
