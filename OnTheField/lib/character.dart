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

class Character {

  static final int DONT_MOVE = 0;
  static final int MOVE_LEFT = 1;
  static final int MOVE_UP = 2;
  static final int MOVE_RIGHT = 3;
  static final int MOVE_DOWN = 4;

  static final int MIN_X = 40;
  static final int MAX_X = 900;
  static final int MIN_Y = 60;
  static final int MAX_Y = 560;

  static final int JUMP_DISTANCE = 20;

  SceneObject _object;

  double _movement;
  double _x, _y;

  Character(this._object);

  SceneObject get sceneObject => _object;
  void set sceneObject(SceneObject object) {
    _object = object;
  }

  double get movement => _movement;
  void set movement(double movement) {
    _movement = movement;
  }

  void moveUp() {
    _object.y--;

    if (_object.state == 0) {
      _object.state = 2;
    } else if (_object.state == 1) {
      _object.state = 3;
    }

    if (_object.y <= MIN_Y) {
      _object.y = MIN_Y + 1;
    }
  }

  void moveLeft() {
    _object.x--;

    if (_object.state != 2) {
      _object.state = 2;
    }

    if (_object.x <= MIN_X) {
      _object.x = MIN_X + 1;
    }
  }

  void moveDown() {
    _object.y++;

    if (_object.state == 0) {
      _object.state = 2;
    } else if (_object.state == 1) {
      _object.state = 3;
    }

    if (_object.y >= MAX_Y) {
      _object.y = MAX_Y - 1;
    }
  }

  void moveRight() {
    _object.x++;

    if (_object.state != 3) {
      _object.state = 3;
    }

    if (_object.x >= MAX_X) {
      _object.x = MAX_X - 1;
    }
  }

  void notMoving() {
    if (_object.state == 2) {
      _object.state = 0;
    } else if (_object.state == 3) {
      _object.state = 1;
    }
  }
  
  void _runAfter(Cat cat) {

    if (_object.x < cat.sceneObject.x) {
      _x = _x + _movement;
      if (_x.truncate() > _object.x) {
        moveRight();
      }
    } else {
      _x = _x - _movement;
      if (_x.truncate() < _object.x) {
        moveLeft();
      }
    }

    if (_object.y < cat.sceneObject.y) {
      _y = _y + _movement;
      if (_y.truncate() > _object.y) {
        moveDown();
      }
    } else {
      _y = _y - _movement;
      if (_y.truncate() < _object.y) {
        moveUp();
      }
    }
  }
  
  void _jumpAfter(Cat cat) {
    if (_object.state == 0 || _object.state == 2) {
      _object.state = 4;
      _object.x = cat.sceneObject.x + 10;
      _object.y = cat.sceneObject.y + 1;
      cat.sceneObject.state = 9;
    } else if (_object.state == 1 || _object.state == 3) {
      _object.state = 5;
      _object.x = cat.sceneObject.x - 10;
      _object.y = cat.sceneObject.y + 1;
      cat.sceneObject.state = 8;
    }
  }

}

class Cat extends Character {
  
  SceneObject _lastLayerObject;

  Cat(SceneObject object, this._lastLayerObject) : super(object);
  
  SceneObject get lastLayerObject => _lastLayerObject;

  @override void moveUp() {
    _object.y--;
    
    if (_object.state != 7) {
      _object.state = 7;
    }

    if (_object.y <= Character.MIN_Y) {
      _object.y = Character.MIN_Y + 1;
    }
  }
  
  void moveUpLeft() {
    _object.x--;
    _object.y--;

    if (_object.state != 5) {
      _object.state = 5;
    }

    if (_object.x <= Character.MIN_X) {
      _object.x = Character.MIN_X + 1;
    }

    if (_object.y <= Character.MIN_Y) {
      _object.y = Character.MIN_Y + 1;
    }
  }
  
  void moveUpRight() {
    _object.x++;
    _object.y--;

    if (_object.state != 4) {
      _object.state = 4;
    }

    if (_object.x >= Character.MAX_X) {
      _object.x = Character.MAX_X - 1;
    }

    if (_object.y <= Character.MIN_Y) {
      _object.y = Character.MIN_Y + 1;
    }
  }

  @override void moveLeft() {
    _object.x--;

    if (_object.state != 5) {
      _object.state = 5;
    }

    if (_object.x <= Character.MIN_X) {
      _object.x = Character.MIN_X + 1;
    }
  }

  @override void moveDown() {
    _object.y++;
    
    if (_object.state != 6) {
      _object.state = 6;
    }

    if (_object.y >= Character.MAX_Y) {
      _object.y = Character.MAX_Y - 1;
    }
  }
  
  void moveDownLeft() {
    _object.x--;
    _object.y++;

    if (_object.state != 5) {
      _object.state = 5;
    }

    if (_object.y >= Character.MAX_Y) {
      _object.y = Character.MAX_Y - 1;
    }

    if (_object.x <= Character.MIN_X) {
      _object.x = Character.MIN_X + 1;
    }
  }
  
