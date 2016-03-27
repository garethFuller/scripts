System.register(['angular2/core', '../../mocks/heroes/index', '../logger/index'], function(exports_1) {
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __metadata = (this && this.__metadata) || function (k, v) {
        if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
    };
    var core_1, index_1, index_2;
    var HeroesService;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (index_1_1) {
                index_1 = index_1_1;
            },
            function (index_2_1) {
                index_2 = index_2_1;
            }],
        execute: function() {
            HeroesService = (function () {
                function HeroesService(_logger) {
                    this._logger = _logger;
                }
                HeroesService.prototype.getHeroes = function () {
                    return Promise.resolve(index_1.HEROES);
                };
                HeroesService.prototype.getHero = function (id) {
                    this._logger.log("Getting hero by " + id);
                    return Promise.resolve(index_1.HEROES).then(function (heroes) { return heroes.filter(function (hero) { return hero.id === id; })[0]; });
                };
                HeroesService = __decorate([
                    core_1.Injectable(), 
                    __metadata('design:paramtypes', [index_2.Logger])
                ], HeroesService);
                return HeroesService;
            })();
            exports_1("HeroesService", HeroesService);
        }
    }
});
//# sourceMappingURL=index.js.map