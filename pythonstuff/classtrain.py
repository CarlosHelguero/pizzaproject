import math 

class Train:
    def __init__(self, name,max_passengers,speed_fps):
        self.name = name 
        self.max_passengers=max_passengers
        self.num_passengers = 0 
        self.speed_fps=speed_fps
        self.speed_mph = speed_fps/1.46667
    def __str__(self):
        mph = "{:.2f}".format(self.speed_mph)
        return "Train named " + self.name + " with "+ str(self.num_passengers)+" passengers will travel at "+mph+ " mph\n"
    
    def time_to_travel(self, distance_feet):
        self.distance_feet=distance_feet
        seconds=int(self.distance_feet//self.speed_fps)
        return seconds
    
    def load_passengers(self, num_people):
        if self.num_passengers + num_people > self.max_passengers:
            raise  TrainCapacityException(num_people,'full')
        else:
            self.num_passengers = self.num_passengers + num_people


    def unload_passengers(self,	num_people):
        if  num_people <= self.num_passengers:
            self.num_passengers = self.num_passengers - num_people
        else:
            raise  TrainCapacityException(num_people,'empty') 


class TrainCapacityException(Exception):

    def __init__(self,	number,	issue):
        self.number = number
        self.issue = issue
    
    def __str__(self):
        if self.issue == 'full':
            return	str(self.number) + " passengers cannot be loaded because the train is full"
        elif self.issue == 'empty':
            return	str(self.number) + " passengers cannot be unloaded because the train is empty"


class City:
    def __init__(self, name, loc_x,	loc_y, stop_time):
        self.name = name
        self.loc_x = loc_x
        self.loc_y = loc_y
        self.stop_time = stop_time
    
    def __str__(self):
        formatedstoptime= "{:.2f}".format(self.stop_time)
        
        return self.name + " ("+ str(self.loc_x)+','+str(self.loc_y)+"). Exchange time: "+ formatedstoptime+" minutes"
        
    def __eq__(self, other):
        if (self.loc_x == other and self.loc_y == other):
            return True 
        else:
            return False 
            
    def distance_to_city(self, city):
        x= (self.loc_x + city.loc_x)**2
        
        y =(self.loc_y + city.loc_y)**2
        z= math.sqrt(x+y)
        return z 
class Journey:
    def __init__(self, train, destinations=None, start_time=0):
        
        self.train = train
        if destinations == None:
            self.destinations=[]
        else:
            self.destinations = destinations 
        
        self.start_time = start_time
    def __str__(self):
        stops = len(self.destinations)
        Journeystring = "Journey with "+str(stops)+" stops"
        for destination in self.destinations:
            Journeystring += "\n\t"+str(destination)
        
        Journeystring+= "\nTrain information: "+str(self.train)
    def add_destination(self, city):
        self.destinations.append(city)
          
        



#t =	Train("train1",	10,	22)	#22	fps	=	15	mph
#t.name
#t.time_to_travel(2200)	#	Time	to	travel	2200ft
#print(str(t))
#t.load_passengers(9)
#t.unload_passengers(10)
