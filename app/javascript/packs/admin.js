// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("bulma-extensions")
// require("selectr")

document.addEventListener("turbolinks:load", async () => {

  for (const select of [...document.querySelectorAll('select')]) {
    const data = select.dataset;
    const selector = `#${select.id}`;
    const options = {};

    if (data.taggable === 'true') options.taggable = true;
    if (data.tagPlaceholder) options.tagPlaceholder = data.tagPlaceholder;

    if (data.source) {
      const g = await fetch(data.source);
      const json = await g.json();

      options.data = json.map(x => {
        return {
          text: x[0],
          value: x[1],
          selected: x[2],
        };
      });
    }

    new Selectr(selector, options);
  }

  for (const upDown of [...document.querySelectorAll('table > tbody > tr > td > div.order-controls > i')]) {
    upDown.addEventListener('click', async (e) => {
      console.log({
        e
      });
      const command = e.target.dataset.command;
      const currentRow = e.target.closest('tr');
      const tableBody = currentRow.closest('tbody');
      if (command === 'up') {
        const previousRow = currentRow.previousElementSibling;
        tableBody.insertBefore(currentRow, previousRow);
      } else {
        const nextRow = currentRow.nextElementSibling;
        tableBody.insertBefore(nextRow, currentRow);
      }
    });
  }
});
