#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WORKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++

INC = 
CFLAGS = -Wmain -pedantic-errors -pedantic -std=c++11 -Wextra -Wall
RESINC = 
LIBDIR = 
LIB = 
LDFLAGS = -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -lsfml-network

INC_DEBUG = $(INC) -Irapidjson/include -Isfml/include -Isrc/Menu -Isrc/FileHandler
CFLAGS_DEBUG = $(CFLAGS) -g -Wmain -pedantic -std=c++11 -Wextra -Wall -fexceptions -Werror
RESINC_DEBUG = $(RESINC)
RCFLAGS_DEBUG = $(RCFLAGS)
LIBDIR_DEBUG = $(LIBDIR) 
LIB_DEBUG = 
LDFLAGS_DEBUG = $(LDFLAGS)
OBJDIR_DEBUG = obj/Debug
DEP_DEBUG = 
OUT_DEBUG = Elodie-debug

INC_RELEASE = $(INC) -Irapidjson/include -Isfml/include -Isrc/Menu -Isrc/FileHandler
CFLAGS_RELEASE = $(CFLAGS) -O2 -std=c++11 -Wextra -fexceptions -Werror
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR) -Lsfml/lib -Llibs
LIB_RELEASE = $(LIB)sfml/lib/libsfml-graphics.a sfml/lib/libsfml-system.a sfml/lib/libsfml-window.a sfml/lib/libsfml-main.a sfml/lib/libsfml-audio.a sfml/lib/libsfml-network.a
LDFLAGS_RELEASE = $(LDFLAGS) -s
OBJDIR_RELEASE = obj/Release
DEP_RELEASE = 
OUT_RELEASE = Elodie-release

OBJ_DEBUG = $(OBJDIR_DEBUG)/src/Sky/Sky.o $(OBJDIR_DEBUG)/src/Sky/Earth.o $(OBJDIR_DEBUG)/src/Score/StatsBoard.o $(OBJDIR_DEBUG)/src/Score/ScoreManager.o $(OBJDIR_DEBUG)/src/Score/ScoreBoard.o $(OBJDIR_DEBUG)/src/Score/Score.o $(OBJDIR_DEBUG)/src/Overworld/Overworld.o $(OBJDIR_DEBUG)/src/Sound/SoundManager.o $(OBJDIR_DEBUG)/src/Menu/TitleScreen.o $(OBJDIR_DEBUG)/src/Menu/TitleMenu.o $(OBJDIR_DEBUG)/src/Menu/MenuHandler.o $(OBJDIR_DEBUG)/src/Menu/MenuComponent.o $(OBJDIR_DEBUG)/src/Menu/Menu.o $(OBJDIR_DEBUG)/src/Map/Mapper.o $(OBJDIR_DEBUG)/src/Level/Level.o $(OBJDIR_DEBUG)/src/Sprite/Interactive.o $(OBJDIR_DEBUG)/src/main.o $(OBJDIR_DEBUG)/src/Utils/Utils.o $(OBJDIR_DEBUG)/src/Utils/Date.o $(OBJDIR_DEBUG)/src/TextureManager/TextureManager.o $(OBJDIR_DEBUG)/src/Sprite/TileSprite.o $(OBJDIR_DEBUG)/src/Sprite/EnvSprite.o $(OBJDIR_DEBUG)/src/Sprite/EntitySprite.o $(OBJDIR_DEBUG)/src/Sprite/ElodieSprite.o $(OBJDIR_DEBUG)/src/Sprite/CharacterSprite.o $(OBJDIR_DEBUG)/src/Sprite/Animation.o $(OBJDIR_DEBUG)/src/Sprite/AnimatedSprite.o $(OBJDIR_DEBUG)/src/Entity/Portal.o $(OBJDIR_DEBUG)/src/Entity/Poro.o $(OBJDIR_DEBUG)/src/Entity/Hitbox.o $(OBJDIR_DEBUG)/src/Entity/Entity.o $(OBJDIR_DEBUG)/src/Entity/Enemy/Spikes.o $(OBJDIR_DEBUG)/src/Entity/Enemy/Sheep.o $(OBJDIR_DEBUG)/src/Entity/Enemy/MagmaCube.o $(OBJDIR_DEBUG)/src/EventHandler/EventHandler.o $(OBJDIR_DEBUG)/src/Entity/Enemy/Ghost.o $(OBJDIR_DEBUG)/src/Entity/Enemy/Bristle.o $(OBJDIR_DEBUG)/src/Entity/Elodie.o $(OBJDIR_DEBUG)/src/Entity/Bonus.o $(OBJDIR_DEBUG)/src/EntityManager/EntityManager.o $(OBJDIR_DEBUG)/src/Displayable/Displayable.o $(OBJDIR_DEBUG)/src/Console/Console.o $(OBJDIR_DEBUG)/src/Level/Hud.o $(OBJDIR_DEBUG)/src/Level/EndingScreen.o $(OBJDIR_DEBUG)/src/Level/Death.o $(OBJDIR_DEBUG)/src/Json/JsonStringifier.o $(OBJDIR_DEBUG)/src/Json/JsonAccessor.o  $(OBJDIR_DEBUG)/src/Item/Item.o $(OBJDIR_DEBUG)/src/Game/GameView.o $(OBJDIR_DEBUG)/src/Game/Game.o $(OBJDIR_DEBUG)/src/Fnu/Girly.o $(OBJDIR_DEBUG)/src/FileHandler/SaveHandler.o $(OBJDIR_DEBUG)/src/FileHandler/FileHandler.o $(OBJDIR_DEBUG)/src/FileHandler/ConfigManager.o

