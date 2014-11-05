#include "Level.h"

Level::Level(GameView* gameView, std::string filename, LevelEnv env, Elodie* elodie) : Displayable(gameView)  {
    this->environement = env;
    this->manager = new TextureManager();

    loadLevel(filename, elodie);

    std::pair <float,float> slow = getSlowVariables(env);
    this->sky = new Sky(gameView, env, tiles[0].size(), elodie->getCameraPosPtr(), slow.first);
    this->earth = new Earth(gameView, env, tiles[0].size(), elodie->getCameraPosPtr(), slow.second);

    gameView->addView(ViewLayer::LEVEL, this);
    gameView->setZoom(ViewLayer::LEVEL, ZOOM_LEVEL);

    gameView->setCameraCenter(ViewLayer::LEVEL, elodie->getPosition());

    if (!music.openFromFile(MUSIC_PATH+"/"+LEVEL_MUSIC)) {
        // TODO Handle error
    } else {
        music.setLoop(true);

        Game* game = Game::getInstance();
        if(!game->isMute()) {
            music.play();
        }
    }

}

Level::~Level() {
    for(size_t i(0); i < tiles.size(); ++i) {
        for(size_t j(0); j < tiles[i].size(); ++j) {
            delete tiles[i][j];
        }
    }

    for(EntityMap::iterator it = entities.begin(); it != entities.end(); ++it) {
        if(it->first.compare("elodie")) {
            delete it->second;
        }
    }

    delete this->manager;
    delete this->sky;
    delete this->earth;
}

void Level::setEnvironement(LevelEnv env) {
    this->environement = env;
}

// Load a level from the file system
void Level::loadLevel(std::string filename, Elodie* elodie) {
    std::string levelSource = FileHandler::getContent(filename);

    Mapper::parse(levelSource, tiles, entities, elodie);
    Mapper::beautify(tiles);

    applyEnv(tiles);
}

// Ask the given view to draw a Level frame
void Level::display() {
    int cameraCenterX = this->getView()->getCenter().x;
    int cameraCenterY = this->getView()->getCenter().y;

    int marginLeft = cameraCenterX - HORIZONTAL_DISPLAY_MARGIN;
    int marginRight = cameraCenterX + HORIZONTAL_DISPLAY_MARGIN;
    int startX = marginLeft / 32;
    if(startX < 0 ) {
        startX = 0;
    }
    size_t endX = marginRight / 32;

    int marginTop = cameraCenterY - VERTICAL_DISPLAY_MARGIN;
    int marginBot = cameraCenterY + VERTICAL_DISPLAY_MARGIN;
    int startY = marginTop / 32;
    if(startY < 0 ) {
        startY = 0;
    }
    size_t endY = marginBot / 32;
    endY = endY > tiles.size() ? tiles.size() : endY;
    for(unsigned int y=startY; y<endY; y++) {
        size_t tmpEndX = endX > tiles[y].size() ? tiles[y].size() : endX;
        for(unsigned int x=startX; x<tmpEndX; x++) {
            if(tiles[y][x]) {
                tiles[y][x]->setPosition(x*32, y*32);
                gameView->addDrawable(ViewLayer::LEVEL, tiles[y][x]);
            }
        }
    }

    Portal* portal = dynamic_cast<Portal*>(entities["portal"]);
    if (portal->getSprite()) {
        gameView->addDrawable(ViewLayer::LEVEL, portal->getSprite());
    }
    for(EntityMap::iterator entity_ptr = entities.begin(); entity_ptr != entities.end(); ++entity_ptr) {
        if(entity_ptr->first != "elodie" && entity_ptr->first != "portal") {
            Entity* entity = entity_ptr->second;
            sf::Sprite* sprite = entity->getSprite();
            if (sprite->getPosition().x > marginLeft
                    && sprite->getPosition().x < marginRight
                    && sprite->getPosition().y < marginBot
                    && sprite->getPosition().y > marginTop) {
                if(sprite) {
                    gameView->addDrawable(ViewLayer::LEVEL, sprite);
                }
            }
        }
    }
    Elodie* elodie = dynamic_cast<Elodie*>(entities["elodie"]);
    if (elodie->getSprite()) {
        gameView->addDrawable(ViewLayer::LEVEL, elodie->getSprite());
    }
    gameView->followPoint(ViewLayer::LEVEL, elodie->getCameraPos());
}

