import {Injectable, OnInit} from 'angular2/core';
import {HEROES} from '../../mocks/heroes/index'
import {Logger} from '../logger/index';

@Injectable()

export class HeroesService {
  constructor(private _logger: Logger) {

  }

  getHeroes() {
    return Promise.resolve(HEROES);
  }

  getHero(id: number) {
    this._logger.log(`Getting hero by ${id}`);
    return Promise.resolve(HEROES).then(
      heroes => heroes.filter(hero => hero.id === id)[0]
    );
  }
}