OBJ_RELEASE = $(OBJDIR_RELEASE)/src/Sky/Sky.o $(OBJDIR_RELEASE)/src/Sky/Earth.o $(OBJDIR_RELEASE)/src/Score/StatsBoard.o $(OBJDIR_RELEASE)/src/Score/ScoreManager.o $(OBJDIR_RELEASE)/src/Score/ScoreBoard.o $(OBJDIR_RELEASE)/src/Score/Score.o $(OBJDIR_RELEASE)/src/Overworld/Overworld.o $(OBJDIR_RELEASE)/src/Sound/SoundManager.o $(OBJDIR_RELEASE)/src/Menu/TitleScreen.o $(OBJDIR_RELEASE)/src/Menu/TitleMenu.o $(OBJDIR_RELEASE)/src/Menu/MenuHandler.o $(OBJDIR_RELEASE)/src/Menu/MenuComponent.o $(OBJDIR_RELEASE)/src/Menu/Menu.o $(OBJDIR_RELEASE)/src/Map/Mapper.o $(OBJDIR_RELEASE)/src/Level/Level.o $(OBJDIR_RELEASE)/src/Sprite/Interactive.o $(OBJDIR_RELEASE)/src/main.o $(OBJDIR_RELEASE)/src/Utils/Utils.o $(OBJDIR_RELEASE)/src/Utils/Date.o $(OBJDIR_RELEASE)/src/TextureManager/TextureManager.o $(OBJDIR_RELEASE)/src/Sprite/TileSprite.o $(OBJDIR_RELEASE)/src/Sprite/EnvSprite.o $(OBJDIR_RELEASE)/src/Sprite/EntitySprite.o $(OBJDIR_RELEASE)/src/Sprite/ElodieSprite.o $(OBJDIR_RELEASE)/src/Sprite/CharacterSprite.o $(OBJDIR_RELEASE)/src/Sprite/Animation.o $(OBJDIR_RELEASE)/src/Sprite/AnimatedSprite.o $(OBJDIR_RELEASE)/src/Entity/Portal.o $(OBJDIR_RELEASE)/src/Entity/Poro.o $(OBJDIR_RELEASE)/src/Entity/Hitbox.o $(OBJDIR_RELEASE)/src/Entity/Entity.o $(OBJDIR_RELEASE)/src/Entity/Enemy/Spikes.o $(OBJDIR_RELEASE)/src/Entity/Enemy/Sheep.o $(OBJDIR_RELEASE)/src/Entity/Enemy/MagmaCube.o $(OBJDIR_RELEASE)/src/EventHandler/EventHandler.o $(OBJDIR_RELEASE)/src/Entity/Enemy/Ghost.o $(OBJDIR_RELEASE)/src/Entity/Enemy/Bristle.o $(OBJDIR_RELEASE)/src/Entity/Elodie.o $(OBJDIR_RELEASE)/src/Entity/Bonus.o $(OBJDIR_RELEASE)/src/EntityManager/EntityManager.o $(OBJDIR_RELEASE)/src/Displayable/Displayable.o $(OBJDIR_RELEASE)/src/Console/Console.o $(OBJDIR_RELEASE)/src/Level/Hud.o $(OBJDIR_RELEASE)/src/Level/EndingScreen.o $(OBJDIR_RELEASE)/src/Level/Death.o $(OBJDIR_RELEASE)/src/Json/JsonStringifier.o $(OBJDIR_RELEASE)/src/Json/JsonAccessor.o $(OBJDIR_RELEASE)/src/Item/Item.o $(OBJDIR_RELEASE)/src/Game/GameView.o $(OBJDIR_RELEASE)/src/Game/Game.o $(OBJDIR_RELEASE)/src/Fnu/Girly.o $(OBJDIR_RELEASE)/src/FileHandler/SaveHandler.o $(OBJDIR_RELEASE)/src/FileHandler/FileHandler.o $(OBJDIR_RELEASE)/src/FileHandler/ConfigManager.o

all: debug release

clean: clean_debug clean_release

