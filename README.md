# Floaters
This is a processing sketch that I created when I was trying to make an interesting screen saver. The program generates different "floaters" or particles that have a randomized size and color that interact when they collide. 

Please excuse the name, when I first created this I didn't know what I was going to end up with. However odd the name is I find it fitting.


The way it works:

We generate a whole lot of floaters with randomized position, size, and color.
The general loop is us checking collisions and modifying speed and position values. Then  we call move on our floater objects. Then we call our draw function. An important detail is that the order we call move on our floaters depends on their order in our array, we don't calculate collision all in one step, rather we calculate collisions for each floater. I believe this detail leads to some interesting behavior as collisions get calculated twice. It introduces a sort of parity based on ordering in our array. It also makes some floaters draw on top of others completely arbitrarily by this ordering.

The first part of our collision method is detecting a collision which is pretty simple for two circles so I won't go into detail there. If there is a collision we set our floater randomly within close proximity of the other floater we have collided with. If our colors are the same both we and our collision partner gain a speed boost. This will make the random teleporting around less stable and gives the environment kinetic energy that can be transferred to other particles. If our colors are different we both lose speed which makes the "bond" more stable, and saps kinetic energy. After the speed and position calculations, we swap speeds with our collision partner. This effectively works as an elastic collision. After that, we calculate against an extremely random odd that we spontaneously increase our speed by a factor of 25. Then we draw a purple flash to show this rare event.

In the end these rules create unlike colored particles that clump together, fast particles that will elastically collide and send another particle flying like a newton's cradle desk toy, particles of the same color effectively repelling eachother, clumps of particles that can grow in size, but become increasing unstable and unlikely to stay together, and rare events that dump extra energy into the system.

This simulation sort of reminds me of real life atoms, however far from reality it is, it is definitely interesting to watch. 

You can tweak the size of the floaters, how many there are, introduce new colors, and many of the speed altering variables to change how this runs. I have dabbled doing that (especially with new colors), and have found my favorite settings to be very similar to the original settings I came up with.
