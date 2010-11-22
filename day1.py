'''
so the basic idea is:
    - I write some code, 
    - It generates some gfx, 
    - I push the code to github 
    - the same script makes a blogpost with the output
    - and changes the profilepic of @kaoskode with link to the blog 
    
but we're not there yet
on the way I will learn python, git and explore other stuff
odds are I won't even finish todays session

did I mention, in order to learn git I will always return to a point I liked and from where I want to re-evolve
'''
size(400,400)
#different colors are essential to actually seeing stuff 
colors = ximport("colors")

background(colors.black())
# we want the background black like the night from which beaty will rise (it's winter and it's late)
stroke(colors.white())
#I heard there's some good contrast between those colors

#lets do rectangles
for l in range (HEIGHT/20+1):
    for i in range(WIDTH/20):
        rect(i*20,(l*20)-20,18,18)