before_debug: 
	test -d $(OBJDIR_DEBUG)/src/Sky || mkdir -p $(OBJDIR_DEBUG)/src/Sky
	test -d $(OBJDIR_DEBUG)/src/Score || mkdir -p $(OBJDIR_DEBUG)/src/Score
	test -d $(OBJDIR_DEBUG)/src/Overworld || mkdir -p $(OBJDIR_DEBUG)/src/Overworld
	test -d $(OBJDIR_DEBUG)/src/Sound || mkdir -p $(OBJDIR_DEBUG)/src/Sound
	test -d $(OBJDIR_DEBUG)/src/Menu || mkdir -p $(OBJDIR_DEBUG)/src/Menu
	test -d $(OBJDIR_DEBUG)/src/Map || mkdir -p $(OBJDIR_DEBUG)/src/Map
	test -d $(OBJDIR_DEBUG)/src/Level || mkdir -p $(OBJDIR_DEBUG)/src/Level
	test -d $(OBJDIR_DEBUG)/src/Sprite || mkdir -p $(OBJDIR_DEBUG)/src/Sprite
	test -d $(OBJDIR_DEBUG)/src || mkdir -p $(OBJDIR_DEBUG)/src
	test -d $(OBJDIR_DEBUG)/src/Utils || mkdir -p $(OBJDIR_DEBUG)/src/Utils
	test -d $(OBJDIR_DEBUG)/src/TextureManager || mkdir -p $(OBJDIR_DEBUG)/src/TextureManager
	test -d $(OBJDIR_DEBUG)/src/Entity || mkdir -p $(OBJDIR_DEBUG)/src/Entity
	test -d $(OBJDIR_DEBUG)/src/Entity/Enemy || mkdir -p $(OBJDIR_DEBUG)/src/Entity/Enemy
	test -d $(OBJDIR_DEBUG)/src/EventHandler || mkdir -p $(OBJDIR_DEBUG)/src/EventHandler
	test -d $(OBJDIR_DEBUG)/src/EntityManager || mkdir -p $(OBJDIR_DEBUG)/src/EntityManager
	test -d $(OBJDIR_DEBUG)/src/Displayable || mkdir -p $(OBJDIR_DEBUG)/src/Displayable
	test -d $(OBJDIR_DEBUG)/src/Console || mkdir -p $(OBJDIR_DEBUG)/src/Console
	test -d $(OBJDIR_DEBUG)/src/Json || mkdir -p $(OBJDIR_DEBUG)/src/Json
	test -d $(OBJDIR_DEBUG)/src/Item || mkdir -p $(OBJDIR_DEBUG)/src/Item
	test -d $(OBJDIR_DEBUG) || mkdir -p $(OBJDIR_DEBUG)
	test -d $(OBJDIR_DEBUG)/src/Game || mkdir -p $(OBJDIR_DEBUG)/src/Game
	test -d $(OBJDIR_DEBUG)/src/Fnu || mkdir -p $(OBJDIR_DEBUG)/src/Fnu
	test -d $(OBJDIR_DEBUG)/src/FileHandler || mkdir -p $(OBJDIR_DEBUG)/src/FileHandler

after_debug: 

debug: before_debug out_debug after_debug

out_debug: before_debug $(OBJ_DEBUG) $(DEP_DEBUG)
	$(LD) $(LIBDIR_DEBUG) -o $(OUT_DEBUG) $(OBJ_DEBUG)  $(LDFLAGS_DEBUG) $(LIB_DEBUG)

$(OBJDIR_DEBUG)/src/Sky/Sky.o: src/Sky/Sky.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sky/Sky.cpp -o $(OBJDIR_DEBUG)/src/Sky/Sky.o

$(OBJDIR_DEBUG)/src/Sky/Earth.o: src/Sky/Earth.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sky/Earth.cpp -o $(OBJDIR_DEBUG)/src/Sky/Earth.o

$(OBJDIR_DEBUG)/src/Score/StatsBoard.o: src/Score/StatsBoard.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Score/StatsBoard.cpp -o $(OBJDIR_DEBUG)/src/Score/StatsBoard.o

$(OBJDIR_DEBUG)/src/Score/ScoreManager.o: src/Score/ScoreManager.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Score/ScoreManager.cpp -o $(OBJDIR_DEBUG)/src/Score/ScoreManager.o

$(OBJDIR_DEBUG)/src/Score/ScoreBoard.o: src/Score/ScoreBoard.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Score/ScoreBoard.cpp -o $(OBJDIR_DEBUG)/src/Score/ScoreBoard.o

$(OBJDIR_DEBUG)/src/Score/Score.o: src/Score/Score.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Score/Score.cpp -o $(OBJDIR_DEBUG)/src/Score/Score.o

$(OBJDIR_DEBUG)/src/Overworld/Overworld.o: src/Overworld/Overworld.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Overworld/Overworld.cpp -o $(OBJDIR_DEBUG)/src/Overworld/Overworld.o

$(OBJDIR_DEBUG)/src/Sound/SoundManager.o: src/Sound/SoundManager.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sound/SoundManager.cpp -o $(OBJDIR_DEBUG)/src/Sound/SoundManager.o

$(OBJDIR_DEBUG)/src/Menu/TitleScreen.o: src/Menu/TitleScreen.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Menu/TitleScreen.cpp -o $(OBJDIR_DEBUG)/src/Menu/TitleScreen.o

$(OBJDIR_DEBUG)/src/Menu/TitleMenu.o: src/Menu/TitleMenu.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Menu/TitleMenu.cpp -o $(OBJDIR_DEBUG)/src/Menu/TitleMenu.o

$(OBJDIR_DEBUG)/src/Menu/MenuHandler.o: src/Menu/MenuHandler.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Menu/MenuHandler.cpp -o $(OBJDIR_DEBUG)/src/Menu/MenuHandler.o

$(OBJDIR_DEBUG)/src/Menu/MenuComponent.o: src/Menu/MenuComponent.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Menu/MenuComponent.cpp -o $(OBJDIR_DEBUG)/src/Menu/MenuComponent.o

$(OBJDIR_DEBUG)/src/Menu/Menu.o: src/Menu/Menu.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Menu/Menu.cpp -o $(OBJDIR_DEBUG)/src/Menu/Menu.o

$(OBJDIR_DEBUG)/src/Map/Mapper.o: src/Map/Mapper.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Map/Mapper.cpp -o $(OBJDIR_DEBUG)/src/Map/Mapper.o

