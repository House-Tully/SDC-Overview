var expect = require("chai").expect;
var request = require("request");
const answers = require('./answers')


var pool = require('../server/db/db');

require('dotenv').config();

describe("queries", function() {

  describe("products", function() {

    var url =  `http://localhost:${process.env.API_PORT}/products`

    it("products returns status 200", function(done) {
      request(url, function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });

    it("returns correct count by default", function(done) {
      request(url, function(error, response, body) {
        expect(JSON.parse(body).length).to.equal(5);
        done();
      });
    });

    it("returns correct page and count", function(done) {
      request(url + '?page=2&count=2', function(error, response, body) {
        expect(body).to.equal(answers.poroducts.page2count2);
        done();
      });
    });

    // it("query resonse time for last item is under 50ms", function(done) {
    //   request(url, function(error, response, body) {
    //     expect(body).to.equal(answers.poroducts.last);
    //     done();
    //   });
    // });
  });
});