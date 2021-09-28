# STUDENTS: TO USE:
# 
# The following command will test all test cases on your file:
# 
#   python3 <thisfile.py> <your_one_file.py>
# 
# 
# You can also limit the tester to only the functions you want tested.
# Just add as many functions as you want tested on to the command line at the end.
# Example: to only run tests associated with func1, func2, and func3, run this command:
# 
#   python3 <thisfile.py> <your_one_file.py> func1 func2 func3
# 


# INSTRUCTOR: TO PREPARE:
#  - add test cases to class AllTests. The test case functions' names must
# be precise - to test a function named foobar, the test must be named "test_foobar_#"
# where # may be any digits at the end, such as "test_foobar_13".
# - any extra-credit tests must be named "test_extra_credit_foobar_#"
# 
# - name all required definitions in REQUIRED_DEFNS. Do not include any unofficial 
#   helper functions. If you want to make helper definitions to use while testing,
#   those can also be added there for clarity.
# 
# to run on either a single file or all .py files in a folder (recursively):
#   python3 <thisfile.py> <your_one_file.py>
#   python3 <thisfile.py> <dir_of_files>
# 
# A work in progress by Mark Snyder, Oct. 2015.
#  Edited by Yutao Zhong, Spring 2016.
#  Edited by Raven Russell, Spring 2017.


import unittest
import shutil
import sys
import os
import time

import importlib

############################################################################
############################################################################
# BEGIN SPECIALIZATION SECTION (the only part you need to modify beyond 
# adding new test cases).

# name all expected definitions; if present, their definition (with correct
# number of arguments) will be used; if not, a decoy complainer function
# will be used, and all tests on that function should fail.
	
REQUIRED_DEFNS = [ 	"Train",
					"TrainCapacityException",
					"City",
					"Journey"
				 ]

# for method names in classes that will be tested
SUB_DEFNS = [	"time_to_travel", "load_passengers", "unload_passengers",
				"load_passengers_exception","unload_passengers_exception",
				"distance_to_city", "journey_type_error",
				"add_destination","city_in_journey","check_journey_includes",
				"total_journey_distance", "city_arrival_time","city_departure_time",
				"total_journey_time","all_passengers_accommodated"
			]


extra_credit = []

weight_required = 1
weight_extra_credit = 1
				 
RENAMED_FILE = "student"



# END SPECIALIZATION SECTION
############################################################################
############################################################################



# enter batch mode by giving a directory to work on.
BATCH_MODE = (sys.argv[1] in ["."] or os.path.isdir(sys.argv[1]))