$(OBJDIR_DEBUG)/src/Level/Level.o: src/Level/Level.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Level/Level.cpp -o $(OBJDIR_DEBUG)/src/Level/Level.o

$(OBJDIR_DEBUG)/src/Sprite/Interactive.o: src/Sprite/Interactive.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/Interactive.cpp -o $(OBJDIR_DEBUG)/src/Sprite/Interactive.o

$(OBJDIR_DEBUG)/src/main.o: src/main.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/main.cpp -o $(OBJDIR_DEBUG)/src/main.o

$(OBJDIR_DEBUG)/src/Utils/Utils.o: src/Utils/Utils.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Utils/Utils.cpp -o $(OBJDIR_DEBUG)/src/Utils/Utils.o

$(OBJDIR_DEBUG)/src/Utils/Date.o: src/Utils/Date.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Utils/Date.cpp -o $(OBJDIR_DEBUG)/src/Utils/Date.o

$(OBJDIR_DEBUG)/src/TextureManager/TextureManager.o: src/TextureManager/TextureManager.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/TextureManager/TextureManager.cpp -o $(OBJDIR_DEBUG)/src/TextureManager/TextureManager.o

$(OBJDIR_DEBUG)/src/Sprite/TileSprite.o: src/Sprite/TileSprite.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/TileSprite.cpp -o $(OBJDIR_DEBUG)/src/Sprite/TileSprite.o

$(OBJDIR_DEBUG)/src/Sprite/EnvSprite.o: src/Sprite/EnvSprite.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/EnvSprite.cpp -o $(OBJDIR_DEBUG)/src/Sprite/EnvSprite.o

$(OBJDIR_DEBUG)/src/Sprite/EntitySprite.o: src/Sprite/EntitySprite.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/EntitySprite.cpp -o $(OBJDIR_DEBUG)/src/Sprite/EntitySprite.o

$(OBJDIR_DEBUG)/src/Sprite/ElodieSprite.o: src/Sprite/ElodieSprite.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/ElodieSprite.cpp -o $(OBJDIR_DEBUG)/src/Sprite/ElodieSprite.o

$(OBJDIR_DEBUG)/src/Sprite/CharacterSprite.o: src/Sprite/CharacterSprite.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/CharacterSprite.cpp -o $(OBJDIR_DEBUG)/src/Sprite/CharacterSprite.o

$(OBJDIR_DEBUG)/src/Sprite/Animation.o: src/Sprite/Animation.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/Animation.cpp -o $(OBJDIR_DEBUG)/src/Sprite/Animation.o

$(OBJDIR_DEBUG)/src/Sprite/AnimatedSprite.o: src/Sprite/AnimatedSprite.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Sprite/AnimatedSprite.cpp -o $(OBJDIR_DEBUG)/src/Sprite/AnimatedSprite.o

$(OBJDIR_DEBUG)/src/Entity/Portal.o: src/Entity/Portal.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Portal.cpp -o $(OBJDIR_DEBUG)/src/Entity/Portal.o

$(OBJDIR_DEBUG)/src/Entity/Poro.o: src/Entity/Poro.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Poro.cpp -o $(OBJDIR_DEBUG)/src/Entity/Poro.o

$(OBJDIR_DEBUG)/src/Entity/Hitbox.o: src/Entity/Hitbox.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Hitbox.cpp -o $(OBJDIR_DEBUG)/src/Entity/Hitbox.o

$(OBJDIR_DEBUG)/src/Entity/Entity.o: src/Entity/Entity.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Entity.cpp -o $(OBJDIR_DEBUG)/src/Entity/Entity.o

$(OBJDIR_DEBUG)/src/Entity/Enemy/Spikes.o: src/Entity/Enemy/Spikes.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Enemy/Spikes.cpp -o $(OBJDIR_DEBUG)/src/Entity/Enemy/Spikes.o

$(OBJDIR_DEBUG)/src/Entity/Enemy/Sheep.o: src/Entity/Enemy/Sheep.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Enemy/Sheep.cpp -o $(OBJDIR_DEBUG)/src/Entity/Enemy/Sheep.o

$(OBJDIR_DEBUG)/src/Entity/Enemy/MagmaCube.o: src/Entity/Enemy/MagmaCube.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Enemy/MagmaCube.cpp -o $(OBJDIR_DEBUG)/src/Entity/Enemy/MagmaCube.o

$(OBJDIR_DEBUG)/src/EventHandler/EventHandler.o: src/EventHandler/EventHandler.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/EventHandler/EventHandler.cpp -o $(OBJDIR_DEBUG)/src/EventHandler/EventHandler.o

$(OBJDIR_DEBUG)/src/Entity/Enemy/Ghost.o: src/Entity/Enemy/Ghost.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Enemy/Ghost.cpp -o $(OBJDIR_DEBUG)/src/Entity/Enemy/Ghost.o

$(OBJDIR_DEBUG)/src/Entity/Enemy/Bristle.o: src/Entity/Enemy/Bristle.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Enemy/Bristle.cpp -o $(OBJDIR_DEBUG)/src/Entity/Enemy/Bristle.o

$(OBJDIR_DEBUG)/src/Entity/Elodie.o: src/Entity/Elodie.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Elodie.cpp -o $(OBJDIR_DEBUG)/src/Entity/Elodie.o

$(OBJDIR_DEBUG)/src/Entity/Bonus.o: src/Entity/Bonus.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Entity/Bonus.cpp -o $(OBJDIR_DEBUG)/src/Entity/Bonus.o

