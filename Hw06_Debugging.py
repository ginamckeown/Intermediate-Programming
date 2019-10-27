"""
    Project Name: Hw06_Debugging.py
    
    Description: Create a basic randomized game. Avatar and Enemy attack and
    feed, winner steals loot. UPDATE: With added debugging features and converted to python 3.

    Name: Gina McKeown

    Date: 10/8/19

"""
# -------------------------------------------------------------------------------

import random
import time
import logging

logging.basicConfig(level=logging.DEBUG, filename='Hw06_debug.log')


class Sprite(object):
    def __init__(self, name, loot, strength):
        """
        constructor of the sprite class
        :param name: name of Sprite being created
        """
        self.name = name
        self.x = 0
        self.y = 0
        self.health = 10
        self.strength = strength
        self.loot = loot
        self.is_alive = True
        self.MAX_HEALTH = 15
        self.magic_key = False
        logging.debug("{0} created with health of {1} and strength of {2}"
                      .format(self.name, self.health, self.strength))
        """ Test Results Part A:
        When increasing MAX_HEATH to 100, rounds tended to go on.
        When decreasing MAX_HEATH to 0.05, rounds end very quickly.
        This is expected because the Sprites will be easier or harder 
        to defeat depending on how high their health can get. It will 
        take more attacks to defeat a Sprite with more health and less
        attacks to defeat a Sprite with less health. 
        
        Test Results Part B:
        Test: change strength of Enemy to 20 (higher than Avatar)
        Prediction: the Enemy should win most/all of the time because the player 
        with more strength has a harder attack.
        Results: The Enemy won during all trials. If the roles were switched, the 
        same could be said about Avatar.
        
        Test: set health of Avatar to 5
        Prediction: the Avatar will die more often than the Enemy because it can 
        receive less attacks
        Results: The Avatar died during most trials. 
        
        Test: set MAX_HEALTH for Enemy to 5
        Prediction: Enemy will be able to have less health, so it will be defeated
        more often than the Avatar
        Results: The enemy died in almost all trials
        """

    def __repr__(self):
        """
        prints out the important values of given Sprite, made for debugging
        :return: prints name, position, health, strength and loot of given Sprite
        """
        return "\nSprite info: " + self.name + "\nx = {0}\ny = {1}\nhealth = {2}\nstrength = {3}\nloot = {4}\n"\
            .format(self.x, self.y, self.health, self.strength, self.loot)

    def set_dead(self):
        """
        sets the Sprite to dead
        """
        assert self.health < 0, "Health is not less than 0, Sprite should not be dead"
        self.is_alive = False

    def attack(self, victim):
        """
        reduces the health of the victim being attacked,
        if victim dies, transfers loot of attacked victim and
        sets victim to dead
        :param victim: the sprite being attacked
        """
        assert victim.is_alive, "Cannot attack, victim is already dead"
        # if attacker is stronger than victim, the victim's health is reduced by (0, 15)
        if victim.strength < self.strength:
            victim.health -= random.randint(0, 15)
            logging.debug("{0} is stronger".format(self.name))
        else:  # otherwise, reduce by only (0, 5)
            victim.health -= random.randint(0, 5)
            logging.debug("{0} is stronger".format(victim.name))
        print(self.name, "attacks", victim.name)
        victim.show_health()

        # if the victim dies, transfer their loot to attacker and set them to dead
        if victim.health < 0:
            self.loot += victim.loot
            victim.loot = 0

    def feed(self):
        """
        increases the health of the feeding Sprite
        """
        self.health += random.randrange(1, 3)  # food increases heath by (1, 3)
        if self.health > self.MAX_HEALTH:  # if health exceeds the max, set it to the max
            self.health = self.MAX_HEALTH
        print(self.name, "ate food")
        self.show_health()

    def show_health(self):
        """
        prints the health level of a given Sprite
        """
        print(self.name + "'s health is ", str(self.health))

    def show_loot(self):
        """
        prints the total loot of a given Sprite
        """
        print(self.name, "has a total loot of ", str(self.loot))

    def show_strength(self):
        """
        prints the strength of the given Sprite
        """
        print(self.name, "has a strength of", str(self.strength))

    def move(self):
        """
        moves the Sprite's position randomly
        """
        assert self.is_alive, "Sprite is dead, and should not be able to move"
        if self.health > 3:
            self.y += random.randint(-1, 1)  # change by -1, 0, 1
            self.x += random.randint(-1, 1)  # change by -1, 0, 1
        print(self.name, "moves to position", str(self.x), ",", str(self.y))


class Enemy(Sprite):
    def __init__(self, name, loot, strength):
        """
        takes the functions from its superclass,
        creates features of the Enemy
        :param name: name of Enemy
        """
        Sprite.__init__(self, name=name, loot=loot, strength=strength)
        self.magic_key = random.choice([True, False])  # random boolean value
        # debugging print statement:
        # print self.magic_key

    def set_dead(self):
        """
        sets the Enemy to dead and prints its last words
        """
        self.is_alive = False
        print(self.name, "has been slayed: My evil comrades will avenge my death!")


class Avatar(Sprite):
    def __init__(self, name, loot, strength):
        """
        takes the functions from its superclass,
        creates features of the Avatar
        :param name: name of Avatar
        """
        Sprite.__init__(self, name=name, loot=loot, strength=strength)
        self.magic_key = False

    def set_dead(self):
        """
        sets the Avatar to dead and prints out its last words
        """
        self.is_alive = False
        print(self.name, "dies: How unfortunate, my time has come!")


if __name__ == "__main__":
    logging.debug("starting to run program...")
    hero = Avatar("Gina", 0, random.randint(1, 10))
    villain = Enemy("Bad Bob", random.randint(0, 20), random.randint(1, 15))

    # Print out Sprite Object, calls __repr__ function
    print(hero)
    print(villain)

    # Gina's copy of Mr. Golanka's fun starting dots
    for i in range(25):
        print(".", end=" ")
        time.sleep(0.1)

    # print out the initial values
    print("\nSet Up Values:")
    hero.show_health()
    hero.show_strength()
    villain.show_health()
    villain.show_strength()
    time.sleep(1)  # pause

    num_round = 0
    # Every round each side attacks and feeds, round is over when someone dies
    while True:
        num_round += 1  # For every time the loop runs, increase the number of rounds
        print("\nRound", str(num_round))  # print out the number of rounds

        hero.attack(villain)
        if not villain.is_alive:  # break out of the loop when villain dies
            break
        else:
            villain.feed()

        villain.attack(hero)
        if not hero.is_alive:  # break out of the loop when hero dies
            break
        else:
            hero.feed()
            hero.move()
        time.sleep(1)  # pause between rounds

    # show the loot of the winner
    if hero.is_alive:
        hero.show_loot()
        winner = hero.name + " has won"
        if villain.magic_key:  # if the enemy has a key, then the hero receives it
            hero.magic_key = True
            print(hero.name, "received the magic key")
    else:
        winner = villain.name + " has won"
        villain.show_loot()

    print(winner)
    logging.debug(winner)
