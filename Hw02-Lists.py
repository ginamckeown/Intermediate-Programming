""" Project Name: Hw02-Lists.py
    
    Description: Answers to homework assignment.

    Name: Gina McKeown

    Date: 9/10/19
"""

print "\nQuestion 1\n"
my_list = ['M', 'o','n','t','y']

print my_list[1:3]
print my_list[:1:-1]
print 2*my_list

print "\nQuestion 2\n"
my_string = 'Monty'

print my_string[::2]
print 3*my_string[2:0:-1]

print "\nQuestion 3\n"
first_name = "Gina"
last_name = "McKeown"
id = "4156"
user_id = first_name[0].lower() + last_name[:4].lower() + id

print user_id

print "\nQuestion 4\n"
num_list = [1,2,3,4,5,6,7,8,9,10]

print num_list[1::2]

print "\nQuestion 5\n"
menu = [['ham', 3.05],['eggs', 4.35],['spam', 2.95]]

meal_ordered = menu[2][0]
meal_price = menu[2][1]
print meal_ordered
print meal_price

print "\nQuestion 6\n"
word_lst = ['spam', 'grail', 'circus', 'like', 'flying', 'spam', 'I', 'python', 'monty']
#check this
msg_list = word_lst[6::-3]

print msg_list

print "\nQuestion 7\n"
a_list = ['red', ['stop light', 'apple',['tree', 'orchard',['tractor', 'plow', 'barn']],'cherry']]
my_str = a_list[1][2][2][0]

print my_str
