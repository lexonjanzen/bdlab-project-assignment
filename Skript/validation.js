const fs = require('fs')
var csv = require("fast-csv")
var stream = fs.createReadStream('data.csv')

var counter = 0
var hits = 0

csv
  .fromStream(stream)
  .on("data", function(data){
    counter += 1
    if(data[11] === '1' && data[16] > '0' ){
      hits += 1
    }
  })
  .on("end", function(){
    console.log('counter: ', counter)
    console.log('hits: ', hits)
  })


// TYPE_OF_PAYMENT = index 11
// TIP_AMOUNT = index 16

// general model, classification