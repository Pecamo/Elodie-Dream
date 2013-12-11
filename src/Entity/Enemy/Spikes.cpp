#include "Spikes.h"

Spikes::Spikes() {
    init(0, 0);
}

Spikes::Spikes(sf::Vector2f position) {
    init(position.x, position.y);
}

Spikes::Spikes(float x, float y) {
    init(x, y);
}

void Spikes::init(float x, float y) {
    ANIMATIONS = {
        {SpikesState::WAITING, "waiting"},
        {SpikesState::ACTIVATED, "activated"},
        {SpikesState::UNACTIVATED, "unactivated"}
    };

    damage = SPIKES_DAMAGE;

    EntityManager* ToyBox = EntityManager::getInstance();
    EntityInfo* info = ToyBox->getEnemyInfo(EntityType::MISC, EntityName::SPIKES);

    x -= info->width / 2;
    state = SpikesState::WAITING;
    speed.x = 0;

    sprite = new SpikesSprite(info);
    setEntitySprite(sprite);

    sprite->setPosition(sf::Vector2f(x,y));
    setHitboxes(info, sprite->getPosition());
}

Spikes::~Spikes() {
    delete sprite;
    sprite = NULL;
    setEntitySprite(NULL);
}

void Spikes::update(sf::Time deltaTime) {
    sprite->update(deltaTime);
}

SpikesSprite* Spikes::getSprite() {
    return sprite;
}

void Spikes::doAttack(std::map< std::string, Entity* >& entities) {
    sf::FloatRect entity = getCurrentHitbox(ANIMATIONS[state], sprite->getCurrentFrame()).getArea();
    Elodie* elodie = (Elodie*) entities["elodie"];
    if (state == SpikesState::ACTIVATED && sprite->getCurrentFrame() == 3 && entity.intersects(elodie->returnCurrentHitbox().getArea())) {
        elodie->takeDamage(damage);
    }
    if (!activated && entity.intersects(elodie->returnCurrentHitbox().getArea())) {
        state = SpikesState::ACTIVATED;
        sprite->changeStance(ANIMATIONS[state], sf::seconds(0.02f));
        activated = true;

        SoundManager* sounds = SoundManager::getInstance();
        sounds->play(SoundType::SPIKES);
    }
}

Hitbox Spikes::returnCurrentHitbox() {
    return getCurrentHitbox(ANIMATIONS[state], sprite->getCurrentFrame());
}

void Spikes::doStuff(EventHandler* const& event, std::vector< std::vector<TileSprite*> > const& tiles, std::map< std::string, Entity* >& entities, sf::Time animate) {
    doAttack(entities);

    if (state == SpikesState::ACTIVATED && sprite->getCurrentFrame() == 3) {
        state = SpikesState::UNACTIVATED;
        sprite->changeStance(ANIMATIONS[state], sf::seconds(0.1f));
    }

    sprite->update(animate);
}

void Spikes::pause() {
    sprite->pause();
}

void Spikes::play() {
    sprite->play();
}