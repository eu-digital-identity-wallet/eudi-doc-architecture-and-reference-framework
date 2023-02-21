const fs = require("fs");
const jsdom = require("jsdom");
const { JSDOM } = jsdom;

let idDict = {};

const inputFilePath = "./dist/arf.html";
const outputFilePath = "./dist/output.html";

fs.readFile(inputFilePath, "utf-8", (err, html) => {
  if (err) {
    console.error(err);
    return;
  }

  const dom = new JSDOM(html);
  const document = dom.window.document;

  // Fix duplicate ids
  document.querySelectorAll("[id]").forEach(element => {
    let id = element.getAttribute("id");
    if (idDict[id]) {
      let newId = id + "_" + Math.floor(Math.random() * 100000);
      element.setAttribute("id", newId);
      idDict[newId] = true;
    } else {
      idDict[id] = true;
    }
  });

  // Remove the `role='doc-endnote'` from the `li` elements
  document.querySelectorAll("li[role='doc-endnote']").forEach(element => {
    element.removeAttribute("role");
  });

  fs.writeFile(outputFilePath, dom.serialize(), err => {
    if (err) {
      console.error(err);
      return;
    }

    console.log(`Output written to ${outputFilePath}`);
  });
});