$(OBJDIR_DEBUG)/src/EntityManager/EntityManager.o: src/EntityManager/EntityManager.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/EntityManager/EntityManager.cpp -o $(OBJDIR_DEBUG)/src/EntityManager/EntityManager.o

$(OBJDIR_DEBUG)/src/Displayable/Displayable.o: src/Displayable/Displayable.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Displayable/Displayable.cpp -o $(OBJDIR_DEBUG)/src/Displayable/Displayable.o

$(OBJDIR_DEBUG)/src/Console/Console.o: src/Console/Console.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Console/Console.cpp -o $(OBJDIR_DEBUG)/src/Console/Console.o

$(OBJDIR_DEBUG)/src/Level/Hud.o: src/Level/Hud.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Level/Hud.cpp -o $(OBJDIR_DEBUG)/src/Level/Hud.o

$(OBJDIR_DEBUG)/src/Level/EndingScreen.o: src/Level/EndingScreen.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Level/EndingScreen.cpp -o $(OBJDIR_DEBUG)/src/Level/EndingScreen.o

$(OBJDIR_DEBUG)/src/Level/Death.o: src/Level/Death.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Level/Death.cpp -o $(OBJDIR_DEBUG)/src/Level/Death.o

$(OBJDIR_DEBUG)/src/Json/JsonStringifier.o: src/Json/JsonStringifier.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Json/JsonStringifier.cpp -o $(OBJDIR_DEBUG)/src/Json/JsonStringifier.o

$(OBJDIR_DEBUG)/src/Json/JsonAccessor.o: src/Json/JsonAccessor.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Json/JsonAccessor.cpp -o $(OBJDIR_DEBUG)/src/Json/JsonAccessor.o

$(OBJDIR_DEBUG)/src/Item/Item.o: src/Item/Item.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Item/Item.cpp -o $(OBJDIR_DEBUG)/src/Item/Item.o

$(OBJDIR_DEBUG)/src/Game/GameView.o: src/Game/GameView.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Game/GameView.cpp -o $(OBJDIR_DEBUG)/src/Game/GameView.o

$(OBJDIR_DEBUG)/src/Game/Game.o: src/Game/Game.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Game/Game.cpp -o $(OBJDIR_DEBUG)/src/Game/Game.o

$(OBJDIR_DEBUG)/src/Fnu/Girly.o: src/Fnu/Girly.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Fnu/Girly.cpp -o $(OBJDIR_DEBUG)/src/Fnu/Girly.o

$(OBJDIR_DEBUG)/src/FileHandler/SaveHandler.o: src/FileHandler/SaveHandler.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/FileHandler/SaveHandler.cpp -o $(OBJDIR_DEBUG)/src/FileHandler/SaveHandler.o

$(OBJDIR_DEBUG)/src/FileHandler/FileHandler.o: src/FileHandler/FileHandler.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/FileHandler/FileHandler.cpp -o $(OBJDIR_DEBUG)/src/FileHandler/FileHandler.o

$(OBJDIR_DEBUG)/src/FileHandler/ConfigManager.o: src/FileHandler/ConfigManager.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/FileHandler/ConfigManager.cpp -o $(OBJDIR_DEBUG)/src/FileHandler/ConfigManager.o

clean_debug: 
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf $(OBJDIR_DEBUG)/src/Sky
	rm -rf $(OBJDIR_DEBUG)/src/Score
	rm -rf $(OBJDIR_DEBUG)/src/Overworld
	rm -rf $(OBJDIR_DEBUG)/src/Sound
	rm -rf $(OBJDIR_DEBUG)/src/Menu
	rm -rf $(OBJDIR_DEBUG)/src/Map
	rm -rf $(OBJDIR_DEBUG)/src/Level
	rm -rf $(OBJDIR_DEBUG)/src/Sprite
	rm -rf $(OBJDIR_DEBUG)/src
	rm -rf $(OBJDIR_DEBUG)/src/Utils
	rm -rf $(OBJDIR_DEBUG)/src/TextureManager
	rm -rf $(OBJDIR_DEBUG)/src/Entity
	rm -rf $(OBJDIR_DEBUG)/src/Entity/Enemy
	rm -rf $(OBJDIR_DEBUG)/src/EventHandler
	rm -rf $(OBJDIR_DEBUG)/src/EntityManager
	rm -rf $(OBJDIR_DEBUG)/src/Displayable
	rm -rf $(OBJDIR_DEBUG)/src/Console
	rm -rf $(OBJDIR_DEBUG)/src/Json
	rm -rf $(OBJDIR_DEBUG)/src/Item
	rm -rf $(OBJDIR_DEBUG)
	rm -rf $(OBJDIR_DEBUG)/src/Game
	rm -rf $(OBJDIR_DEBUG)/src/Fnu
	rm -rf $(OBJDIR_DEBUG)/src/FileHandler

