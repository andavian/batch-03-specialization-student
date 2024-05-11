var { Trie } = require("@ethereumjs/trie");

async function main() {
  var trie = new Trie();

  await trie.put(buffer("0xblock01"), buffer("0xblock01Value"));
  await trie.put(buffer("0xblock01B"), buffer("0xblock012Value"));
  await trie.put(buffer("0xblock01BAV"), buffer("0xblock012001Value"));
  await trie.put(buffer("0xblock01BDE"), buffer("0xblock012001Value"));

  var node = await trie.findPath(buffer("0xblock01B"));

  console.log(node);

  var node = await trie.findPath(buffer("0xblock01BDE"));

  console.log(node);

  console.log(buffer(trie.root()));
}

function buffer(data) {
  return Buffer.from(data);
}

main();
