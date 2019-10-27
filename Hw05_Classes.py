"""
    Project Name: Hw05_Classes.py
    
    Description: Create a basic randomized game. Avatar and Enemy attack and
    feed, winner steals loot.

    Name: Gina McKeown

    Date: 9/17/19

"""
# -------------------------------------------------------------------------------

import random
import time


class Sprite(object):
    def __init__(self, name):
        """
        constructor of the sprite class
        :param name: name of Sprite being created
        """
        self.name = name
        self.x = 0
        self.y = 0
        self.health = 10
        self.strength = 15
        self.loot = random.randint(3, 6)
        self.is_alive = True
        self.MAX_HEALTH = 15
        self.magic_key = False

    def set_dead(self):
        """
        sets the Sprite to dead
        """
        self.is_alive = False

    def attack(self, victim):
        """
        reduces the health of the victim being attacked,
        if victim dies, transfers loot of attacked victim and
        sets victim to dead
        :param victim: the sprite being attacked
        """
        # if attacker is stronger than victim, the victim's health is reduced by (0, 15)
        if victim.strength < self.strength:
            victim.health -= random.randint(0, 15)
        else:  # otherwise, reduce by only (0, 5)
            victim.health -= random.randint(0, 5)

        print self.name + " attacks " + victim.name
        victim.show_health()

        # if the victim dies, transfer their loot to attacker and set them to dead
        if victim.health < 0:
            self.loot += victim.loot
            victim.loot = 0
            victim.set_dead()
            # debugging print statement:
            # print self.loot

    def feed(self):
        """
        increases the health of the feeding Sprite
        """
        self.health += random.randrange(1, 3)  # food increases heath by (1, 3)
        if self.health > self.MAX_HEALTH:  # if health exceeds the max, set it to the max
            self.health = MAX_HEALTH
        print self.name + " ate food"
        self.show_health()

    def show_health(self):
        """
        prints the health level of a given Sprite
        """
        print self.name + "'s health is " + str(self.health)

    def show_loot(self):
        """
        prints the total loot of a given Sprite
        """
        print self.name + " has a total loot of " + str(self.loot)

    def show_strength(self):
        """
        prints the strength of the given Sprite
        """
        print self.name + " has a strength of " + str(self.strength)

    def move(self):
        """
        moves the Sprite's position randomly
        """
        if self.health > 3:
            self.y += random.randint(-1, 1)  # change by -1, 0, 1
            self.x += random.randint(-1, 1)  # change by -1, 0, 1
        print self.name + " moves to position " + str(self.x) + ", " + str(self.y)


class Enemy(Sprite):
    def __init__(self, name):
        """
        takes the functions from its superclass,
        creates features of the Enemy
        :param name: name of Enemy
        """
        Sprite.__init__(self, name=name)
        self.loot = random.randint(0, 20)
        self.strength = random.randint(1, 15)
        self.name = name
        self.magic_key = random.choice([True, False])  # random boolean value
        # debugging print statement:
        # print self.magic_key

    def set_dead(self):
        """
        sets the Enemy to dead and prints its last words
        """
        self.is_alive = False
        print self.name + " has been slayed: My evil comrades will avenge my death!"


class Avatar(Sprite):
    def __init__(self, name):
        """
        takes the functions from its superclass,
        creates features of the Avatar
        :param name: name of Avatar
        """
        Sprite.__init__(self, name=name)
        self.strength = random.randint(1, 10)
        self.loot = 0
        self.name = name
        self.magic_key = False

    def set_dead(self):
        """
        sets the Avatar to dead and prints out its last words
        """
        self.is_alive = False
        print self.name + " dies: How unfortunate, my time has come!"


if __name__ == '__main__':
    hero = Avatar("Gina")
    villain = Enemy("Bad Bob")

    # Gina's copy of Mr. Golanka's fun starting dots
    for i in range(25):
        print ("."),
        time.sleep(0.1)

    # print out the initial values
    print "\nSet Up Values:"
    hero.show_health()
    hero.show_strength()
    villain.show_health()
    villain.show_strength()
    time.sleep(1)  # pause

    num_round = 0
    # Every round each side attacks and feeds, round is over when someone dies
    while True:
        num_round += 1  # For every time the loop runs, increase the number of rounds
        print "\n" + "Round " + str(num_round)  # print out the number of rounds

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
        time.sleep(2)  # pause between rounds

    # show the loot of the winner
    if hero.is_alive:
        hero.show_loot()
        if villain.magic_key:  # if the enemy has a key, then the hero receives it
            hero.magic_key = True
            print hero.name + " received the magic key"
    else:
        villain.show_loot()