  void moveDownRight() {
    _object.x++;
    _object.y++;

    if (_object.state != 4) {
      _object.state = 4;
    }

    if (_object.y >= Character.MAX_Y) {
      _object.y = Character.MAX_Y - 1;
    }

    if (_object.x >= Character.MAX_X) {
      _object.x = Character.MAX_X - 1;
    }
  }

  @override void moveRight() {
    _object.x++;

    if (_object.state != 4) {
      _object.state = 4;
    }

    if (_object.x >= Character.MAX_X) {
      _object.x = Character.MAX_X - 1;
    }
  }

  @override void notMoving() {
    if (_object.state == 4) {
      _object.state = 0;
    } else if (_object.state == 5) {
      _object.state = 1;
    } else if (_object.state == 6) {
      _object.state = 2;
    } else if (_object.state == 7) {
      _object.state = 3;
    }
  }

}

class Catcher extends Character {

  Catcher(SceneObject object) : super(object) {
    _movement = 0.7;
    _x = object.x.toDouble();
    _y = object.y.toDouble();
  }

  void move(Cat cat) {
    if ((_object.x - Character.JUMP_DISTANCE) < cat.sceneObject.x && (_object.x + Character.JUMP_DISTANCE) > cat.sceneObject.x &&
        (_object.y - Character.JUMP_DISTANCE) < cat.sceneObject.y && (_object.y + Character.JUMP_DISTANCE) > cat.sceneObject.y) {
      if (_object.state != 4 && _object.state != 5) {
        _jumpAfter(cat);
      }
    } else {
      _runAfter(cat);
    }
  }

}

class FootballPlayer extends Character {

  // Don't know the reason but Dart Editor
  // doesn't seem to have enum support...
  static final int AGGRESSIVE = 0;
  static final int PASSIVE = 1;
  static final int COWARD = 2;
  
  static final int DISTANCE = 60;

  int _playerType;
  Random _rnd;

  int _movementType;

  FootballPlayer(SceneObject object) : super(object) {
    _playerType = PASSIVE;
    _rnd = new Random();

    _movementType = Character.DONT_MOVE;
    
    _movement = 0.8;
    _x = object.x.toDouble();
    _y = object.y.toDouble();
  }

  void set playerType(int type) {
    _playerType = type;
  }

  void move(Cat cat) {
    if (_playerType == AGGRESSIVE) {
      
      if ((_object.x - Character.JUMP_DISTANCE) < cat.sceneObject.x && (_object.x + Character.JUMP_DISTANCE) > cat.sceneObject.x &&
          (_object.y - Character.JUMP_DISTANCE) < cat.sceneObject.y && (_object.y + Character.JUMP_DISTANCE) > cat.sceneObject.y) {
        if (_object.state != 4 && _object.state != 5) {
          _jumpAfter(cat);
        }
      } else if ((_object.x - DISTANCE) < cat.sceneObject.x && (_object.x + DISTANCE) > cat.sceneObject.x &&
          (_object.y - DISTANCE) < cat.sceneObject.y && (_object.y + DISTANCE) > cat.sceneObject.y) {
        _runAfter(cat);
      } else {
        _moveRandom();
        _x = _object.x.toDouble();
        _y = _object.y.toDouble();
      }
    } else if (_playerType == PASSIVE) {
      _moveRandom();
    } else if (_playerType == COWARD) {
      _moveRandom();
    }
  }

  void _moveRandom() {

    // Check if movement is changed
    _changeMovement();

    // Move
    _move();

  }

  void _changeMovement() {
    int move = _rnd.nextInt(20);

    if (move == 0) {
      _movementType = _rnd.nextInt(10);
      if (_movementType > 4) {
        _movementType = Character.DONT_MOVE;
      }
    }
  }

  void _move() {
    if (_movementType == Character.MOVE_UP) {
      moveUp();
    } else if (_movementType == Character.MOVE_DOWN) {
      moveDown();
    } else if (_movementType == Character.MOVE_LEFT) {
      moveLeft();
    } else if (_movementType == Character.MOVE_RIGHT) {
      moveRight();
    } else {
      notMoving();
    }
  }
}

class AssitantReferee extends FootballPlayer {

  AssitantReferee(SceneObject object) : super(object);

  @override void move(Cat cat) {

    // Check if movement is changed
    _changeMovement();
    
    if (_object.type == 13) { // Top assitant referee
      if (_movementType == Character.MOVE_LEFT && _object.x <= 40) {
        _movementType = Character.DONT_MOVE;
      } else if (_movementType == Character.MOVE_RIGHT && _object.x >= 460) {
        _movementType = Character.DONT_MOVE;
      }
    } else { // Bottom assitant referee
        if (_movementType == Character.MOVE_LEFT && _object.x <= 480) {
          _movementType = Character.DONT_MOVE;
        } else if (_movementType == Character.MOVE_RIGHT && _object.x >= 900) {
          _movementType = Character.DONT_MOVE;
        }
    }

    // Move
    _move();

  }

  @override void _changeMovement() {
    int move = _rnd.nextInt(20);

    if (move == 0) {
      _movementType = _rnd.nextInt(8);
      if (_movementType > 3 || _movementType == 2) {
        _movementType = Character.DONT_MOVE;
      }
    }
  }

}
