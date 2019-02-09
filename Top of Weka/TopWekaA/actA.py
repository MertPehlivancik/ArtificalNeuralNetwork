"""
@author: Mert PEHLIVANCIK
"""

import glob
import os
# Set folder:
folder = r"E:\COMPUTER ENGINEERIG\4.Sınıf\ArtificalNeuralNetwork\ArffFile\Train"
# Get filepaths for all files which end with ".txt"
s = ['1','2','3','4','5','6','7','8','9','10']
allFiles = glob.glob(folder + "/act*a%s*.arff" % s)

# iterate for each file path in the list
for fp in allFiles:
    # Open the file in read mode
    with open(fp, "r+") as f:
        # We read the existing text from file in READ mode
        a = f.read()
        name = os.path.splitext(fp)[0]
        name = name[69:]
        print(name)
    # Now writing into the file with the prepend line + old file data
    with open(fp, "w+") as f:
        f.write("@relation %s\r\n" % name)
        f.write("@attribute md {1,2,3,4,5,6,7,8,9,10,11,12} \n")
        f.write("@attribute wdu {1,2,3,4,5,6,7} \n")
        f.write("@attribute stime numeric \n")
        f.write("@attribute duration numeric \n")
        f.write("@attribute class {yes,no} \r\n")
        f.write("@data \n" + a)