void Level::live(EventHandler* const& event, sf::Time animate) {
    std::vector< std::string > toDelete;
    sf::FloatRect scope(0, 0, LIVE_SCOPE, LIVE_SCOPE);
    scope.top = ((Elodie*)entities["elodie"])->getPosition().y - LIVE_SCOPE / 2;
    scope.left = ((Elodie*)entities["elodie"])->getPosition().x - LIVE_SCOPE / 2;
    entities["elodie"]->doStuff(event, tiles, entities, animate);
    for (EntityMap::iterator it = entities.begin(); it != entities.end(); ++it) {
        if (it->first != "elodie" && scope.intersects(it->second->returnCurrentHitbox().getArea())) {
            it->second->doStuff(event, tiles, entities, animate);
            if (!it->second->isAlive()) {
                toDelete.push_back(it->first);
            }
        }
    }
    for (unsigned int i = 0; i < toDelete.size(); ++i) {
        delete entities[toDelete[i]];
        entities.erase(toDelete[i]);
    }
}

EntityMap Level::getEntities() {
    EntityMap entitiesCpy;

    for (EntityMap::iterator it = entities.begin(); it != entities.end(); ++it) {
        entitiesCpy.insert(std::make_pair(it->first, it->second));
    }
    return entitiesCpy;
}

void Level::applyEnv(TileMap tiles) {
    for(unsigned int y=0; y<tiles.size(); y++) {
        for(unsigned int x=0; x<tiles[y].size(); x++) {
            if(tiles[y][x]) {
                sf::Texture* texture = manager->getTileTexture(environement, tiles[y][x]->getType());
                tiles[y][x]->setTexture(*texture);
            }
        }
    }
}

void Level::pause() {
    entities["elodie"]->pause();
}

void Level::play(sf::Clock *frameClock) {
    entities["elodie"]->play();
    frameClock->restart();
}

sf::Music* Level::getMusic() {
    return &music;
}

bool Level::isDead() {
    Elodie* elodie = dynamic_cast<Elodie*>(entities["elodie"]);
    bool outOfCam = gameView->isPointOutsideView(ViewLayer::LEVEL, elodie->getPosition().x, elodie->getPosition().y);
    bool noMoreImmersion = elodie->getImmersionLevel() <= 0;
    bool fellInTheDepths = elodie->getPosition().y > tiles.size()*32;
    return outOfCam || noMoreImmersion || fellInTheDepths;
}

bool Level::isCleared() {
    Elodie* elodie = dynamic_cast<Elodie*>(entities["elodie"]);
    Portal* portal = dynamic_cast<Portal*>(entities["portal"]);
    return portal->returnCurrentHitbox().getArea().intersects(elodie->returnCurrentHitbox().getArea());
}

bool Level::mustLeave() {
    return isDead() || isCleared();
}

std::pair <float,float> Level::getSlowVariables(LevelEnv env) {
    float skyS=0;
    float earthS=0;
    switch(env) {
    case LevelEnv::FIELD:
        skyS = 0;
        earthS = 0.5;
        break;
    case LevelEnv::CASTLE:
        skyS = 1.0;
        earthS = 0.4;
        break;
    case LevelEnv::VOLCANO:
        skyS = 0.15;
        earthS = 0.5;
        break;
    case LevelEnv::FRELJORD:
        skyS = 0.2;
        earthS = 2.8;
        break;
    default:
        skyS = 0;
        earthS = 0;
        break;
    }
    return std::make_pair(skyS,earthS);
}
