""" Project Name: Hw04-Cryptography.py
    
    Description: Pass a message to encipher or decipher using Caesar Cipher.
    Alphabet is shifted as chosen. User can also test for what shift is used by
    inputting an enciphered code.

    Name: Gina Mckeown

    Date: 9/25/19
"""


def letter_probability(c):
    """ if c is the space character or an alphabetic character,
        we return its monogram probability (for english),
        otherwise we return 1.0 We ignore capitalization.
        Adapted from
        http://www.cs.chalmers.se/Cs/Grundutb/Kurser/krypto/en_stat.html
    """
    if c == ' ':             return 0.1904
    if c == 'e' or c == 'E': return 0.1017
    if c == 't' or c == 'T': return 0.0737
    if c == 'a' or c == 'A': return 0.0661
    if c == 'o' or c == 'O': return 0.0610
    if c == 'i' or c == 'I': return 0.0562
    if c == 'n' or c == 'N': return 0.0557
    if c == 'h' or c == 'H': return 0.0542
    if c == 's' or c == 'S': return 0.0508
    if c == 'r' or c == 'R': return 0.0458
    if c == 'd' or c == 'D': return 0.0369
    if c == 'l' or c == 'L': return 0.0325
    if c == 'u' or c == 'U': return 0.0228
    if c == 'm' or c == 'M': return 0.0205
    if c == 'c' or c == 'C': return 0.0192
    if c == 'w' or c == 'W': return 0.0190
    if c == 'f' or c == 'F': return 0.0175
    if c == 'y' or c == 'Y': return 0.0165
    if c == 'g' or c == 'G': return 0.0161
    if c == 'p' or c == 'P': return 0.0131
    if c == 'b' or c == 'B': return 0.0115
    if c == 'v' or c == 'V': return 0.0088
    if c == 'k' or c == 'K': return 0.0066
    if c == 'x' or c == 'X': return 0.0014
    if c == 'j' or c == 'J': return 0.0008
    if c == 'q' or c == 'Q': return 0.0008
    if c == 'z' or c == 'Z': return 0.0005
    return 1.0


def encipher(message, shift):
    """ the string, message, is enciphered based on a shifted alphabet.
    Each character in the string, message, will be replaced with
    its corresponding enciphered character. Returns enciphered
    message.
    :param message: the text that will be enciphered
    :param shift: the number of shifts for the alphabet to be shifted
    :return: returns enciphered string
    """
    lower = "abcdefghijklmnopqrstuvwxyz"
    upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    # shifted alphabet is based on shift, all letters are moved from their original position
    shifted_lower = lower[len(upper) - shift:] + lower[:len(upper) - shift]
    shifted_upper = upper[len(upper) - shift:] + upper[:len(upper) - shift]

    # debugging print statement:
    # print shifted_upper

    encipher_str = ""
    for ch in message:
        # finds each uppercase character's enciphered letter, and adds it to the string
        if 'A' <= ch <= 'Z':
            ch_pos = upper.index(ch)
            encipher_str += shifted_upper[ch_pos]
        # finds each uppercase character's enciphered letter, and adds it to the string
        elif 'a' <= ch <= 'z':
            ch_pos = lower.index(ch)
            encipher_str += shifted_lower[ch_pos]
        # for any other character, just keep it the same
        else:
            encipher_str += ch
    return encipher_str


def decipher(message, shift):
    """ the string, message, is deciphered based on an alphabet shifted opposite of the
    one used to encipher it. Each character in the string, message, will be
    replaced with its corresponding deciphered character. Returns deciphered
    message.
    :param message: the text that will be deciphered
    :param shift: the number of shifts the code was enciphered with
    :return: returns deciphered string
    """
    lower = "abcdefghijklmnopqrstuvwxyz"
    upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    # translation alphabet based on shift
    shifted_lower = lower[shift:] + lower[:shift]
    shifted_upper = upper[shift:] + upper[:shift]

    # debugging print statement:
    # print shifted_upper

    decipher_str = ""
    for ch in message:
        # finds each uppercase character's corresponding deciphered letter, and adds it to the deciphered string
        if 'A' <= ch <= 'Z':
            ch_pos = upper.index(ch)
            decipher_str += shifted_upper[ch_pos]
        # finds each lowercase character's corresponding deciphered letter, and adds it to the deciphered string
        elif 'a' <= ch <= 'z':
            ch_pos = lower.index(ch)
            decipher_str += shifted_lower[ch_pos]
        # for any other character, just keep it the same
        else:
            decipher_str += ch
    return decipher_str


def try_all_shifts(message):
    """ a string, message, is passed with enciphered text. All shifts 1-26 are tested
    and the tested shift with the highest probability is the most likely deciphered text.
    Returns the value of shift, the most likely number of shifts for an enciphered text.
    :param message: the enciphered text that will be tested for shifts
    :return: the number of shifts used to encipher the message
    """
    # for every possible shift 0-26, find the total probability of the deciphered message
    shift = 0
    highest_total_probability = 0
    for i in range(26):
        total_probability = 0
        for ch in decipher(message, i):
            total_probability += letter_probability(ch)
        # if total probability is higher than the previous, then change the value of highest probability and shift
        if total_probability > highest_total_probability:
            # debugging print message:
            # print highest_total_probability
            highest_total_probability = total_probability
            shift = i  # shift of highest probable text
    return shift


mode_selection = 0
while True:
    try:  # prompt user to enter 1 or 2
        mode_selection = int(raw_input('Enter 1 to encipher or 2 to decipher: '))
        break
    except ValueError:  # continue with prompt if user enters an invalid integer
        print "Error try again"
        continue

# when mode_selection is not 1 or 2, prompt user to re-enter
while mode_selection not in [1, 2]:
    mode_selection = int(raw_input('Error enter 1 to encipher or 2 to decipher: '))

# ENCIPHER
if mode_selection == 1:
    user_message = str(raw_input('Enter text you wish to encipher: '))
    # debugging print statement:
    # print user_message

    # Checks for a valid integer for shift
    user_shift = 0
    while True:
        try:
            user_shift = int(raw_input('Enter the number of characters to shift: '))
            break  # end loop is a valid input is given
        except ValueError:  # if an integer value is not entered, send error and re-try
            print 'Error please enter a valid number'
            continue

    # Checks for user entering a shift between 1-26
    while user_shift < 1 or user_shift > 26:  # if the number is not within the range, ask again
        user_shift = int(raw_input('Error enter a number between 1-26: '))

    print 'The enciphered text is: ' + encipher(user_message, user_shift)
# DECIPHER
elif mode_selection == 2:
    user_message = str(raw_input('Enter text you wish to decipher: '))
    user_shift = try_all_shifts(user_message)  # represents the most likely shift of the message
    print 'The most likely shift is: ' + str(user_shift)
    print 'The deciphered text is: ' + decipher(user_message, user_shift)