# This class contains multiple "unit tests" that each check
# various inputs to specific functions, checking that we get
# the correct behavior (output value) from completing the call.
class AllTests (unittest.TestCase):
		
	
	############################################################################
	
	# Train class basics
	
	def test_Train_1(self): self.assertEqual(Train("train 1", 10, 22).name,"train 1")
	def test_Train_2(self): self.assertEqual(Train("train 1", 10, 22).max_passengers,10)
	def test_Train_3(self): self.assertEqual(Train("train 1", 10, 22).num_passengers,0)
	def test_Train_4(self): self.assertEqual(Train("train 1", 10, 22).speed_fps,22)
	def test_Train_5(self): 
		self.assertEqual(Train("train 1", 10, 22).__str__(),'Train named train 1 with 0 passengers will travel at 15.00mph')
	def test_Train_6(self): 
		self.assertEqual(Train("Express One", 50, 100).__str__(),'Train named Express One with 0 passengers will travel at 68.18mph')
	def test_Train_7(self): 
		train = Train("NYC Express", 20, 5280)
		train.num_passengers += 10
		self.assertEqual(str(train),'Train named NYC Express with 10 passengers will travel at 3600.00mph')
	
	############################################################################	
	# Train class time_to_travel() method

	def test_time_to_travel_1(self): self.assertEqual(Train("train 1", 10, 22).time_to_travel(2200),100)
	def test_time_to_travel_2(self): self.assertEqual(Train("Express One", 50, 100).time_to_travel(36000),360)
	def test_time_to_travel_3(self): self.assertEqual(Train("NYC Express", 20, 280).time_to_travel(1500),5)
	def test_time_to_travel_4(self): self.assertEqual(Train("train 2", 100, 45).time_to_travel(2000),44)
	
	############################################################################
	# Train class load_passengers() method, no exception
	
	def test_load_passengers_1(self): 
		train = Train("train 1", 10, 22)
		train.load_passengers(6)
		self.assertEqual(train.num_passengers,6)

	def test_load_passengers_2(self): 
		train = Train("train 1", 50, 22)
		train.load_passengers(20)
		train.load_passengers(30)
		self.assertEqual(train.num_passengers,50)

	def test_load_passengers_3(self): 
		train = Train("train 1", 50, 22)
		train.load_passengers(20)
		train.num_passengers -= 10
		train.load_passengers(29)
		self.assertEqual(train.num_passengers,39)
		
	############################################################################
	# Train class unload_passengers() method, no exception
	
	def test_unload_passengers_1(self): 
		train = Train("train 1", 10, 22)
		train.num_passengers=10
		train.unload_passengers(6)
		self.assertEqual(train.num_passengers,4)

	def test_unload_passengers_2(self): 	#testing both load and unload
		train = Train("train 1", 50, 22)
		train.num_passengers= 40
		train.unload_passengers(25)
		train.unload_passengers(5)
		train.unload_passengers(10)
		self.assertEqual(train.num_passengers,0)
		
	def test_unload_passengers_3(self): 	#testing both load and unload
		train = Train("train 1", 50, 22)
		train.load_passengers(20)
		train.unload_passengers(11)
		train.load_passengers(18)
		train.unload_passengers(5)
		self.assertEqual(train.num_passengers,22)
		

	############################################################################
	# TrainCapacityError class
	
	def test_TrainCapacityException_1(self):  #test basics
		tc = TrainCapacityException(5,"full")
		self.assertEqual(tc.number,5)
		self.assertEqual(tc.issue,"full")
		self.assertEqual(str(tc), "5 passengers cannot be loaded because the train is full!")

	def test_TrainCapacityException_2(self):  #test: can we raise it?
		tc = TrainCapacityException(5,"full")
		try:
			raise tc
		except TrainCapacityException:
			pass
		except:
			self.fail("should have been able to raise a TrainCapacityException")
			
	def test_TrainCapacityException_3(self):  
		tc = TrainCapacityException(20,"empty")
		self.assertEqual(tc.number,20)
		self.assertEqual(tc.issue,"empty")
		self.assertEqual(str(tc), "20 passengers cannot be unloaded because the train is empty!")
		try:
			raise tc
		except TrainCapacityException:
			pass
		except:
			self.fail("should have been able to raise a TrainCapacityException")

	def test_TrainCapacityException_4(self):  	# test: default value
		tc = TrainCapacityException(18)
		self.assertEqual(tc.number,18)
		self.assertEqual(tc.issue,"full")
		self.assertEqual(str(tc), "18 passengers cannot be loaded because the train is full!")
		try:
			raise tc
		except TrainCapacityException:
			pass
		except:
			self.fail("should have been able to raise a TrainCapacityException")

	############################################################################
	# Train class load_passengers() method exception behavior
	
	def test_load_passengers_exception_1(self):  	# test: Train::load_passengers() triggers exception
		train = Train("train 1", 10, 22)
		try:
			train.load_passengers(20)
			self.fail("should have raised a TrainCapacityException")
		except TrainCapacityException:
			pass
		except:
			self.fail("should have raised a TrainCapacityException")
		
	def test_load_passengers_exception_2(self):  	# test: exception details
		train = Train("train 1", 10, 22)
		try:
			train.load_passengers(20)
			self.fail("should have raised a TrainCapacityException")
		except TrainCapacityException as e:
			self.assertEqual(e.number, 10)
			self.assertEqual(e.issue,"full")
			self.assertEqual(train.num_passengers, 0)	#num_passengers not changed
		except:
			self.fail("should have raised a TrainCapacityException")

	############################################################################
	# Train class unload_passengers() method exception behavior

	def test_unload_passengers_exception_1(self):  	# test: Train::unload_passengers() triggers exception
		train = Train("train 1", 10, 22)
		train.load_passengers(10)
		try:
			train.unload_passengers(16)
			self.fail("should have raised a TrainCapacityException")
		except TrainCapacityException:
			pass
		except:
			self.fail("should have raised a TrainCapacityException")
		
	def test_unload_passengers_exception_2(self):  	# test: exception details
		train = Train("train 1", 10, 22)
		train.load_passengers(10)
		try:
			train.unload_passengers(16)
			self.fail("should have raised a TrainCapacityException")
		except TrainCapacityException as e:
			self.assertEqual(e.number, 6)
			self.assertEqual(e.issue,"empty")
			self.assertEqual(train.num_passengers, 10)	#num_passengers not changed
		except:
			self.fail("should have raised a TrainCapacityException")
	
	############################################################################
	# City class
	
	def test_City_1(self): self.assertEqual(City("New York", 0, 3, 300).name,"New York")
	def test_City_2(self): self.assertEqual(City("New York", 0, 3, 300).loc_x,0)
	def test_City_3(self): self.assertEqual(City("New York", 0, 3, 300).loc_y,3)
	def test_City_4(self): self.assertEqual(City("New York", 0, 3, 300).stop_time,300)
	def test_City_5(self): self.assertEqual(City("New York", 0, 3, 300).__str__(),"New York (0,3). Exchange time: 5.00 minutes")
	def test_City_6(self): 
		city = City("New York", 0, 3, 1000)
		self.assertEqual(str(city),"New York (0,3). Exchange time: 16.67 minutes")
	def test_City_7(self): 
		c1 = City("New York", 0, 3, 1000)
		c2 = City("The Big Apple",0,3,6000)
		self.assertEqual(c1.__eq__(c2), True)
	def test_City_8(self): 
		c1 = City("Rochester",4,8,300)
		c2 = City("Rochester",1,10,300)
		c3 = City("The Lilac City",4,8,600)
		self.assertEqual(c1,c3)
		self.assertEqual(c1==c2, False)
		
	############################################################################

	# City class distance_to_city()
	def test_distance_to_city_1(self): 
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",0,8,300)
		self.assertEqual(c1.distance_to_city(c2),5)

	def test_distance_to_city_2(self): 
		c1 = City("City 1",14,3,300)
		c2 = City("City 2",5,3,300)
		self.assertEqual(c1.distance_to_city(c2),9)

	def test_distance_to_city_3(self): 
		c1 = City("City 1", 0,3,300)
		c2 = City("City 2",4,8,300)
		self.assertAlmostEqual(c1.distance_to_city(c2),6.403,places=3)

	def test_distance_to_city_4(self): 
		c1 = City("Emerald City", 100,300,4000)
		c2 = City("Kansas City", 1, 1,500)
		self.assertAlmostEqual(c1.distance_to_city(c2),314.963,places=3)
	
	############################################################################
	# Journey class basics
	
	def test_Journey_1(self): 
		t = Train("Express One", 50, 100)
		cities = [City("City 1", 0,3,600)]
		self.assertEqual(Journey(t,cities,10000).train,t)

	def test_Journey_2(self): 
		t = Train("Express One", 50, 100)
		cities = [City("City 1", 0,3,600)]
		self.assertEqual(Journey(t,cities,10000).destinations,cities)

	def test_Journey_3(self): 
		t = Train("Express One", 50, 100)
		cities = [City("City 1", 0,3,600)]
		self.assertEqual(Journey(t,cities,10000).start_time,10000)
		
	def test_Journey_4(self): 				#default values
		t = Train("Express One", 50, 100)
		self.assertEqual(Journey(t).train,t)
		self.assertEqual(Journey(t).destinations,[])
		self.assertEqual(Journey(t).start_time,0)

	def test_Journey_5(self): 				#default values
		t = Train("Express One", 50, 100)
		self.assertEqual(Journey(t,[]).train,t)
		self.assertEqual(Journey(t,[]).destinations,[])
		self.assertEqual(Journey(t,[]).start_time,0)

	def test_Journey_6(self): 
		t = Train("Express One", 50, 100)
		cities = [City("City 1", 0,3,600), City("City 2",4,8,300)]
		self.assertEqual(Journey(t,cities,10000).train,t)
		self.assertEqual(Journey(t,cities,10000).destinations,cities)
		self.assertEqual(Journey(t,cities,10000).start_time,10000)

	def test_Journey_7(self): 
		t = Train("Express One", 50, 22)
		cities = [City("City 1", 0,3,600), City("City 2",4,8,300), City("City 3",400,8000,120)]
		journey = Journey(t,cities,10000)
		self.assertEqual(str(journey),
			"Journey with 3 stops:\n\tCity 1 (0,3). Exchange time: 10.00 minutes\n\tCity 2 (4,8). Exchange time: 5.00 minutes\n\tCity 3 (400,8000). Exchange time: 2.00 minutes\nTrain Information: Train named Express One with 0 passengers will travel at 15.00mph\n")

	def test_Journey_8(self): 
		t = Train("Express One", 50, 200)
		t.num_passengers += 30
		cities = [City("Emerald City",1000,1000,320), City("Kansas",0,0,300)]
		journey = Journey(t,cities,10000)
		self.assertEqual(str(journey),
			"Journey with 2 stops:\n\tEmerald City (1000,1000). Exchange time: 5.33 minutes\n\tKansas (0,0). Exchange time: 5.00 minutes\nTrain Information: Train named Express One with 30 passengers will travel at 136.36mph\n")

	def test_Journey_9(self): 
		t = Train("Express One", 50, 22)
		j = Journey(t)
		self.assertEqual(str(j),
			"Journey with 0 stops:\nTrain Information: Train named Express One with 0 passengers will travel at 15.00mph\n")
		

	############################################################################

	# Journey class incorrect argument type to constructor
	def test_journey_type_error_1(self):
		try:
			j = Journey("train",[])
			self.fail("should have raised a TypeError")
		except TypeError:
			pass
		except:
			self.fail("should have raised a TypeError")

	def test_journey_type_error_2(self):
		t = Train("Express One", 50, 22)
		try:
			j = Journey(t,"destination")
			self.fail("should have raised a TypeError")
		except TypeError:
			pass
		except:
			self.fail("should have raised a TypeError")

	def test_journey_type_error_3(self):
		t = Train("Express One", 50, 22)
		c1 = City("New York", 0,3,600)
		try:
			j = Journey(t,[c1,"c2"])
			self.fail("should have raised a TypeError")
		except TypeError:
			pass
		except:
			self.fail("should have raised a TypeError")

	############################################################################

	# Journey class add_destination method
	
	def test_add_destination_1(self): 		#test: add one destination
		t = Train("Express One", 50, 100)
		j = Journey(t,[],0)
		c1 = City("New York", 0,3,600)
		j.add_destination(c1)
		self.assertEqual(j.destinations,[c1])

	def test_add_destination_2(self): 		#test: returns None
		t = Train("Express One", 50, 100)
		j = Journey(t,[],0)
		c1 = City("New York", 0,3,600)
		self.assertEqual(j.add_destination(c1),None)

	def test_add_destination_3(self): 		#test: add more than one destination
		t = Train("Express One", 50, 100)
		j = Journey(t,[],0)
		c1 = City("City 1",2,3,900)
		c2 = City("City 2",5,10,600)
		c3 = City("City 3", 0,0,300)
		j.add_destination(c1)
		j.add_destination(c2)
		j.add_destination(c3)
		self.assertEqual(j.destinations[0],c1)
		self.assertEqual(j.destinations[1],c2)
		self.assertEqual(j.destinations[-1],c3)

	def test_add_destination_4(self): 		#test: keeps appending, not changing the id
		t = Train("Express One", 50, 100)
		c = City("City 1",5,10,600)
		j = Journey(t,[c],0)
		c1 = City("City 2",2,3,900)
		c2 = City("City 3", 0,0,300)
		old_id = id(j.destinations)
		j.add_destination(c1)
		self.assertEqual(id(j.destinations), old_id)
		j.add_destination(c2)
		self.assertEqual(id(j.destinations), old_id)
		self.assertEqual(j.destinations,[c, c1,c2])
		
	############################################################################
	# Journey class city_in_journey method

	def test_city_in_journey_1(self): 		
		t = Train("Express One", 50, 100)
		c1 = City("City 1",5,10,600)
		cities = [c1,City("City 2",2,3,900), City("City 3", 0,0,300)]
		j = Journey(t,cities,200)
		self.assertEqual(j.city_in_journey(c1),True)
				
	def test_city_in_journey_2(self): 		# same features, different objects
		t = Train("Express One", 50, 100)		
		cities = [City("City 1",5,10,600),City("City 2",2,3,900), City("City 3", 0,0,300)]
		j = Journey(t,cities,200)
		c2 = City("City 2",2,3,900)
		self.assertEqual(j.city_in_journey(c2),True)

	def test_city_in_journey_3(self): 		# same location, different name
		t = Train("Express One", 50, 100)		
		cities = [City("City 1",5,10,600),City("City 2",2,3,900), City("City 3", 0,0,300)]
		j = Journey(t,cities,200)
		c3 = City("City 3_alias",5,10,100)
		self.assertEqual(j.city_in_journey(c3),True)

	def test_city_in_journey_4(self): 		# return False
		t = Train("Express One", 50, 100)		
		cities = [City("City 1",5,10,600),City("City 2",2,3,900), City("City 3", 0,0,300)]
		j = Journey(t,cities,200)
		c = City("City 4",0,110,200)
		self.assertEqual(j.city_in_journey(c),False)

	def test_city_in_journey_5(self): 		# same name, different location ==> not same city
		t = Train("Express One", 50, 100)		
		cities = [City("City 1",5,10,600),City("City 2",2,3,900), City("City 3", 0,0,300)]
		j = Journey(t,cities,200)
		c = City("City 1",0,110,200)
		self.assertEqual(j.city_in_journey(c),False)


	############################################################################
	# Journey class check_journey_includes method
				
	def test_check_journey_includes_1(self): 		
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",5,10,600)
		c2 = City("City 2",2,3,900)
		c3 = City("City 3", 0,0,300)
		c4 = City("City 4", 12,4,1000)
		j = Journey(t,[c1,c2,c3,c4],200)
		self.assertEqual(j.check_journey_includes(c1,c2),True)

	def test_check_journey_includes_2(self): 		
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",5,10,600)
		c2 = City("City 2",2,3,900)
		c3 = City("City 3", 0,0,300)
		c4 = City("City 4", 12,4,1000)
		j = Journey(t,[c1,c2,c3,c4],200)
		self.assertEqual(j.check_journey_includes(c3,c4),True)

	def test_check_journey_includes_3(self): 		
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",5,10,600)
		c2 = City("City 2",2,3,900)
		c3 = City("City 3", 0,0,300)
		c4 = City("City 4", 12,4,1000)
		j = Journey(t,[c1,c2,c3,c4],200)
		self.assertEqual(j.check_journey_includes(c1,c4),True)

	def test_check_journey_includes_4(self): 		
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",5,10,600)
		c2 = City("City 2",2,3,900)
		c3 = City("City 3", 0,0,300)
		c4 = City("City 4", 12,4,1000)
		j = Journey(t,[c1,c2,c3,c4],200)
		self.assertEqual(j.check_journey_includes(c3,c2),False) #order incorrect

	def test_check_journey_includes_5(self): 		
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",5,10,600)
		c2 = City("City 2",2,3,900)
		c3 = City("City 3", 0,0,300)
		c4 = City("City 4", 12,4,1000)
		j = Journey(t,[c2,c3,c4],200)
		self.assertEqual(j.check_journey_includes(c1,c3),False)

	def test_check_journey_includes_6(self): 		
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",5,10,600)
		c2 = City("City 2",2,3,900)
		c3 = City("City 3", 0,0,300)
		c4 = City("City 4", 12,4,1000)
		j = Journey(t,[c1,c2,c3],200)
		self.assertEqual(j.check_journey_includes(c3,c4),False)

	def test_check_journey_includes_7(self): 		
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",5,10,600)
		c2 = City("City 2",2,3,900)
		c3 = City("City 3", 0,0,300)
		c4 = City("City 4", 12,4,1000)
		j = Journey(t,[c1,c2,c3,c1],200)
		self.assertEqual(j.check_journey_includes(c2,c1),True)

	############################################################################
	# Journey class total_journey_distance method

	def test_total_journey_distance_1(self): 	#empty list of destinations
		t = Train("Express One", 50, 100)		
		j = Journey(t,[],200)
		self.assertEqual(j.total_journey_distance(),0)

	def test_total_journey_distance_2(self): 	#one destination
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",0,3,300)
		j = Journey(t,[c1],200)
		self.assertEqual(j.total_journey_distance(),0)

	def test_total_journey_distance_3(self): 	#two destinations
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",0,8,300)
		j = Journey(t,[c1,c2],200)
		self.assertEqual(j.total_journey_distance(),5)

	def test_total_journey_distance_4(self): 	#two destinations
		t = Train("Express One", 50, 100)		
		c1 = City("City 1", 0,8,300)
		c2 = City("City 2",4,3,300)
		j = Journey(t,[c1,c2],200)
		self.assertAlmostEqual(j.total_journey_distance(),6.403,places=3)

	def test_total_journey_distance_5(self): 	#more destinations
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",14,8,300)
		c2 = City("City 2",4,8,300)
		c3 = City("City 3",4,10,200)
		j = Journey(t,[c1,c2,c3],200)
		self.assertEqual(j.total_journey_distance(),12)

	def test_total_journey_distance_6(self): 	#more destinations
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",14,8,300)
		c2 = City("City 2",4,8,300)
		c3 = City("City 3",20,6,200)
		c4 = City("City 4",1,10,180)
		j = Journey(t,[c1,c2,c3,c4],0)
		self.assertAlmostEqual(j.total_journey_distance(),45.54, places=2)


	############################################################################
	# Journey class city_arrival_time method

	def test_city_arrival_time_1(self): 	#first destination
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",0,3,300)
		j = Journey(t,[c1],200)
		self.assertEqual(j.city_arrival_time(c1),200)

	def test_city_arrival_time_2(self): 	#2nd destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",0,3003,300)
		j = Journey(t,[c1,c2],200)
		self.assertEqual(j.city_arrival_time(c2),800)

	def test_city_arrival_time_3(self): 	#2nd destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		j = Journey(t,[c1,c2],1000)
		self.assertEqual(j.city_arrival_time(c1),1000)
		self.assertEqual(j.city_arrival_time(c2),1149)

	def test_city_arrival_time_4(self): 	
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2,c3],1000)
		self.assertEqual(j.city_arrival_time(c3),1469)

	def test_city_arrival_time_5(self): 	#return the first arrival
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,10,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2,c3,c2],1000)
		self.assertEqual(j.city_arrival_time(c2),1149)

	def test_city_arrival_time_6(self): 	# city not in journey, should return None
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2],1000)
		self.assertEqual(j.city_arrival_time(c3),None)

	############################################################################
	# Journey class city_arrival_time method

	def test_city_departure_time_1(self): 	#first destination
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",0,3,300)
		j = Journey(t,[c1],200)
		self.assertEqual(j.city_departure_time(c1),500)

	def test_city_departure_time_2(self): 	#2nd destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",0,3003,300)
		j = Journey(t,[c1,c2],200)
		self.assertEqual(j.city_departure_time(c2),1100)

	def test_city_departure_time_3(self): 	#2nd destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		j = Journey(t,[c1,c2],1000)
		self.assertEqual(j.city_departure_time(c1),1120)
		self.assertEqual(j.city_departure_time(c2),1449)

	def test_city_departure_time_4(self): 	
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2,c3],1000)
		self.assertEqual(j.city_departure_time(c3),1709)

	def test_city_departure_time_5(self): 	#return the last departure
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,10,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2,c3,c2],1000)
		self.assertEqual(j.city_departure_time(c2),2029)

	def test_city_departure_time_6(self): 	# city not in journey, should return None
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2],1000)
		self.assertEqual(j.city_departure_time(c3),None)

	############################################################################
	# Journey class total_journey_time method

	def test_total_journey_time_1(self): 	#one destination
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",0,3,300)
		j = Journey(t,[c1],200)
		self.assertEqual(j.total_journey_time(),300)

	def test_total_journey_time_2(self): 	#two destinations
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",0,3003,300)
		j = Journey(t,[c1,c2],200)
		self.assertEqual(j.total_journey_time(),900)

	def test_total_journey_time_3(self): 	#2nd destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		j = Journey(t,[c1,c2],1000)
		self.assertEqual(j.total_journey_time(),449)

	def test_total_journey_time_4(self): 	
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,3,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2,c3],1000)
		self.assertEqual(j.total_journey_time(),709)

	def test_total_journey_time_5(self): 	
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",100,10,120)
		c2 = City("City 2",78,300,300)
		c3 = City("City 3", 50, 100, 240)
		j = Journey(t,[c1,c2,c3,c2],1000)
		self.assertEqual(j.total_journey_time(),1029)

	############################################################################
	# Journey class all_passengers_accommodated method

	def test_all_passengers_accommodated_1(self): 	#one destination
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",0,3,300)
		j = Journey(t,[c1],200)
		self.assertEqual(j.all_passengers_accommodated([5],[5]),False) #no passenger to be unloaded
		#self.assertEqual(t.num_passengers, 0)

	def test_all_passengers_accommodated_2(self): 	#one destination
		t = Train("Express One", 50, 100)		
		c1 = City("City 1",0,3,300)
		j = Journey(t,[c1],200)
		self.assertEqual(j.all_passengers_accommodated([0],[100]),False) #too many to load
		#self.assertEqual(t.num_passengers, 0)
		
	def test_all_passengers_accommodated_3(self): 	#one destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",0,3,300)
		j = Journey(t,[c1],200)
		self.assertEqual(j.all_passengers_accommodated([0],[30]),True)
		#self.assertEqual(t.num_passengers, 30)

	def test_all_passengers_accommodated_4(self): 	#two destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",78,300,300)
		j = Journey(t,[c1,c2],200)
		self.assertEqual(j.all_passengers_accommodated([0,40],[30,10]),False)
		#self.assertEqual(t.num_passengers, 30)
		
	def test_all_passengers_accommodated_5(self): 	#two destination
		t = Train("Express One", 50, 10)		
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",78,300,300)
		j = Journey(t,[c1,c2],200)
		self.assertEqual(j.all_passengers_accommodated([0,5],[30,20]),True)
		self.assertEqual(t.num_passengers, 45)

	def test_all_passengers_accommodated_6(self): 	
		t = Train("Express One", 50, 10)
		t.load_passengers(15)
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",78,300,300)
		j = Journey(t,[c1,c2,c1,c2],200)
		self.assertEqual(j.all_passengers_accommodated([5,15,5,45],[30,20,5,0]),True)
		self.assertEqual(t.num_passengers, 0)

	def test_all_passengers_accommodated_7(self): 	
		t = Train("Express One", 50, 10)
		t.load_passengers(15)
		c1 = City("City 1",0,3,300)
		c2 = City("City 2",78,300,300)
		j = Journey(t,[c1,c2,c1,c2],200)
		self.assertEqual(j.all_passengers_accommodated([5,15,5,45],[30,20,15,0]),False)
		#self.assertEqual(t.num_passengers, 40)

		
	############################################################################
	
