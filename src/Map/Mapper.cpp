#include "Mapper.h"

Mapper::Mapper() {

}

void Mapper::parse(std::string str, TileMap& tiles, EntitieVector& entities) {
    std::cout << "PARSING MAP" << std::endl;
    unsigned int y = 0;

    for(unsigned int i = 0; i < str.length(); i++) {
        // Entities
        switch(str[i]) {
            case MAP_ELODIE:

                entities.push_back(new Elodie());
                break;
            default:
                break;
        }

        // Terrain
        if(y >= tiles.size()) {
            tiles.push_back(std::vector<TileSprite*>());
        }

        switch(str[i]) {
            case MAP_GROUND:
                tiles[y].push_back(new TileSprite(TileType::GROUND));
                break;

            case MAP_LINE_BREAK:
                y++;
                break;

            case MAP_NULL:
                tiles[y].push_back(NULL);
                break;

            default:
                tiles[y].push_back(NULL);
                break;
        }
    }
}

void Mapper::print(TileMap& tiles, EntitieVector& entities) {
    std::cout << "PRINTING MAP" << std::endl;

    std::string out = "";
    for (TileMap::iterator col = tiles.begin(); col != tiles.end(); ++col) {
        for (std::vector<TileSprite*>::iterator it = col->begin(); it != col->end(); ++it) {
            TileSprite* tile = *it;

            if(!tile) {
                out += MAP_NULL;
            }
            else if(tile->getType() == TileType::GROUND) {
                out += MAP_GROUND;
            }
        }
        out += MAP_LINE_BREAK;
    }

    std::cout << out;
}