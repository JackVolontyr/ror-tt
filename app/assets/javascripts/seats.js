if (document.querySelector('#carriage_seats')) {
  (function () {
    let seats = document.querySelector('#carriage_seats'),
      seatsOutput = document.querySelector('#carriage_seats_output'),
      seatsValue = JSON.parse(seats.value.replace(/=>/g, ":"));

    for (let key in seatsValue) {
      let
        node = document.createElement("b"),
        nodeBr = document.createElement("br"),
        textnode = document.createTextNode(`место ${key} `)
      ;

      if (Number(key) % 2 == 0) textnode = document.createTextNode(`место ${key}^ `);

      node.appendChild(textnode);
      // seatsOutput.appendChild(nodeBr);
      seatsOutput.appendChild(node);

      if (seatsValue[key]) {
        node.style.color = "green";

      } else {
        node.style.color = "red";
      }
    }
  })();
}