#	def test_extra_credit_NAME_1(self):
#		self.assertEqual(1,1)
	
	############################################################
	
# This class digs through AllTests, counts and builds all the tests,
# so that we have an entire test suite that can be run as a group.
class TheTestSuite (unittest.TestSuite):
	# constructor.
	def __init__(self,wants):
		# find all methods that begin with "test".
		fs = []
		for w in wants:
			for func in AllTests.__dict__:
				# append regular tests
				# drop any digits from the end of str(func).
				dropnum = str(func)
				while dropnum[-1] in "1234567890":
					dropnum = dropnum[:-1]
				
				if dropnum==("test_"+w+"_") and (not (dropnum==("test_extra_credit_"+w+"_"))):
					fs.append(AllTests(str(func)))
				if dropnum==("test_extra_credit_"+w+"_") and not BATCH_MODE:
					fs.append(AllTests(str(func)))
		
		# call parent class's constructor.
		unittest.TestSuite.__init__(self,fs)

class TheExtraCreditTestSuite (unittest.TestSuite):
		# constructor.
		def __init__(self,wants):
			# find all methods that begin with "test_extra_credit_".
			fs = []
			for w in wants:
				for func in AllTests.__dict__:
					if str(func).startswith("test_extra_credit_"+w):
						fs.append(AllTests(str(func)))
		
			# call parent class's constructor.
			unittest.TestSuite.__init__(self,fs)

