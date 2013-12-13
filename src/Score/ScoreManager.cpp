#include "ScoreManager.h"

// Initialisation of the singleton to NULL
ScoreManager* ScoreManager::managerInstance = NULL;

ScoreManager::ScoreManager() {

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

void ScoreManager::loadScore(int level, int score, int bonus) {
    gameScore[level].bonus = bonus;
    gameScore[level].score = score;
}

void ScoreManager::loadScore(std::vector< int > scores, std::vector< int > bonuses) {
    for (unsigned int i = 0; i < scores.size(); ++i) {
        gameScore[i].score = scores[i];
    }
    for (unsigned int i = 0; i < bonuses.size(); ++i) {
        gameScore[i].bonus = bonuses[i];
    }
}

Score ScoreManager::getScore(int level) {
    return gameScore[level];
}

Score ScoreManager::getCurrentScore() {
    return currentScore;
}

void ScoreManager::takeBonus() {
    currentScore.bonus += 1;
}

void ScoreManager::addScore(int score) {
    currentScore.score += score;
}

void ScoreManager::saveScore(int level) {
    if (gameScore[level].score < currentScore.score) {
        gameScore[level].score = currentScore.score;
    }
    if (gameScore[level].bonus < currentScore.bonus) {
        gameScore[level].bonus = currentScore.bonus;
    }
    resetCurrentScore();
}

void ScoreManager::resetCurrentScore() {
    currentScore.score = 0;
    currentScore.bonus = 0;
}
