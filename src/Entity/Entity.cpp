#include "Entity.h"

const int Entity::DAMAGE_CD = 25;

Entity::Entity() {
    sprite = NULL;
}

Entity::~Entity() {
    if (sprite) {
        delete sprite;
    }
}

void Entity::setEntitySprite(sf::Sprite* sprite) {
    this->sprite = sprite;
}

bool Entity::isInFront(sf::FloatRect entity, sf::FloatRect target, Direction dir) {
    sf::FloatRect half;

    half.top = entity.top;
    half.width = entity.width / 2;
    half.height = entity.height;
    if (dir == Direction::LEFT) {
        half.left = entity.left;
    } else if (dir == Direction::RIGHT) {
        half.left = entity.left + half.width;
    }
    return half.intersects(target);
}

bool Entity::isAlive() {
    return life > 0;
}

void Entity::flipToLeft() {
    sprite->setOrigin(sf::Vector2f(0,0));
    sprite->setScale(1, 1);
    direction = Direction::LEFT;
}
void Entity::flipToRight() {
    sprite->setOrigin(sf::Vector2f(info->width,0));
    sprite->setScale(-1, 1);
    direction = Direction::RIGHT;
}

void Entity::setDistance(Collide collisions) {
    if (speed.x < 0) {
        speed.x = -collisions.left["distance"];
    } else if (speed.x > 0) {
        speed.x = collisions.right["distance"];
    }

    if (speed.y < 0) {
        speed.y = -collisions.top["distance"];
    } else {
        speed.y = collisions.bottom["distance"];
    }

    if(speed.x < 0) {
        flipToLeft();
    } else if (speed.x > 0) {
        flipToRight();
    }
}

void Entity::setHitboxes(EntityInfo *informations, const sf::Vector2f position) {
    std::vector< std::string > keys;

    for(std::map< std::string, std::vector< Hitbox > >::iterator it = hitboxes.begin(); it != hitboxes.end(); ++it) {
        keys.push_back(it->first);
    }
    for(std::vector< std::string >::iterator it = keys.begin(); it != keys.end(); ++it) {
        hitboxes.erase(*it);
    }

    for(std::map< std::string, HitboxInfo >::iterator it = informations->anim.begin(); it != informations->anim.end(); ++it) {
        for(std::vector< sf::FloatRect >::iterator hitboxIt = it->second.hitboxes.begin(); hitboxIt != it->second.hitboxes.end(); ++hitboxIt) {
            sf::FloatRect rec(*hitboxIt);
            rec.top += position.y;
            rec.left += position.x;
            Hitbox newHitbox(rec);
            hitboxes[it->first].push_back(newHitbox);
        }
    }
}

void Entity::removeCurrentHitBox(std::string animation, int frame) {
    hitboxes[animation].erase(hitboxes[animation].begin()+frame);
}

void Entity::addHitbox(std::string animation, Hitbox hitbox) {
    hitboxes[animation].push_back(hitbox);
}

Hitbox Entity::getCurrentHitbox(std::string animation, int frame) {
    return Hitbox(hitboxes[animation][frame]);
}

//to update with new tiles
int Entity::checkTiles(std::vector< std::vector<TileSprite*> > const& world, int x, int y) {
    TileType tile;

    if (x < 0 || x >= (int)world[0].size() || y < 0 || y >= (int)world.size())
        return 0;

    tile = world[y][x] ? world[y][x]->getType() : TileType::VOID;

    if (tile == TileType::DIRT ||
            tile == TileType::ROCK ||
            tile == TileType::ICE)
        return 1;
    return 0;
}