# all (non-directory) file names, regardless of folder depth,
# under the given directory 'dir'.
def files_list(dir):
	info = os.walk(dir)
	filenames = []
	for (dirpath,dirnames,filez) in info:
#		print(dirpath,dirnames,filez)
		if dirpath==".":
			continue
		for file in filez:
			filenames.append(os.path.join(dirpath,file))
#		print(dirpath,dirnames,filez,"\n")
#		filenames.extend(os.path.join(dirpath, filez))
	return filenames

def main():
	if len(sys.argv)<2:
		raise Exception("needed student's file name as command-line argument:"\
			+"\n\t\"python3 tester4L.py gmason76_2xx_L4.py\"")
	want_all = len(sys.argv) <=2
	wants = []
	
	# remove batch_mode signifiers from want-candidates.
	want_candidates = sys.argv[2:]
	for i in range(len(want_candidates)-1,-1,-1):
		if want_candidates[i] in ['.'] or os.path.isdir(want_candidates[i]):
			del want_candidates[i]
	
	if not want_all:
		#print("args: ",sys.argv)
		for w in want_candidates:
			if w in REQUIRED_DEFNS:
				wants.append(w)
			elif w in SUB_DEFNS:
				wants.append(w)
			else:
				raise Exception("asked to limit testing to unknown function '%s'."%w)
	else:
		wants = REQUIRED_DEFNS + SUB_DEFNS

	
	if not BATCH_MODE:
		if not want_all:
			run_file(sys.argv[1],wants)
		else:
			if len(extra_credit) == 0:
				(tag, passed1,tried1,ec) = run_file(sys.argv[1],wants)

				print("\nTest cases: %d/%d passed" % (passed1,tried1) )
				print("Score based on test cases: %.2f/100" % (passed1*weight_required))
			
			else:	
				(tag, passed1,tried1,ec) = run_file(sys.argv[1],wants[:-len(extra_credit)])
				if passed1 == None:
					return

			
				(tag, passed2,tried2,ec) = run_file(sys.argv[1],extra_credit)
				if passed2!= None:
					print("\nRequired test cases: %d/%d passed" % (passed1,tried1) )
					print("Extra credit test cases: %d/%d passed" % (passed2, tried2))
					print("Score based on test cases: %.2f (%.2f+%d) " % (passed1*weight_required+passed2*weight_extra_credit, 
														passed1*weight_required, passed2*weight_extra_credit))

				else:
					print("\nRequired test cases: %d/%d passed" % (passed1,tried1) )
					print("Extra credit test cases: 0 passed")
					print("Score based on test cases: %.2f (%.2f+0) " % (passed1*weight_required, 
														passed1*weight_required))
	else:
		filenames = files_list(sys.argv[1])
	
