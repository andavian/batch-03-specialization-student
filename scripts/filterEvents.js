var { ethers } = require("hardhat");

async function filterEvents() {
  var eventAddress = "0xCb6d59738799636d62aaFbdfcC0Ef17c32625937";
  var Events = await ethers.getContractFactory("Events");
  var eventsContract = Events.attach(eventAddress);

  var fromBlock = 6690942;
  var toBlock = 6691171;

  // Evento Uno: address _wallet, uint256 _age, string memory _name
  // Evento Dos: uint256 _year, uint256 _month

  // 1 - Buscar los eventos del tipo "Dos"
  //   var eventFilter = eventsContract.filters.Dos();
  //   var events = await eventsContract.queryFilter(
  //     eventFilter,
  //     fromBlock,
  //     toBlock
  //   );
  //   console.log(events.length);

  // 2 - Filtering event Uno age > 28n
  //   var eventFilter = eventsContract.filters.Uno();
  //   var events = await eventsContract.queryFilter(
  //     eventFilter,
  //     fromBlock,
  //     toBlock
  //   );
  //   var filteredEvents = events.filter((event) => event.args[1] > 28n);
  //   console.log(filteredEvents);

  // 3 - Filtering event Dos, months 1 - 6
  //   var eventFilter = eventsContract.filters.Dos(null, [1, 2, 3, 4, 5, 6]);
  //   var events = await eventsContract.queryFilter(
  //     eventFilter,
  //     fromBlock,
  //     toBlock
  //   );
  //   console.log(events);

  // Evento Uno: address _wallet, uint256 _age, string memory _name
  // Evento Dos: uint256 _year, uint256 _month
  var eventFilter = eventsContract.filters.Uno(null, null, "Liz");
  var events = await eventsContract.queryFilter(
    eventFilter,
    fromBlock,
    toBlock
  );
  console.log(events);
}

filterEvents();
