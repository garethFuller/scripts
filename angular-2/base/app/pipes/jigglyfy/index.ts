import {Pipe, PipeTransform} from 'angular2/core';

@Pipe({
  name: 'jigglyfy'
})
export class Jigglyfy implements PipeTransform {
  transform(value: string): string {
    return `${value} Jiggly`;
  }
}
