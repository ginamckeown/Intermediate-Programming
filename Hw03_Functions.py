""" Project Name: Hw-03-Functions.py
    
    Description: Answers to homework assignment.
    
    Name: Gina Mckeown
    
    Date: 9/11/19
    """

print "\nQuestion 1\n"
def sq(x):
    """
    Returns the given number squared
    :param x: the number to be squared
    :return: the number squared
    """
    return x * x


print sq(4)
print sq(6)


print "\nQuestion 2\n"
def rev_list(a_list):
    """
    Returns the reverse of a given text string
    :param a_list: the list to reverse
    :return: the reversed list
    """
    return a_list[::-1]


print rev_list([1, 2, 3, 4, 5])
print rev_list(['z', 'y', 'x', 'w'])
print rev_list([1, 2, [3, 4], 5])


print "\nQuestion 3\n"
def shift_list(a_list, num):
    """
    Returns a list shifted by a given number
    :param a_list: a list to be shifted
    :param num: the number of places to shift left
    :return: the shifted list
    """
    return a_list[num:] + a_list[:num]


print shift_list([1, 2, 3, 4, 5, 6, 7, 8, 9], 3)
print shift_list(['spam', 'I', 'like'], 1)


print "\nQuestion 4\n"
def check_ends(s):
    """
    Checks the first and last characters of the string, s,
    and returns true if they are they same, false otherwise.
    :param s: string to be checked
    :return: true or false depending on whether
    the first or last characters of a string are the same
    """
    if s[0] == s[len(s)-1]:
        return True
    else:
        return False


print check_ends('no match')
print check_ends('hah! a match')
print check_ends('q')
print check_ends(' ')


print "\nQuestion 5\n"
def flipside(s):
    """
    Returns second half of the string first,
    and first half of string second
    :param s: string to be flipped
    :return: flipped string
    """
    x = len(s) / 2
    return s[x:] + s[:x]


print flipside('homework')
print flipside('carpets')


print "\nQuestion 6\n"
def convert_from_seconds(sec):
    """
    Returns converted seconds, sec, to more conventional
    measures of time: days, hours minutes and seconds.
    :param sec: total time in seconds
    :return: the converted days, hours, minutes, seconds
    """
    days = sec / (24 * 60 * 60)
    sec = sec - days * (24 * 60 * 60)
    hours = sec / (60 * 60)
    sec = sec - hours * (60 * 60)
    minutes = sec / 60
    sec = sec - minutes * 60
    seconds = sec

    return [days, hours, minutes, seconds]


print convert_from_seconds(610)
print convert_from_seconds(100000)


print "\nQuestion 7 EXTRA CREDIT\n"
def interp(low, hi, fraction):
    """
    Returns the sum of the low value and a fraction
    of the difference between the low and high value.
    :param low: lower number
    :param hi: higher number
    :param fraction: determines the amount to linearly interpolate
    :return: returns a floating-point value that
    linearly interpolates between low and hi by
    the amount specified by fraction
    """
    return (hi - low) * fraction + low


print interp(4.0, 10.0, 0.5)
print interp(1.0, 3.0, 0.25)
print interp(2, 12, 0.22)
print interp(24, 42, 0)
print interp(102, 117, -4.0)
