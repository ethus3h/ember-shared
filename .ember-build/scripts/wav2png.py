#!/usr/bin/env python2

# Retrieved from http://archive.org/~tracey/downloads/wav2png.py on 2018 Apr. 27
# Initial tip and start of code from:
#
# http://jaganadhg.freeflux.net/blog/speech-processing/
#
# for WAVE files > 10 mins, requires 64bit 16GB RAM box it seems
#
# requires jaunty+ ubuntu and:
#
# apt-get install python-matplotlib python-tk


import matplotlib
#from cycler import cycler
matplotlib.use("agg")  # run without DISPLAY support
import sys
from pylab import *
import wave




spf = wave.open(sys.argv[1],'r')
print "number audio frames: ", spf.getnframes()


nf = -1
nf = 102090747 #204181494/2

# with just one cmd-line arg, plot entire wav up to "nf" audio frames
# a 2nd cmd-line arg of "2" is the 2nd chunk...
if len(sys.argv) == 2:
    n=1
else:
    n=int(sys.argv[2])

for i in range(0,n):
    if n>1:
        print "."
    sound_info = fromstring(spf.readframes(nf), 'Int16')

# print sound_info.shape
# print sound_info
# sound_info.tofile('/home/tracey/x/test.txt', sep="\n", format="%s");

#fig_size = [15,3]   # 1500x300
fig_size = [8,1]  # 800x100
params = {'xtick.direction': 'out',
          'ytick.direction': 'out',
          'axes.grid':False,
          'grid.linewidth':0,
          'grid.alpha':0,
          'axes.edgecolor':'black',
          'axes.facecolor':'black',
          'axes.labelcolor':'black',
          'axes.linewidth':0,
          #'axes.color_cycle':['#333333','#333333','#333333','#333333','#333333','#333333','#333333'],
          #'axes.color_cycle':['white','white','white','white','white','white','white'],
          'figure.figsize': fig_size}
rcParams.update(params)


# turn off border whitespace and axis around the graph
axes([0,0,1,1])
grid()

# position text in upper left corner of graph
maxy = sound_info.max()
print "max Y =",maxy
print "number elements =",sound_info.size

#text((0.05 * sound_info.size), (0.85 * maxy), 'Waveform for: %s' % sys.argv[1],
#     zorder=100, color='red')


print "plotting..."
plot(sound_info, color="white")

# make sure no extra space on the right, especially!
subplots_adjust(left=0.0, right=1.00)
axis('tight')

fi = (sys.argv[1]+".png").replace(".wav.png",".png",1);

print "saving to", fi

savefig(fi)
spf.close()
