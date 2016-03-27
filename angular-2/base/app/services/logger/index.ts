import {Injectable} from 'angular2/core';

@Injectable()

export class Logger {
  log(what: any ) {
    console.log('--------------------------');
    console.log(what);
    console.log('--------------------------');
  }
}