before_release: 
	test -d $(OBJDIR_RELEASE)/src/Sky || mkdir -p $(OBJDIR_RELEASE)/src/Sky
	test -d $(OBJDIR_RELEASE)/src/Score || mkdir -p $(OBJDIR_RELEASE)/src/Score
	test -d $(OBJDIR_RELEASE)/src/Overworld || mkdir -p $(OBJDIR_RELEASE)/src/Overworld
	test -d $(OBJDIR_RELEASE)/src/Sound || mkdir -p $(OBJDIR_RELEASE)/src/Sound
	test -d $(OBJDIR_RELEASE)/src/Menu || mkdir -p $(OBJDIR_RELEASE)/src/Menu
	test -d $(OBJDIR_RELEASE)/src/Map || mkdir -p $(OBJDIR_RELEASE)/src/Map
	test -d $(OBJDIR_RELEASE)/src/Level || mkdir -p $(OBJDIR_RELEASE)/src/Level
	test -d $(OBJDIR_RELEASE)/src/Sprite || mkdir -p $(OBJDIR_RELEASE)/src/Sprite
	test -d $(OBJDIR_RELEASE)/src || mkdir -p $(OBJDIR_RELEASE)/src
	test -d $(OBJDIR_RELEASE)/src/Utils || mkdir -p $(OBJDIR_RELEASE)/src/Utils
	test -d $(OBJDIR_RELEASE)/src/TextureManager || mkdir -p $(OBJDIR_RELEASE)/src/TextureManager
	test -d $(OBJDIR_RELEASE)/src/Entity || mkdir -p $(OBJDIR_RELEASE)/src/Entity
	test -d $(OBJDIR_RELEASE)/src/Entity/Enemy || mkdir -p $(OBJDIR_RELEASE)/src/Entity/Enemy
	test -d $(OBJDIR_RELEASE)/src/EventHandler || mkdir -p $(OBJDIR_RELEASE)/src/EventHandler
	test -d $(OBJDIR_RELEASE)/src/EntityManager || mkdir -p $(OBJDIR_RELEASE)/src/EntityManager
	test -d $(OBJDIR_RELEASE)/src/Displayable || mkdir -p $(OBJDIR_RELEASE)/src/Displayable
	test -d $(OBJDIR_RELEASE)/src/Console || mkdir -p $(OBJDIR_RELEASE)/src/Console
	test -d $(OBJDIR_RELEASE)/src/Json || mkdir -p $(OBJDIR_RELEASE)/src/Json
	test -d $(OBJDIR_RELEASE)/src/Item || mkdir -p $(OBJDIR_RELEASE)/src/Item
	test -d $(OBJDIR_RELEASE) || mkdir -p $(OBJDIR_RELEASE)
	test -d $(OBJDIR_RELEASE)/src/Game || mkdir -p $(OBJDIR_RELEASE)/src/Game
	test -d $(OBJDIR_RELEASE)/src/Fnu || mkdir -p $(OBJDIR_RELEASE)/src/Fnu
	test -d $(OBJDIR_RELEASE)/src/FileHandler || mkdir -p $(OBJDIR_RELEASE)/src/FileHandler

after_release: 

release: before_release out_release after_release

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_RELEASE)  $(LDFLAGS_RELEASE) $(LIB_RELEASE)

$(OBJDIR_RELEASE)/src/Sky/Sky.o: src/Sky/Sky.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sky/Sky.cpp -o $(OBJDIR_RELEASE)/src/Sky/Sky.o

$(OBJDIR_RELEASE)/src/Sky/Earth.o: src/Sky/Earth.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sky/Earth.cpp -o $(OBJDIR_RELEASE)/src/Sky/Earth.o

$(OBJDIR_RELEASE)/src/Score/StatsBoard.o: src/Score/StatsBoard.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Score/StatsBoard.cpp -o $(OBJDIR_RELEASE)/src/Score/StatsBoard.o

$(OBJDIR_RELEASE)/src/Score/ScoreManager.o: src/Score/ScoreManager.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Score/ScoreManager.cpp -o $(OBJDIR_RELEASE)/src/Score/ScoreManager.o

$(OBJDIR_RELEASE)/src/Score/ScoreBoard.o: src/Score/ScoreBoard.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Score/ScoreBoard.cpp -o $(OBJDIR_RELEASE)/src/Score/ScoreBoard.o

$(OBJDIR_RELEASE)/src/Score/Score.o: src/Score/Score.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Score/Score.cpp -o $(OBJDIR_RELEASE)/src/Score/Score.o

$(OBJDIR_RELEASE)/src/Overworld/Overworld.o: src/Overworld/Overworld.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Overworld/Overworld.cpp -o $(OBJDIR_RELEASE)/src/Overworld/Overworld.o

$(OBJDIR_RELEASE)/src/Sound/SoundManager.o: src/Sound/SoundManager.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sound/SoundManager.cpp -o $(OBJDIR_RELEASE)/src/Sound/SoundManager.o

$(OBJDIR_RELEASE)/src/Menu/TitleScreen.o: src/Menu/TitleScreen.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Menu/TitleScreen.cpp -o $(OBJDIR_RELEASE)/src/Menu/TitleScreen.o

$(OBJDIR_RELEASE)/src/Menu/TitleMenu.o: src/Menu/TitleMenu.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Menu/TitleMenu.cpp -o $(OBJDIR_RELEASE)/src/Menu/TitleMenu.o

$(OBJDIR_RELEASE)/src/Menu/MenuHandler.o: src/Menu/MenuHandler.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Menu/MenuHandler.cpp -o $(OBJDIR_RELEASE)/src/Menu/MenuHandler.o

$(OBJDIR_RELEASE)/src/Menu/MenuComponent.o: src/Menu/MenuComponent.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Menu/MenuComponent.cpp -o $(OBJDIR_RELEASE)/src/Menu/MenuComponent.o

