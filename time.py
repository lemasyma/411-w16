import subprocess as sb
import matplotlib.pyplot as plt
import shutil as st

print("How do you want to copy the files?")
print("Press 1 for locally.")
print("Press 2 to use TCP.")
print("Press 3 to use UDP.")
print("Write the number and press Enter.")
choice = int(input("Your choice: "))

while choice != 1 and choice !=2 and choice!=3:
    choice = int(input("Invalid number. Please input a new one: "))

#Launch the shell scripts
print("Script launched.")
print("Creating the files...")

#Create the files (with predefined size)
sb.call("./create.sh")
print("Creation over.")
print("Copying the files and collect data...")

#Copy the files and output size/time in txt file
if choice == 1:
    sb.call("./copy.sh")
elif choice == 2:
    processes = [sb.Popen("./copyTCP.sh"), sb.Popen("./copyTCPclient.sh")]
    for p in processes:
        p.wait()
else:
    processes = [sb.Popen("./copyUDP.sh"), sb.Popen("./copyUDPclient.sh")]
    for p in processes:
        p.wait()
print("Copy over.")

#Remove the created folders and files
if choice==1:
    st.rmtree("copy/")
elif choice==2:
    st.rmtree("copyTCP/")
else:
    st.rmtree("copyUDP/")
st.rmtree("original/")

#Open and read txt file
name=""
if choice == 1:
    name="local.txt"
elif choice == 2:
    name="TCP.txt"
else:
    name="UDP.txt"

f = open(name, "r")
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

pic=""
if choice == 1:
    pic="time_local"
elif choice == 2:
    pic="time_TCP"
else:
    pic="time_UDP"

#Save the figure
plt.savefig(pic+".png")
plt.savefig(pic+".pdf")
plt.show()