# 		print(filenames)
	
		results = []
		for filename in filenames:
			try:
				print("\n\n\nRUNNING: "+filename)
				(tag, passed,tried,ec) = run_file(filename,wants)
				results.append((tag,passed,tried,ec))
			except SyntaxError as e:
				results.append((filename+"_SYNTAX_ERROR",0,1))	
			except NameError as e:
				results.append((filename+"_Name_ERROR",0,1))	
			except ValueError as e:
				results.append(filename+"_VALUE_ERROR",0,1)
			except TypeError as e:
				results.append(filename+"_TYPE_ERROR",0,1)
			except ImportError as e:
				results.append((filename+"_IMPORT_ERROR_TRY_AGAIN	",0,1))	
			except Exception as e:
				results.append(filename+str(e.__reduce__()[0]),0,1)
			
		print("\n\n\nGRAND RESULTS:\n")
		for (tag, passed, tried, ec) in results:
			print(("%.0f%%  (%d/%d, %dEC) - " % (passed/tried*100 + ec, passed, tried, ec))+tag)

def try_copy(filename1, filename2, numTries):
	have_copy = False
	i = 0
	while (not have_copy) and (i < numTries):
		try:
			# move the student's code to a valid file.
			shutil.copy(filename1,filename2)
			
			# wait for file I/O to catch up...
			if(not wait_for_access(filename2, numTries)):
				return False
				
			have_copy = True
		except PermissionError:
			print("Trying to copy "+filename1+", may be locked...")
			i += 1
			time.sleep(1)
	
	if(i == numTries):
		return False
	return True