$(OBJDIR_RELEASE)/src/Menu/Menu.o: src/Menu/Menu.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Menu/Menu.cpp -o $(OBJDIR_RELEASE)/src/Menu/Menu.o

$(OBJDIR_RELEASE)/src/Map/Mapper.o: src/Map/Mapper.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Map/Mapper.cpp -o $(OBJDIR_RELEASE)/src/Map/Mapper.o

$(OBJDIR_RELEASE)/src/Level/Level.o: src/Level/Level.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Level/Level.cpp -o $(OBJDIR_RELEASE)/src/Level/Level.o

$(OBJDIR_RELEASE)/src/Sprite/Interactive.o: src/Sprite/Interactive.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/Interactive.cpp -o $(OBJDIR_RELEASE)/src/Sprite/Interactive.o

$(OBJDIR_RELEASE)/src/main.o: src/main.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/main.cpp -o $(OBJDIR_RELEASE)/src/main.o

$(OBJDIR_RELEASE)/src/Utils/Utils.o: src/Utils/Utils.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Utils/Utils.cpp -o $(OBJDIR_RELEASE)/src/Utils/Utils.o

$(OBJDIR_RELEASE)/src/Utils/Date.o: src/Utils/Date.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Utils/Date.cpp -o $(OBJDIR_RELEASE)/src/Utils/Date.o

$(OBJDIR_RELEASE)/src/TextureManager/TextureManager.o: src/TextureManager/TextureManager.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/TextureManager/TextureManager.cpp -o $(OBJDIR_RELEASE)/src/TextureManager/TextureManager.o

$(OBJDIR_RELEASE)/src/Sprite/TileSprite.o: src/Sprite/TileSprite.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/TileSprite.cpp -o $(OBJDIR_RELEASE)/src/Sprite/TileSprite.o

$(OBJDIR_RELEASE)/src/Sprite/EnvSprite.o: src/Sprite/EnvSprite.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/EnvSprite.cpp -o $(OBJDIR_RELEASE)/src/Sprite/EnvSprite.o

$(OBJDIR_RELEASE)/src/Sprite/EntitySprite.o: src/Sprite/EntitySprite.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/EntitySprite.cpp -o $(OBJDIR_RELEASE)/src/Sprite/EntitySprite.o

$(OBJDIR_RELEASE)/src/Sprite/ElodieSprite.o: src/Sprite/ElodieSprite.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/ElodieSprite.cpp -o $(OBJDIR_RELEASE)/src/Sprite/ElodieSprite.o

$(OBJDIR_RELEASE)/src/Sprite/CharacterSprite.o: src/Sprite/CharacterSprite.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/CharacterSprite.cpp -o $(OBJDIR_RELEASE)/src/Sprite/CharacterSprite.o

$(OBJDIR_RELEASE)/src/Sprite/Animation.o: src/Sprite/Animation.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/Animation.cpp -o $(OBJDIR_RELEASE)/src/Sprite/Animation.o

$(OBJDIR_RELEASE)/src/Sprite/AnimatedSprite.o: src/Sprite/AnimatedSprite.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Sprite/AnimatedSprite.cpp -o $(OBJDIR_RELEASE)/src/Sprite/AnimatedSprite.o

$(OBJDIR_RELEASE)/src/Entity/Portal.o: src/Entity/Portal.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Portal.cpp -o $(OBJDIR_RELEASE)/src/Entity/Portal.o

$(OBJDIR_RELEASE)/src/Entity/Poro.o: src/Entity/Poro.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Poro.cpp -o $(OBJDIR_RELEASE)/src/Entity/Poro.o

$(OBJDIR_RELEASE)/src/Entity/Hitbox.o: src/Entity/Hitbox.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Hitbox.cpp -o $(OBJDIR_RELEASE)/src/Entity/Hitbox.o

$(OBJDIR_RELEASE)/src/Entity/Entity.o: src/Entity/Entity.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Entity.cpp -o $(OBJDIR_RELEASE)/src/Entity/Entity.o

$(OBJDIR_RELEASE)/src/Entity/Enemy/Spikes.o: src/Entity/Enemy/Spikes.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Enemy/Spikes.cpp -o $(OBJDIR_RELEASE)/src/Entity/Enemy/Spikes.o

$(OBJDIR_RELEASE)/src/Entity/Enemy/Sheep.o: src/Entity/Enemy/Sheep.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Enemy/Sheep.cpp -o $(OBJDIR_RELEASE)/src/Entity/Enemy/Sheep.o

$(OBJDIR_RELEASE)/src/Entity/Enemy/MagmaCube.o: src/Entity/Enemy/MagmaCube.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Enemy/MagmaCube.cpp -o $(OBJDIR_RELEASE)/src/Entity/Enemy/MagmaCube.o

$(OBJDIR_RELEASE)/src/EventHandler/EventHandler.o: src/EventHandler/EventHandler.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/EventHandler/EventHandler.cpp -o $(OBJDIR_RELEASE)/src/EventHandler/EventHandler.o

$(OBJDIR_RELEASE)/src/Entity/Enemy/Ghost.o: src/Entity/Enemy/Ghost.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Enemy/Ghost.cpp -o $(OBJDIR_RELEASE)/src/Entity/Enemy/Ghost.o

$(OBJDIR_RELEASE)/src/Entity/Enemy/Bristle.o: src/Entity/Enemy/Bristle.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Enemy/Bristle.cpp -o $(OBJDIR_RELEASE)/src/Entity/Enemy/Bristle.o

