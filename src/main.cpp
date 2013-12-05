#include <SFML/Graphics.hpp>
#include <vector>
#include <iostream>
#include <fstream>

#include "env.h"

#include "Sprite/AnimatedSprite.h"
#include "EventHandler/EventHandler.h"
#include "Json/JsonParser.h"
#include "Json/JsonAccessor.h"
#include "Game/Game.h"
#include "Overworld/Overworld.h"
#include "FileHandler/SaveHandler.h"

//Here for testing purpose. To remove later on
#include "EntityManager/EntityManager.h"

using std::cout;
using std::endl;

int main() {
    // Map Parsing test
    std::ofstream myfile;
    myfile.open ("example.txt");
    std::string test = "Writing this to a file.\n";
    std::string key = "key";
    std::vector<int> tmp;
    for(size_t i = 0; i < test.length(); ++i){
        //test[i] = test[i]^key[i%key.length()];
        tmp.push_back((int)test[i]^key[i%key.length()]);
    }
    for (size_t i = 0; i < tmp.size(); ++i){
        myfile << tmp[i] << std::endl;
    }
    myfile.close();
    tmp.clear();
    std::ifstream infile;
    infile.open("example.txt");
    int acc;
    while(infile>>acc){
        tmp.push_back(acc);
    }
    test = "";
    for(size_t i = 0; i < tmp.size(); ++i){
        test += ((char)tmp[i])^key[i%key.length()];
    }
    std::cout << test <<std::endl;
    Game* game = Game::getInstance();

    // SaveHandler test
    SaveHandler sh;
    sh.setPath("save/save.json");
    sh.save();


    if (false) {
        // Conf test
        JsonAccessor language = JsonAccessor();
        language.load("assets/config/languages/FR.lang");

        // Strings test
        cout << language.getString("Intro") << endl;
        cout << language.getString("Dev") << endl;
        cout << language.getString("End") << endl;

        JsonAccessor sheep = JsonAccessor();
        sheep.load("assets/img/sprites/enemies/sheep.json");

        std::vector< std::vector<int>* >* tab = sheep.getInt2DVector("anim.hitbox");
        for (unsigned int i = 0; i < tab->size(); ++i) {
            for (unsigned int j = 0; j < (*tab)[i]->size(); ++j) {
                cout << (*(*tab)[i])[j] << endl;
            }
        }
        cout << sheep.getString("anim name") << endl;
        cout << sheep.getString("anim name") << endl;
        cout << sheep.getString("anim name") << endl;
        cout << sheep.getString("anim name") << endl;
    }

    if (false) {
        EntityManager ToyBox;
        EntityInfo* sheep = ToyBox.getEnemyInfo(EntityType::ENEMY, EntityName::SHEEP);
        std::cout << std::endl << "sheep" << std::endl;
        std::cout << "height: " << sheep->height << std::endl;
        std::cout << "width: " << sheep->width << std::endl;
        for(std::map< std::string, HitboxInfo >::iterator it = sheep->anim.begin(); it != sheep->anim.end(); ++it) {
            std::cout << it->first << std::endl;
            std::cout << it->second.row << std::endl;
            for (unsigned int i = 0; i < it->second.hitboxes.size(); ++i) {
                std::cout << it->second.hitboxes[i].left << " " << it->second.hitboxes[i].top << " " << it->second.hitboxes[i].width << " " << it->second.hitboxes[i].height << std::endl;
            }
        }
        delete sheep;
    }

    game->run();
    game->kill();

    return 0;
}
