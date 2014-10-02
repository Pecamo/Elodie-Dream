#include "ScoreManager.h"

// Initialisation of the singleton to NULL
ScoreManager* ScoreManager::managerInstance = NULL;

ScoreManager::ScoreManager() {
    for (size_t i = 0; i < NUMLEVELS; ++i) {
        Score score;
        gameScore.push_back(score);
    }
}

ScoreManager::~ScoreManager() {
}

// Gets the instance of the entityManger
ScoreManager* ScoreManager::getInstance() {
    if(!managerInstance) managerInstance = new ScoreManager();
    return managerInstance;
}

void ScoreManager::kill() {
    if(managerInstance) {
        delete managerInstance;
        managerInstance = NULL;
    }
}

Score ScoreManager::getScore(int level) {
    return gameScore[level];
}

std::vector<Score> ScoreManager::getGameScore() {
    return gameScore;
}

Score ScoreManager::getLastSavedScore() {
    return lastSavedScore;
}

Score ScoreManager::getCurrentScore() {
    return currentScore;
}

void ScoreManager::setLevel(int level) {
    currentScore.setLevelId(level);
}

void ScoreManager::takeBonus() {
    currentScore.setBoni(currentScore.getBoni() + 1);
}

void ScoreManager::addKillPoints(int points) {
    currentScore.setTotalPoints(currentScore.getTotalPoints() + points);
}

void ScoreManager::addDamage(int damage) {
    currentScore.setDamagesTaken(currentScore.getDamagesTaken() + damage);
}

void ScoreManager::addEnemyKilled() {
    currentScore.setEnemiesKilled(currentScore.getEnemiesKilled() + 1);
}

void ScoreManager::addKilledSheep() {
    currentScore.setSheeps(currentScore.getSheeps() + 1);
}

void ScoreManager::addKilledMagmacube() {
    currentScore.setMagmaCubes(currentScore.getMagmaCubes() + 1);
}

void ScoreManager::addKilledBristle() {
    currentScore.setBristles(currentScore.getBristles() + 1);
}

void ScoreManager::computeTotalPoints() {
    int points = currentScore.getKillPoints() - currentScore.getDamagesTaken() + currentScore.getBoni()*BONUS_POINTS;

    if(currentScore.getDamagesTaken() == 0) {
        points += BONUS_NODAMAGES;
    }
    currentScore.setTotalPoints(points);
}

void ScoreManager::saveCurrentScore() {
    int level = currentScore.getLevelId();
    lastSavedScore = currentScore;

    // if the player has done a better score
    if (gameScore[level].getTotalPoints() < currentScore.getTotalPoints()) {
        gameScore[level].setKillPoints(currentScore.getKillPoints());
        gameScore[level].setTotalPoints(currentScore.getTotalPoints());
        gameScore[level].setBoni(currentScore.getBoni());
        gameScore[level].setDamagesTaken(currentScore.getDamagesTaken());
        gameScore[level].setEnemiesKilled(currentScore.getEnemiesKilled());
        gameScore[level].setSheeps(currentScore.getSheeps());
        gameScore[level].setMagmaCubes(currentScore.getMagmaCubes());
        gameScore[level].setBristles(currentScore.getBristles());
    }
    resetCurrentScore();
}

// TODO
void ScoreManager::setLevelScore(int level, int totalPoints) {
    gameScore[level].setTotalPoints(totalPoints);
}

void ScoreManager::resetCurrentScore() {
    currentScore.reset();
}

void ScoreManager::resetAllScores() {
    for (size_t i = 0; i < NUMLEVELS; ++i) {
        gameScore[i].reset();
    }
}
