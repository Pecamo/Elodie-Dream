#include "Elodie.h"

Elodie::Elodie() {
    init();
}

Elodie::Elodie(sf::Vector2f position) {
    init();
    sprite->setPosition(position.x - centerX, position.y - centerY);
}

Elodie::Elodie(float x, float y) {
    init();
    sprite->setPosition(x - centerX, y - centerY);
}

void Elodie::init() {
    state = ElodieState::WALKING;
    speed.x = 0.3;

    sprite = new ElodieSprite();
    setEntitySprite(sprite);

    //levelSpeed and hitboxes are set here for the moment, but it's not the right place to set them
    sf::Vector2f pnt1 = {82, 37}, pnt2 = {106, 82};
    Hitbox hitbox(pnt1, pnt2);
    speed.x = 0.1;
    setCurrentHitbox(0);
    addHitbox(hitbox);
}

ElodieSprite* Elodie::getSprite() {
    return sprite;
}

Elodie::~Elodie() {
    //  TODO : maybe source of memory leak
    //  delete sprite;
}

sf::Vector2f* Elodie::getPosition() {
    return new sf::Vector2f(sprite->getPosition().x + centerX, sprite->getPosition().y + centerY);
}

void Elodie::stand() {
    sprite->stand();
}

void Elodie::overworldMove() {
    if (goingDown) {
        toMove -= overworldSpeed.x;
        sprite->move(0, overworldSpeed.x);
    } else if (goingLeft) {
        toMove -= overworldSpeed.x;
        sprite->move(-overworldSpeed.x, 0);
    } else if (goingRight) {
        toMove -= overworldSpeed.x;
        sprite->move(+overworldSpeed.x, 0);
    } else if (goingUp) {
        toMove -= overworldSpeed.x;
        sprite->move(0, -overworldSpeed.x);
    } else {
        noMoves();
    }
}

void Elodie::setWalkDown() {
    this->walk();
    goingDown = true;
}
void Elodie::setWalkUp() {
    this->walk();
    goingUp = true;
}
void Elodie::setWalkRight() {
    this->walk();
    goingRight = true;
}
void Elodie::setWalkLeft() {
    this->walk();
    goingLeft = true;
}

void Elodie::setDistanceToMove(float dist) {
    toMove = dist;
}

bool Elodie::isMoving() {
    return goingDown or goingLeft or goingRight or goingUp;
}

bool Elodie::hasToMove() {
    return toMove > 0;
}

void Elodie::noMoves() {
    toMove = 0;
    goingDown = false;
    goingLeft = false;
    goingRight = false;
    goingUp = false;
}

void Elodie::update(sf::Time deltaTime) {
    sprite->update(deltaTime);
}

int Elodie::getImmersionLevel() {
    return immersionLevel;
}

int Elodie::getNightmareLevel() {
    return nightmareLevel;
}



void Elodie::walk() {
    sprite->walk();
}

//What's in doStuff right now is only for testing purpose. Lot of stuff to do here.
void Elodie::doStuff(EventHandler* const& event, std::vector< std::vector<TileSprite*> > const& tiles, sf::Time animate)
{
    std::map<std::string, float> collide;
    collide = collideWithTiles(tiles);

    if (sprite->getCurrentStance() == SpriteStance::STANDING)
        this->walk();

    if (collide["left"] && collide["right"]) {
        speed.x = 0;
    }
    else if ((collide["right"] && speed.x > 0) || (collide["left"] && speed.x < 0)) {
        speed.x = -speed.x;
    }

    if (collide["down"]) {
        speed.y = 0;

        if(state == ElodieState::FALLING) {
            state = ElodieState::WALKING;
        }
    }
    else {
        computeGravity();
    }

    if (event->keyIsPressed(sf::Keyboard::Space) && state == ElodieState::WALKING) {
        speed.y = -0.2; // TODO Put in const file
        state = ElodieState::FALLING;
        std::cout << "JUMP" << std::endl;
    }


    if (event->keyIsPressed(sf::Keyboard::E)) {
        std::cout << "Collision: Top = " << collide["up"] << ", Left = " << collide["left"] << ", Down = " << collide["down"] << ", Right = " << collide["right"] << std::endl;
    }

    move(speed);

    sprite->update(animate);
}

void Elodie::pause(){
    sprite->pause();
}

void Elodie::play(){
    sprite->play();
}