def try_remove(filename, numTries):
	removed = False
	i = 0
	while os.path.exists(filename) and (not removed) and (i < numTries):
		try:
			os.remove(filename)
			removed = True
		except OSError:
			print("Trying to remove "+filename+", may be locked...")
			i += 1
			time.sleep(1)
	if(i == numTries):
		return False
	return True

def wait_for_access(filename, numTries):
	i = 0
	while (not os.path.exists(filename) or not os.access(filename, os.R_OK)) and i < numTries:
		print("Waiting for access to "+filename+", may be locked...")
		time.sleep(1)
		i += 1
	if(i == numTries):
		return False
	return True

# this will group all the tests together, prepare them as 
# a test suite, and run them.
def run_file(filename,wants=[]):
	
	# move the student's code to a valid file.
	if(not try_copy(filename,"student.py", 5)):
		print("Failed to copy " + filename + " to student.py.")
		quit()
		
	# import student's code, and *only* copy over the expected functions
	# for later use.
	import imp
	count = 0
	while True:
		try:
			import student
			imp.reload(student)
			break
		except ImportError as e:
			print("import error getting student.. trying again. "+os.getcwd(), os.path.exists("student.py"))
			time.sleep(0.5)
			count+=1
			if count>3:
				raise ImportError("too many attempts at importing!")
		except SyntaxError as e:
			print("SyntaxError in "+filename+":\n"+str(e))
			print("Run your file without the tester to see the details")
			return(filename+"_SYNTAX_ERROR",None, None, None)
		except NameError as e:
			print("NameError in "+filename+":\n"+str(e))
			print("Run your file without the tester to see the details")
			return((filename+"_Name_ERROR",0,1))	
		except ValueError as e:
			print("ValueError in "+filename+":\n"+str(e))
			print("Run your file without the tester to see the details")
			return(filename+"_VALUE_ERROR",0,1)
		except TypeError as e:
			print("TypeError in "+filename+":\n"+str(e))
			print("Run your file without the tester to see the details")
			return(filename+"_TYPE_ERROR",0,1)
		except ImportError as e:			
			print("ImportError in "+filename+":\n"+str(e))
			print("Run your file without the tester to see the details or try again")
			return((filename+"_IMPORT_ERROR_TRY_AGAIN	",0,1))	
		except Exception as e:
			print("Exception in loading"+filename+":\n"+str(e))
			print("Run your file without the tester to see the details")
			return(filename+str(e.__reduce__()[0]),0,1)
		#except Exception as e:
		#	print("didn't get to import student yet... " + e)
	# but we want to re-load this between student runs...
	# the imp module helps us force this reload.s
	
	import student
	imp.reload(student)
	
	# make a global for each expected definition.
	def decoy(name):
		return (lambda x: "<no '%s' definition found>" % name)
		
	for fn in REQUIRED_DEFNS:
		globals()[fn] = decoy(fn)
		try:
			globals()[fn] = getattr(student,fn)
		except:
			print("\nNO DEFINITION FOR '%s'." % fn)	
	
	# create an object that can run tests.
	runner1 = unittest.TextTestRunner()
	
	# define the suite of tests that should be run.
	suite1 = TheTestSuite(wants)
	
	# let the runner run the suite of tests.
	ans = runner1.run(suite1)
	num_errors   = len(ans.__dict__['errors'])
	num_failures = len(ans.__dict__['failures'])
	num_tests    = ans.__dict__['testsRun']
	num_passed   = num_tests - num_errors - num_failures
	# print(ans)
	
	
	if BATCH_MODE:
		# do the same for the extra credit.
		runnerEC = unittest.TextTestRunner()
		suiteEC = TheExtraCreditTestSuite(wants)
		ansEC = runnerEC.run(suiteEC)
		num_errorsEC   = len(ansEC.__dict__['errors'])
		num_failuresEC = len(ansEC.__dict__['failures'])
		num_testsEC    = ansEC.__dict__['testsRun']
		num_passedEC   = num_testsEC - num_errorsEC - num_failuresEC
		print(ansEC)
	else:
		num_passedEC = 0
	
	# remove our temporary file.
	os.remove("student.py")
	if os.path.exists("__pycache__"):
		shutil.rmtree("__pycache__")
	if(not try_remove("student.py", 5)):
		print("Failed to copy " + filename + " to student.py.")
	
	tag = ".".join(filename.split(".")[:-1])
	return (tag, num_passed, num_tests,num_passedEC)

# this determines if we were imported (not __main__) or not;
# when we are the one file being run, perform the tests! :)
if __name__ == "__main__":
	main()
