"""
Filename: Hw08-VideoGame.py

This file contains a class for creating a video game of a sprite
moving around the screen. The user moves the sprite using the arrow
keys. 

Name: Gina McKeown

Date: 11/2/19
"""

import pyglet
from pyglet.window import key
import math

class GameSprite(pyglet.sprite.Sprite):
    def __init__(self, filename, x, y):
        try:  # try to open the image file
            image = pyglet.image.load(filename)
        except IOError:  # there was a problem opening file
            print('Error: File not found: ' + filename)
        image.anchor_x = image.width/2  # center the pivot
        image.anchor_y = image.height/2  # center the pivot

        super(GameSprite, self).__init__(image, x, y)  # call the base class constructor

        self.dx = 0  # change in x of sprite
        self.dy = 0  # change in y of sprite

    def get_rect(self):
        """ Returns the x,y coordinates of the sprite """
        x1 = self.x
        x2 = self.x + self.width
        y1 = self.y
        y2 = self.y - self.height
        return x1, y1, x2, y2


# GameWindow class
class GameWindow(pyglet.window.Window):
   
    def __init__(self):
        super(GameWindow, self).__init__(800, 600)
        
        # Schedule the update of this window
        pyglet.clock.schedule_interval(self.update, 1/60.0)
 
        # INSERT HERE - add class variables and initializations. For example... 
        self.go_forward = False  # user is turning right
                                                                                                                                                          
        pyglet.gl.glClearColor(0, 0, 1, 0)  # set the background color
        
        # REMOVE - the next 4 lines should be handled in your new GameSprite class
        self.car_image = pyglet.image.load('Hw08img/oldLady.png')
        # self.obstacle = pyglet.sprite.Sprite(image, 300, 390)
        
        car = GameSprite(self.car_image, 50, 50)
        car.rotate(90)
        # Run the application
        pyglet.app.run()

    #----------------------------
    # Window() events:
    # Overridden Window() methods:
      
    def update(self, dt):
        """ Do all updating here. """
        
        self.move()  # move sprites


    def on_draw(self):
        """ Do all drawing here. """
        
        self.clear()
        
        # INSERT - draw the car sprite
        self.car.draw()

        # MODIFY - change the next line to draw all obstacles in obstacles list
        self.obstacle.draw()
  
                      
    def on_key_press(self, symbol, modifiers):
        """ Check if user has pressed an arrow key. """   
     
        if symbol == key.UP:
            self.go_forward = True
     
        # INSERT HERE - additional code to handle key presses
                            
                    
    def on_key_release(self, symbol, modifiers):
        """ Check if user has released an arrow key. """  
        
        # INSERT HERE - code to handle key releases
       

    def check_for_collisions(self):
        """ Check if car has collided with obstacles. """
        
        # INSERT HERE - check for collisions with edge of window
       
        # INSERT HERE - check for collisions with obstacles    


    def move(self):
        """ Move all the sprites in the window. """
         
        # INSERT HERE - code to change the image rotation
       
        # INSERT HERE - code to assure angle does not go above 360 or below 0.
    
        # INSERT HERE - code to handle car going forward and backward.       
       
        # INSERT HERE - code to set new position for car moving forward or backward.

        # INSERT HERE - code to check for a collision and handle a crash                       
                                                                                                                  

if __name__ == '__main__':  # start here
    video_game = GameWindow()
