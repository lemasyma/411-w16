import subprocess as sb
import matplotlib.pyplot as plt

'''
print("start")
sb.call("./create.sh")
print("creation over")
sb.call("./copy.sh")
print("copy over")
'''
f = open("local.txt", "r")
lines = f.readlines()

x = []
y = []

for line in lines:
    size = line[0]
    i = 1
    while line[i]=='0':
        size += '0'
        i += 1
    x.append(size)
    time=line[i+1:]
    y.append(time)

plt.plot(x,y)
plt.show()
plt.savefig("time_local.png")
