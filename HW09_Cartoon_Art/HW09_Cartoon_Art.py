"""
Project:      hw09-cartoon_art.py

Description: 

Name: Gina McKeown

Date: 12/12/19

Notes:        Install the following libraries. In an SSH Terminal enter 
              the following:

              sudo apt-get install libjpeg8-dev
              sudo apt-get install zlib1g-dev
              sudo pip install Pillow

              You may need to update pip in order to uninstall Pillow. In terminal do the following:
              sudo pip install --upgrade pip
"""
#-------------------------------------------------------------------------------


from PIL.Image import open, new
from PIL.ImageColor import getrgb
from PIL.ImageOps import grayscale


class CartoonArt:
    def __init__(self, image):
        """
        Changes images into cartoon style images, with different colors and patterns
        :param image: the image you want to change
        """
        self.spacing = 4  # spacing for dots and lines
        self.color_palette = ["2D9C3B", "3886A8", "C45B41", "E3AB4B", "5A4291", "000000"]  # green, blue, red, orange, purple, black
        self.image = open(image)
        self.w, self.h = self.image.size

    def hex_to_rgb(self, hex):
        """ Convert a given color from a hexadecimal value to a rgb tuple. For
            example a hex value of "C9A814" would get converted to (201, 168, 20).
            :param hex: the hexadecimal code (string) representing a color value.
            :return: Returns the tuple value as a string.
        """
        return getrgb('#' + hex)  # convert to hex value

    def rgb_to_hex(self, rgb):
        """ Convert a given color from a rgb tuple to a hexadecimal value. For
            example a rgb value of (201, 168, 20) would get converted to C9A814.
            :param rgb: a tuple representing an rgb value.
            :return: It returns the hexadecimal value as a string.
        """
        hex_value = '%02x%02x%02x' % rgb
        return hex_value.upper()

    def make_cartoon_pic(self, pixels, palette):
        """
        converts original image pixel color to new palette colors
        :param pixels: a list of pixels' colors in greyscale
        :param palette: the color palette for new image
        :return: returns a list of the new pixels' colors
        """
        new_pixels = []

        # debugging print statement:
        # print("Creating new list of pixels...)

        # for every pixel, depending on its color, change it to a new palette color
        for p in pixels:
            # darkest colors to lightest colors
            if p < 5:
                new_pixels.append(self.hex_to_rgb(palette[5]))
            elif p < 60:
                new_pixels.append(self.hex_to_rgb(palette[1]))
            elif p < 100:
                new_pixels.append(self.hex_to_rgb(palette[4]))
            elif p < 150:
                new_pixels.append(self.hex_to_rgb(palette[0]))
            elif p < 230:
                new_pixels.append(self.hex_to_rgb(palette[2]))
            else:
                new_pixels.append(self.hex_to_rgb(palette[3]))
        return new_pixels

    def process_image(self):
        """
        changes an image to greyscale and calls functions to return an image with the new palette colors. Saves the
        new image and adds patterns to make it into a cartoon.
        """
        # debugging print statement:
        # print("Processing image...)
        gray_image = grayscale(self.image)  # change image to greyscale
        gray_pixels = gray_image.getdata()  # get a list with the new greyscale colors for every pixel
        gray_image.save("./img/grey_image_debug01.bmp")  # save new greyscale image

        # CHECKING PROGRESS
        # for i in range(10):
        #     print(gray_pixels[i]),

        # image = self.make_pattern(self.image, "FFFF00")
        # image.save("./img/pattern_test_debug02.bmp")

        # image = self.make_lines(self.image, "99FFFF")
        # image.save("./img/line_test_debug02.bmp")

        new_img_pixels = self.make_cartoon_pic(gray_pixels, self.color_palette)  # get a new list for pixel's colors
        # debugging print statement:
        # print("img total pixels:", self.w * self.h)
        # print("new_img total pixels:", len(new_img_pixels))
        assert(self.w * self.h == len(new_img_pixels))

        new_pixels = self.make_cartoon_pic(gray_pixels, self.color_palette)  # list pixels' new color palette
        new_image = new("RGB", self.image.size)  # create an empty image
        new_image.putdata(new_pixels)  # put new list of colors onto the new image
        new_image = self.make_pattern(new_image, self.color_palette[4], self.color_palette[3])  # add patterns to new image
        new_image = self.make_lines(new_image, self.color_palette[2], self.color_palette[0])  # add lines to new image
        new_image = self.diagonal_lines(new_image, self.color_palette[0], self.color_palette[2])  # add diagonal lines
        new_image.save("./img/new_image.bmp")  # save new image

    def make_lines(self, image, color, line_color):
        """
        adds a vertical lines to wherever the given color in found within the given image
        :param image: the image to be edited
        :param color: holds the color value for the color that will have an added pattern
        :param line_color: color for vertical lines
        :return: returns the image with the new pattern
        """
        # for every pixel with the given color, draw a vertical line, skip based on spacing
        for x in range(0, self.w, self.spacing):
            for y in range(0, self.h):
                p = image.getpixel((x, y))  # current pixel
                if p == self.hex_to_rgb(color):  # checks for matching colors
                    # debugging print statement:
                    # print("Making a line at {0}".format(p))
                    image.putpixel((x, y), self.hex_to_rgb(line_color))  # draw a line
        return image

    def make_pattern(self, image, color, pattern_color):
        """
        adds a pattern to wherever the given color in found within the given image
        :param image: the image to be edited
        :param color: holds the color value for the color that will have an added pattern
        :param pattern_color: color for pattern
        :return: returns the image with the new pattern
        """
        # go through the loop so that dots are made with window-like spacing
        i = 0
        while i <= int(self.spacing/2):
            for x in range(i, self.w, self.spacing):
                for y in range(i, self.h, self.spacing):
                    p = image.getpixel((x, y))
                    if p == self.hex_to_rgb(color):  # checks for matching colors
                        # debugging print statement:
                        # print("Making a dot at {0}".format(p))
                        image.putpixel((x, y), self.hex_to_rgb(pattern_color))  # create a dot
            i += int(self.spacing/2)  # go again with different starting point
        return image

    def diagonal_lines(self, image, color, diagonal_line_color):
        """
        adds diagonal lines wherever the given color in found within the given image
        :param image: the image to be edited
        :param color: holds the color value for the color that will have added diagonal lines
        :param diagonal_line_color:  color for diagonal lines
        :return: returns the image with the new diagonal lines
        """
        # go through all coordinates for matching colors, draw a dot and go to the next line starting x + i
        for i in range(0, self.w):
            for x in range(i, self.w, self.spacing):
                for y in range(i, self.h, self.spacing):
                    p = image.getpixel((x, y))
                    if p == self.hex_to_rgb(color):  # checks for matching colors
                        image.putpixel((x, y), self.hex_to_rgb(diagonal_line_color))  # create a dot
        return image


if __name__ == '__main__':  # run the program only if this is the code file we're working on
    flower_cartoon = CartoonArt("./img/flower.bmp")  # create an instance of CartoonArt
    flower_cartoon.process_image()  # draw new image
    # clown_cartoon = CartoonArt("./img/clown.bmp")  # create an instance of CartoonArt
    # clown_cartoon.process_image()  # draw new image
