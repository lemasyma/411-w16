import subprocess as sb
import matplotlib.pyplot as plt
import shutil as st

#Launch the shell scripts
print("Script launched.")
print("Creating the files...")
#Create the files (with predefined size)
sb.call("./create.sh")
print("Creation over.")
print("Copying the files and collect data...")
#Copy the files and output size/time in local.txt
sb.call("./copy.sh")
print("Copy over.")

#Remove the created folders and files
st.rmtree("copy/")
st.rmtree("original/")

#Open and read local.txt
f = open("local.txt", "r")
lines = f.readlines()

#Initialize axis variables
x = []
y = []

for line in lines:
    size = line[0]
    i = 1
    #Get size value from file
    while line[i]=='0':
        size += '0'
        i += 1
    x.append(int(size))
    #Get time value from file
    time=line[i+1:]
    y.append(float(time))

#Create the graph
plt.plot(x,y)

#Add the labels
plt.title("Time in seconds of copying files of defined size")
plt.xlabel('Size (bits)')
plt.ylabel('Time (s)')

#Add the logarithmic scale and grid
plt.xscale('log')
plt.grid(True,which="both")

#Save the figure
plt.savefig("time_local.png")
plt.savefig("time_local.pdf")
plt.show()
