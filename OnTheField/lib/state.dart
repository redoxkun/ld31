/**
 * On The Field - Game that I did for LD31
 * Copyright (C) 2014 Albert Murciego Rico
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

part of game;

class State {

  static final int TITLE = 0;
  static final int GAME = 1;
  static final int FINISHED = 2;
  static final int START_ANIMATION = 3;
  
  State() {
    _gameState = TITLE;
    
    _catchers = new List<Catcher>();
    
    _homeTeam = new List<FootballPlayer>();
    _awayTeam = new List<FootballPlayer>();
  }
  
  int _gameState;
  
  int get gameState => _gameState;
  void set gameState(int gameState) {
    _gameState = gameState;
  }
  
  Cat _mainPlayer;
  
  Cat get mainPlayer => _mainPlayer;
  void set mainPlayer(Cat mainPlayer) {
    _mainPlayer = mainPlayer;
  }
  
  FootballPlayer _referee;
  
  FootballPlayer get referee => _referee;
  void set referee(FootballPlayer referee) {
    _referee = referee;
  }
  
  AssitantReferee _topAssitant;
  
  AssitantReferee get topAssistantReferee => _topAssitant;
  void set topAssistantReferee(AssitantReferee topAssitant) {
    _topAssitant = topAssitant;
  }
  
  AssitantReferee _bottomAssitant;
  
  AssitantReferee get bottomAssistantReferee => _bottomAssitant;
  void set bottomAssistantReferee(AssitantReferee bottomAssitant) {
    _bottomAssitant = bottomAssitant;
  }
  
  List<Catcher> _catchers;
  
  List<Catcher> get catchers => _catchers;
  
  List<FootballPlayer> _homeTeam;
  
  List<FootballPlayer> get homeTeam => _homeTeam;
  
  List<FootballPlayer> _awayTeam;
  
  List<FootballPlayer> get awayTeam => _awayTeam;
  
  int _time;
  
  int get time => _time;
  void set time(int time) {
    _time = time;
  }
  
  int _bestTime;
  
  int get bestTime => _bestTime;
  void set bestTime(int time) {
    _bestTime = time;
  }
  
  int _timeLastAgressivePlayerAdded;
  
  int get timeLastAgressivePlayerAdded => _timeLastAgressivePlayerAdded;
  void set timeLastAgressivePlayerAdded(int time) {
    _timeLastAgressivePlayerAdded = time;
  }
  
}