$(OBJDIR_RELEASE)/src/Entity/Elodie.o: src/Entity/Elodie.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Elodie.cpp -o $(OBJDIR_RELEASE)/src/Entity/Elodie.o

$(OBJDIR_RELEASE)/src/Entity/Bonus.o: src/Entity/Bonus.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Entity/Bonus.cpp -o $(OBJDIR_RELEASE)/src/Entity/Bonus.o

$(OBJDIR_RELEASE)/src/EntityManager/EntityManager.o: src/EntityManager/EntityManager.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/EntityManager/EntityManager.cpp -o $(OBJDIR_RELEASE)/src/EntityManager/EntityManager.o

$(OBJDIR_RELEASE)/src/Displayable/Displayable.o: src/Displayable/Displayable.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Displayable/Displayable.cpp -o $(OBJDIR_RELEASE)/src/Displayable/Displayable.o

$(OBJDIR_RELEASE)/src/Console/Console.o: src/Console/Console.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Console/Console.cpp -o $(OBJDIR_RELEASE)/src/Console/Console.o

$(OBJDIR_RELEASE)/src/Level/Hud.o: src/Level/Hud.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Level/Hud.cpp -o $(OBJDIR_RELEASE)/src/Level/Hud.o

$(OBJDIR_RELEASE)/src/Level/EndingScreen.o: src/Level/EndingScreen.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Level/EndingScreen.cpp -o $(OBJDIR_RELEASE)/src/Level/EndingScreen.o

$(OBJDIR_RELEASE)/src/Level/Death.o: src/Level/Death.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Level/Death.cpp -o $(OBJDIR_RELEASE)/src/Level/Death.o

$(OBJDIR_RELEASE)/src/Json/JsonStringifier.o: src/Json/JsonStringifier.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Json/JsonStringifier.cpp -o $(OBJDIR_RELEASE)/src/Json/JsonStringifier.o

$(OBJDIR_RELEASE)/src/Json/JsonAccessor.o: src/Json/JsonAccessor.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Json/JsonAccessor.cpp -o $(OBJDIR_RELEASE)/src/Json/JsonAccessor.o

$(OBJDIR_RELEASE)/src/Item/Item.o: src/Item/Item.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Item/Item.cpp -o $(OBJDIR_RELEASE)/src/Item/Item.o
$(OBJDIR_RELEASE)/src/Game/GameView.o: src/Game/GameView.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Game/GameView.cpp -o $(OBJDIR_RELEASE)/src/Game/GameView.o

$(OBJDIR_RELEASE)/src/Game/Game.o: src/Game/Game.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Game/Game.cpp -o $(OBJDIR_RELEASE)/src/Game/Game.o

$(OBJDIR_RELEASE)/src/Fnu/Girly.o: src/Fnu/Girly.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Fnu/Girly.cpp -o $(OBJDIR_RELEASE)/src/Fnu/Girly.o

$(OBJDIR_RELEASE)/src/FileHandler/SaveHandler.o: src/FileHandler/SaveHandler.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/FileHandler/SaveHandler.cpp -o $(OBJDIR_RELEASE)/src/FileHandler/SaveHandler.o

$(OBJDIR_RELEASE)/src/FileHandler/FileHandler.o: src/FileHandler/FileHandler.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/FileHandler/FileHandler.cpp -o $(OBJDIR_RELEASE)/src/FileHandler/FileHandler.o

$(OBJDIR_RELEASE)/src/FileHandler/ConfigManager.o: src/FileHandler/ConfigManager.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/FileHandler/ConfigManager.cpp -o $(OBJDIR_RELEASE)/src/FileHandler/ConfigManager.o

clean_release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf $(OBJDIR_RELEASE)/src/Sky
	rm -rf $(OBJDIR_RELEASE)/src/Score
	rm -rf $(OBJDIR_RELEASE)/src/Overworld
	rm -rf $(OBJDIR_RELEASE)/src/Sound
	rm -rf $(OBJDIR_RELEASE)/src/Menu
	rm -rf $(OBJDIR_RELEASE)/src/Map
	rm -rf $(OBJDIR_RELEASE)/src/Level
	rm -rf $(OBJDIR_RELEASE)/src/Sprite
	rm -rf $(OBJDIR_RELEASE)/src
	rm -rf $(OBJDIR_RELEASE)/src/Utils
	rm -rf $(OBJDIR_RELEASE)/src/TextureManager
	rm -rf $(OBJDIR_RELEASE)/src/Entity
	rm -rf $(OBJDIR_RELEASE)/src/Entity/Enemy
	rm -rf $(OBJDIR_RELEASE)/src/EventHandler
	rm -rf $(OBJDIR_RELEASE)/src/EntityManager
	rm -rf $(OBJDIR_RELEASE)/src/Displayable
	rm -rf $(OBJDIR_RELEASE)/src/Console
	rm -rf $(OBJDIR_RELEASE)/src/Json
	rm -rf $(OBJDIR_RELEASE)/src/Item
	rm -rf $(OBJDIR_RELEASE)
	rm -rf $(OBJDIR_RELEASE)/src/Game
	rm -rf $(OBJDIR_RELEASE)/src/Fnu
	rm -rf $(OBJDIR_RELEASE)/src/FileHandler

.PHONY: before_debug after_debug clean_debug before_release after_release clean_release
