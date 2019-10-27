"""
Filename: Hw07-DNASequencing.py

This file contains methods for searching for a pattern in a DNA sequence.

Name: Gina McKeown

Date: 10/23/19
"""

import logging

logging.basicConfig(level=logging.DEBUG, filename='Hw07_debug.log')


def read_genome(filename):
    """
    opens a given file and goes through line by line, ignoring the header
    :param filename: the file to be opened
    :return: the opened file
    """
    genome = " "
    with open(filename, "r") as f:
        for line in f:  # open line by line
            # ignore header line with genome information
            if not line[0] == ">":  # all lines except header are included
                genome += line.rstrip()
    return genome
    

def find_pattern(pattern, text):
    """
    finds the offset of the occurrence for a given pattern in a given text.
    Appends the offset to a list.
    :param pattern: a string to represent the pattern looked for in text
    :param text: a string to represent the DNA that is looked through to find a pattern
    :return: occurrences, a list of all the offsets for the occurrences text has in pattern
    """
    logging.debug("starting to run find_pattern()...")
    occurrences = []
    # checking from 0 to length of text - length of pattern (otherwise too short, no possible match)
    for i in range(0, len(text) - len(pattern) + 1):
        match = True
        for j in range(0, len(pattern)):  # goes through the entire length of pattern
            # Compares pattern to text, no match when they are not the same
            if pattern[j] != text[i + j]:
                match = False
                break
        # if there is a match, add the offset to the list
        if match:
            occurrences.append(str(i))
    logging.debug("took in pattern {0}, found at {1}".format(pattern, occurrences))
    return occurrences


# Checking Progress
print("Testing find_pattern()")
t = "CAGGTTTGGACTCGAGGCTATTTGGCCTCTGTCGTTTCCTTTCTCTGTGTTTGGCCTTCCTGGAACAATATGGCCACA"
p = "TTTGGCCT"
print(find_pattern(p, t))

print("\nQuestion 2:")
genome = read_genome('lambda_virus.txt')
print("AGGT occurs", len(find_pattern("AGGT", genome)), "times in the Lambda virus")
print("The offset of the first occurrence is:", find_pattern("ACTAAGT", genome)[0])  # first index of list


def find_pattern_mm(pattern, text, max_mismatches):
    """
    finds the offset of the occurrence for a given pattern in a given text,
    allowing for a given number of mismatches. Appends the offset to a list.
    :param pattern: a string to represent the pattern looked for in text
    :param text: a string to represent the DNA that is looked through to find a pattern
    :param max_mismatches: the maximum amount of mismatches allowed
    :return: occurrences, a list of all the offsets for the occurrences text has in pattern
    """
    logging.debug("starting to run find_pattern_mm()...")
    occurrences = []
    # Checking from 0 to length of text - length of pattern (otherwise too short, no possible match)
    for i in range(0, len(text) - len(pattern) + 1):
        total_mismatches = 0
        match = True
        for j in range(0, len(pattern)):  # goes through the entire length of pattern
            # debugging print statement:
            # print(max_mismatches)
            # Compares pattern to text, no match when they are not the same
            if pattern[j] != text[i + j]:
                total_mismatches += 1
                if total_mismatches > max_mismatches:  # if mismatches are above the max, it s not a match
                    match = False
                    break
        # If there is a match, add the offset to the list
        if match:
            occurrences.append(str(i))
    logging.debug("took in pattern {0}, found at {1}".format(pattern, occurrences))
    return occurrences


# Set Up Virus Files
lambda_virus = genome
hepatitis_b_virus = read_genome('hepatitis_b_virus.txt')
measles_virus = read_genome('measles_virus.txt')
mumps_virus = read_genome('mumps_virus.txt')
nipah_virus = read_genome('nipah_virus.txt')
rubella_virus = read_genome('rubella_virus.txt')

# Checking Progress
t = "CAGGTTTGGACTCGAGGCTATTTGGCCTCTGTCGTTTCCTTTCTCTGTGTTTGGCCTTCCTGGAACAATATGGCCACA"
p = "TTTGGCCT"
print("\nTesting find_pattern_mm()")
print(find_pattern_mm(p, t, 2))

print("\nQuestion 4:")
print("AGGT occurs", len(find_pattern_mm("AGGT", lambda_virus, 2)),
      "times in the Lambda virus when allowing for two errors")
print("The offset of the first occurrence is:", find_pattern_mm("ACTAAGT", lambda_virus, 2)[0])

# Testing Patient DNA
print("\nQuestion 6 - Testing Patient DNA:")
patient_DNA = "CATTGCTGTTATAGAAGGGAGAAGTTGAGTCAATTAAGAAGCAGATGAACAGGCAAAATATCAGCATATCCACCCTGGAAGGACAACTCTCAAGCAT"
print("Lambda Virus", end="")
print(find_pattern_mm(patient_DNA, lambda_virus, 3))
print("Hepatitis B Virus", end="")
print(find_pattern_mm(patient_DNA, hepatitis_b_virus, 3))
print("Measles Virus", end="")
print(find_pattern_mm(patient_DNA, measles_virus, 3))
print("Mumps Virus", end="")
print(find_pattern_mm(patient_DNA, mumps_virus, 3))
print("Nipah Virus", end="")
print(find_pattern_mm(patient_DNA, nipah_virus, 3))
print("Rubella Virus", end="")
print(find_pattern_mm(patient_DNA, rubella_virus, 3))
print("Patient DNA matches Measles")


def num_base(genome):
    """
    counts the number of times each base appears in the given genome
    :param genome: a string to represent a genome
    :return: a dictionary with the counted occurrences of A, C, T, G
    """
    num_base = {"A": 0, "C": 0, "T": 0, "G": 0}  # create a dictionary for bases
    # For every base that occurs add to its value in the dictionary
    for base in genome:
        num_base[base] += 1
    return num_base


print("\nTesting Dictionary:")
print(num_base(t))


def reverse_complement(pattern):
    """
    returns the reverse complement of a given pattern
    :param pattern: a string representing a DNA segment
    :return: a string with the reverse complement
    """
    logging.debug("starting to run reverse_complement()...")
    complement = {'A': 'T', 'C': 'G', 'G': 'C', 'T': 'A'}  # dictionary holding complement values
    reverse_pattern = " "
    for base in pattern:
        # Adds new complement base before the previous
        reverse_pattern = complement[base] + reverse_pattern
    logging.debug("original pattern is {0}\nReverse pattern is {1}".format(pattern, reverse_pattern))
    return reverse_pattern


def find_pattern_with_rc(pattern, text):
    """
    finds the offset for the occurrences of a pattern and its reverse complement.
    :param pattern: a string to represent the pattern checked for, and to be reversed
    :param text: a string to represent the DNA that is looked through to find a pattern
    :return: a list with the occurrences of pattern and the reverse complement of pattern within text
    """
    logging.debug("starting to run find_pattern_with_rc()...")
    matches = find_pattern(pattern, text)
    logging.debug("found a match at".format(matches))
    if pattern != reverse_complement(pattern):  # if the pattern and its reverse complement are not the same
        matches += find_pattern(reverse_complement(pattern), text)  # add new occurrences
        # debugging print statement:
        # print(reverse_complement(pattern))
    logging.debug("found a reverse complementary match at {0} in geonome {1}"
                  .format(find_pattern(reverse_complement(pattern), text), text))
    return matches


# Checking Progress
print("\nExtra Credit:")
t = "AGCTCTAGATAGCTA"
p = "AGCT"  # a palindrome!
print(find_pattern_with_rc(p, t))
p = "GCTA"  # TAGC
print(find_pattern_with_rc(p, t))