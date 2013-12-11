#ifndef ENTITIE_H
#define ENTITIE_H

#include <iostream>
#include <map>
#include <SFML/Graphics.hpp>

#include "../Sprite/TileSprite.h"
#include "../Sprite/AnimatedSprite.h"
#include "../EventHandler/EventHandler.h"
#include "../Json/JsonAccessor.h"
#include "../Include/Collide.h"
#include "../Include/EntityInfo.h"
#include "../const.h"
#include "Hitbox.h"

enum class Direction {
    LEFT, RIGHT
};

/**
* The class representing entities.
*/
class Entity {
public:
    /**
    * \brief The constructor of Entity. Sets its sprite to be NULL.
    */
    Entity();

    Entity(sf::Sprite* sprite);
    /**
    * \brief The destructor of Entity.
    */
    virtual ~Entity();

    void setHitboxes(EntityInfo *informations, const sf::Vector2f position);
    void addHitbox(std::string animation, Hitbox hitbox);
    void removeCurrentHitBox(std::string animation, int frame);
    Hitbox getCurrentHitbox(std::string animation, int frame);

    Collide collideWithTiles(std::vector< std::vector<TileSprite*> > const& world, sf::Vector2f *vit, float time, Hitbox hitbox);

    /**
    * \brief A getter to the main Sprite
    *
    * \return A pointer to the Sprite.
    */
    virtual sf::Sprite* getSprite() = 0;
    virtual void takeDamage(int damage, bool ignore) = 0;

    void setEntitySprite(sf::Sprite* sprite);

    bool isInFront(sf::FloatRect entity, sf::FloatRect target, Direction dir);
    bool isAlive();

    void flipToLeft();
    void flipToRight();
    void setDistance(Collide collisions);

    virtual Hitbox returnCurrentHitbox() = 0;
    virtual void doStuff(EventHandler* const& event, std::vector< std::vector<TileSprite*> > const& tiles, std::map< std::string, Entity* >& entities, sf::Time animate) = 0;

    void computeGravity(sf::Time time);
    void move(sf::Vector2f& diff);
    void move(float dx, float dy);

    virtual void pause() = 0;
    virtual void play() = 0;
protected:
    sf::Sprite* sprite;
    sf::Vector2f speed;
    Direction direction = Direction::LEFT;
    int life = 0;
    int damageCD = 0;

private:
    int checkTiles(std::vector< std::vector<TileSprite*> > const& world, int x, int y);
    std::map< std::string, std::vector< Hitbox > > hitboxes;
};

#endif // ENTITIES_H