Collide Entity::collideWithTiles(std::vector< std::vector<TileSprite*> > const& world, sf::Vector2f *vit, float time, Hitbox hitbox) {
    Collide collideWith;
    sf::Vector2f step(std::abs(vit->x), std::abs(vit->y));

    float minX = std::get<0>(hitbox.getPoints()).x;
    float maxX = std::get<1>(hitbox.getPoints()).x;
    float minY = std::get<0>(hitbox.getPoints()).y;
    float maxY = std::get<1>(hitbox.getPoints()).y;

    int mapPnt;
    int tot = 0, totMin = 0, totMax = 0, incMin = 0, incMax = 0;

    collideWith.ground = TileType::VOID;
    collideWith.left["distance"] = collideWith.right["distance"] = step.x;
    //The +-1 is here because the hitbox will touch a bit the bottom/top/left/right tile, but it should not disturb the adjacent face
    for(float y = minY + 1; round(y) != round((maxY - 1) + BLOCK_SIZE); y += BLOCK_SIZE) {
        if (y > (maxY - 1))
            y = (maxY - 1);

        mapPnt = (int)std::floor(y / BLOCK_SIZE);
        incMin = incMax = 0;
        for (float stepX = 0; stepX <= step.x + 1 / time; stepX += 1) {
            if (checkTiles(world, (int)std::floor((minX - stepX * time) / BLOCK_SIZE), mapPnt)) {
                incMin = 1;
                if (collideWith.left["distance"] > stepX)
                    collideWith.left["distance"] = stepX;
            }
            if (checkTiles(world, (int)std::floor((maxX + stepX * time) / BLOCK_SIZE), mapPnt)) {
                incMax = 1;
                if (collideWith.right["distance"] > stepX)
                    collideWith.right["distance"] = stepX;
            }
        }
        totMin += incMin;
        totMax += incMax;
        ++tot;
    }
    if (tot > 0) {
        collideWith.left["surface"] = (float)totMin / tot;
        collideWith.right["surface"] = (float)totMax / tot;
    }

    tot = totMin = totMax = 0;
    collideWith.top["distance"] = collideWith.bottom["distance"] = step.y;
    for(float x = minX + 1; std::round(x) != std::round((maxX - 1) + BLOCK_SIZE); x += BLOCK_SIZE) {
        if (x > (maxX - 1))
            x = (maxX - 1);

        mapPnt = (int)std::floor(x / BLOCK_SIZE);
        incMin = incMax = 0;
        for (float stepY = 0; stepY <= step.y + 1 / time; stepY += 1) {
            if (checkTiles(world, mapPnt, (int)std::floor((minY - stepY * time) / BLOCK_SIZE))) {
                incMin = 1;
                if (collideWith.top["distance"] > stepY)
                    collideWith.top["distance"] = stepY;
            }
            if (checkTiles(world, mapPnt, (int)std::floor((maxY + stepY * time) / BLOCK_SIZE))) {
                incMax = 1;
                if (collideWith.bottom["distance"] > stepY)
                    collideWith.bottom["distance"] = stepY;
            }
        }
        totMin += incMin;
        totMax += incMax;
        ++tot;
    }
    if (tot > 0) {
        collideWith.top["surface"] = (float)totMin / tot;
        collideWith.bottom["surface"] = (float)totMax / tot;
    }

    //On test les diagonales
    if (vit->x > 0 && vit->y > 0 && checkTiles(world, (int)std::floor((maxX - 2 + collideWith.right["distance"]*time) / BLOCK_SIZE), (int)std::floor((maxY - 2 + collideWith.bottom["distance"]*time) / BLOCK_SIZE))) {
        collideWith.right["surface"] = 0.1;
        while (checkTiles(world, (int)std::floor((maxX - 2 + collideWith.right["distance"]*time) / BLOCK_SIZE), (int)std::floor((maxY - 2 + collideWith.bottom["distance"]*time) / BLOCK_SIZE)))
            collideWith.right["distance"] -= 1;
    }
    if (vit->x < 0 && vit->y > 0 && checkTiles(world, (int)std::floor((minX + 1 - collideWith.left["distance"]*time) / BLOCK_SIZE), (int)std::floor((maxY - 2 + collideWith.bottom["distance"]*time) / BLOCK_SIZE))) {
        collideWith.left["surface"] = 0.1;
        while (checkTiles(world, (int)std::floor((minX + 1 - collideWith.left["distance"]*time) / BLOCK_SIZE), (int)std::floor((maxY - 2 + collideWith.bottom["distance"]*time) / BLOCK_SIZE)))
            collideWith.left["distance"] -= 1;
    }
    if (vit->x > 0 && vit->y < 0 && checkTiles(world, (int)std::floor((maxX - 2 + collideWith.right["distance"]*time) / BLOCK_SIZE), (int)std::floor((minY + 1 - collideWith.top["distance"]*time) / BLOCK_SIZE))) {
        collideWith.right["surface"] = 0.1;
        while (checkTiles(world, (int)std::floor((maxX - 2 + collideWith.right["distance"]*time) / BLOCK_SIZE), (int)std::floor((minY + 1 - collideWith.top["distance"]*time) / BLOCK_SIZE)))
            collideWith.right["distance"] -= 1;
    }
    if (vit->x < 0 && vit->y < 0 && checkTiles(world, (int)std::floor((minX + 1 - collideWith.left["distance"]*time) / BLOCK_SIZE), (int)std::floor((minY + 1 - collideWith.top["distance"]*time) / BLOCK_SIZE))) {
        collideWith.left["surface"] = 0.1;
        while (checkTiles(world, (int)std::floor((minX + 1 - collideWith.left["distance"]*time) / BLOCK_SIZE), (int)std::floor((minY + 1 - collideWith.top["distance"]*time) / BLOCK_SIZE)))
            collideWith.left["distance"] -= 1;
    }

    if (collideWith.left["distance"] < 0) {
        collideWith.left["distance"] = 0;
    }
    if (collideWith.right["distance"] < 0) {
        collideWith.right["distance"] = 0;
    }
    if (collideWith.top["distance"] < 0) {
        collideWith.top["distance"] = 0;
    }
    if (collideWith.bottom["distance"] < 0) {
        collideWith.bottom["distance"] = 0;
    }

    //On check le ground
    float x = minX + 1;
    float mapY = (int)std::floor((maxY + collideWith.bottom["distance"] * time) / BLOCK_SIZE + 0.5f);
    while(x < maxX - 1 && collideWith.ground == TileType::VOID && collideWith.bottom["surface"]) {
        float mapX = (int)std::floor(x / BLOCK_SIZE);

        if (mapX >= 0 && mapX < (int)world[0].size() && mapY >= 0 && mapY < (int)world.size())
            collideWith.ground = world[mapY][mapX] ? world[mapY][mapX]->getType() : TileType::VOID;
        ++x;
    }

    return collideWith;
}

void Entity::computeGravity(sf::Time time) {
    speed.y += 1000*time.asSeconds();
}

void Entity::move(sf::Vector2f& diff) {
    move(diff.x, diff.y);
}

void Entity::move(float dx, float dy) {
    if(sprite) {
        sprite->move(dx, dy);
    }

    for (std::map< std::string, std::vector< Hitbox > >::iterator it = hitboxes.begin(); it != hitboxes.end(); ++it) {
        for(std::vector< Hitbox >::iterator hitbox = it->second.begin(); hitbox != it->second.end(); ++hitbox) {
            hitbox->move(dx, dy);
        }
    }
}

