import http from 'k6/http';
import { check } from 'k6';

export const options = {
  vus: 100,
  duration: '30s',

  // stages: [
    //   { duration: '50s', target: 100 }, // below normal load
    //   { duration: '50s', target: 200 }, // normal load
    //   { duration: '50s', target: 300 }, // around the breaking point
    //   { duration: '50s', target: 400 }, // beyond the breaking point
    //   { duration: '30s', target: 0 }, // scale down. Recovery stage.
    // ]
  };

  export default function () {
    let res = http.get('http://localhost:8080/products/1');
    check(res, { 'is status 200': (r) => r.status === 200 });
  }

  // 'http://localhost:3000/products/?page=1&count=5'
  // 'http://localhost:3000/products/1';
  // 'http://localhost:3000/products/1/styles';
  // 'http://localhost:3000/products/1/related';