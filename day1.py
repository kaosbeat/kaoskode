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
fill(colors.grey())
#I heard there's some good contrast between those colors

#it looks like a city grid lets make streets
for l in range (HEIGHT/20):
    #and cars
    for c in range(random(60)):
        car = rect(random(400),l*20,3,1)
        car.stroke = color(random(1.0),random(1.0),random(0))
    for i in range(WIDTH/20):
        rect(i*20+3,(l*20+3),14,14)
        car = rect(i*20,random(400),1,3)
        car.stroke = color(random(1.0),random(1.0),random(1.0))


#add a park
parkX = random(18)*20
parkY = random(18)*20
parksizeX = 80
parksizeY = 60
park = rect(parkX, parkY, parksizeX,parksizeY)
park.fill = colors.green()

#add people in the park
for l in range(random(100)):
    person = rect(parkX+random(parksizeX), parkY+random(parksizeY), 1,1)
    person.stroke = colors.black()  
    


#add clouds
for c in range(10):
    cX = random(50)*c
    cY = random(50)*c
    for cl in range(30): 
        cloud = oval(cX+random(20)+cl,cY+random(20),10,20)
        cloud.fill = color(1,0.9,0.9,0.5)
        cloud.stroke = None