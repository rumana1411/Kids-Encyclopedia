//
//  Data.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 13/6/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import Foundation

class Data{
    
  //  var imgArray = ["asia.jpg","europe.jpg","aus.jpg","north.jpeg","south.jpeg","africa.jpeg","antarc.jpeg"]
   // var imgname = ["Asia","Europe","Australia","North America","South America","Africa","Antarctica"]

    class func getContinentData(){
  //class func getContinentData()-> [continentList]{
        
    //    var data = [continentList]()
        contDataArray.append(continentList(contName: "Asia", contImgName: "asia.jpg"))
        contDataArray.append(continentList(contName: "Europe", contImgName: "europe.jpg"))
        contDataArray.append(continentList(contName: "North America", contImgName: "north.jpeg"))
        contDataArray.append(continentList(contName: "South America", contImgName: "south.jpeg"))
        contDataArray.append(continentList(contName: "Africa", contImgName: "africa.jpeg"))
        contDataArray.append(continentList(contName: "Australia", contImgName: "aus.jpg"))
        contDataArray.append(continentList(contName: "Antarctica", contImgName: "antarc.jpeg"))
        
    
        
        
      //  return data
        
    }
    
 //  class func parseJson()->[Country]{
    class func parseJson(){
        
        var fetchedCountryArray = [Country]()
        
       
        
            let url = "https://restcountries.eu/rest/v1/all"
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "GET"
            let configuation = URLSessionConfiguration.default
            let session = URLSession(configuration: configuation, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request){ (data, response, error) in
                
                if error != nil{
                    
                    print("Error in data")
                    
                } //if
                else{
                    
                    do{
                        
                        let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                        
                        // print(fetchedData)
                      
                        
                        for eachFetchedCountry in fetchedData{
                            
                            let eachCountry = eachFetchedCountry as! [String: Any]
                            let cntryName = eachCountry["name"] as! String
                            let cntryCapital = eachCountry["capital"] as! String
                            let cntryContinent = eachCountry["region"] as! String
                            let cntrySubregion = eachCountry["subregion"] as! String
                            var currencies = [String]()
                            currencies = eachCountry["currencies"] as! [String]
                            var languages = [String]()
                            languages = eachCountry["languages"] as! [String]
                            var cntryCode = eachCountry["alpha2Code"] as! String
                            var latlng  = [Double]()
                            latlng = eachCountry["latlng"] as! [Double]
                            
                           
                            
                            fetchedCountryArray.append(Country(country: cntryName, capital: cntryCapital, continent: cntryContinent, subregion: cntrySubregion, code: cntryCode, latlng: latlng as! [Double], languages: languages as [String], currencies: currencies as [String], isTicked:false ))
                            InfoDataArray.append(Country(country: cntryName, capital: cntryCapital, continent: cntryContinent, subregion: cntrySubregion, code: cntryCode, latlng: latlng as! [Double], languages: languages as [String], currencies: currencies as [String], isTicked:false))
                            
                          
                            
                            
                            
                        } //for
                        
                                              totalCntry = fetchedCountryArray.count
                        print("From Data \(fetchedCountryArray.count) \(InfoDataArray.count), \(totalCntry)")
                        
                                               
                        
                        
                    } //do
                    catch{
                        
                        
                    }  //catch
                }  //else
                
                
            }  //task
      //  InfoDataArray = fetchedCountryArray
     task.resume()
        
   //  return fetchedCountryArray.count
        
    
        
    }
    
    class func getGKData()-> [GKQ]{
    
        var gkData = [GKQ]()
        
        gkData.append(GKQ(quesQ: "Where does the president of the United States of America live?", ansQ: "White House", options: ["Red House","Prime House","President Palace"]))
        gkData.append(GKQ(quesQ: "What is the largest brass instrument in an orchestra?", ansQ: "Tuba", options: ["woodwinds","violin","Piano"]))
    gkData.append(GKQ(quesQ: "Which country does parmesan cheese come from?", ansQ: "Italy", options: ["India","Germany","Switzerland"]))
    gkData.append(GKQ(quesQ: "What is the name of the highest Mountain in Africa?", ansQ: "Mount Kilimanjaro", options: ["Mount Everest","Mount Baw Baw","Mount Kosciuszko"]))
    gkData.append(GKQ(quesQ: "Which colours are the five Olympic rings?", ansQ: "Red, blue, black, yellow and green",options: ["Pink, blue, white, yellow and black","Red, purple, black, violet and green","Violet, blue, pink, yellow and green"]))
    gkData.append(GKQ(quesQ: "On a standard computer keyboard, what letter is located between E and T?", ansQ: "R", options: ["Q","A","W"]))
    gkData.append(GKQ(quesQ: "How many cards are there in a pack of cards?", ansQ: "52", options: ["10","31","48"]))
        
         gkData.append(GKQ(quesQ: "Which word in this following sentence is an adjective: The friendly dog barked for most of the day?", ansQ: "Friendly",options: ["Dog","Barked","Most of the day"]))
         gkData.append(GKQ(quesQ: "Which is the only US state that starts with the letter 'P'?", ansQ: "Pennsylvania",options: ["Prince Edward Island","Perth","Panama"]))
         gkData.append(GKQ(quesQ: "What is the largest island in the Mediterranean sea?", ansQ: "Sicily",options: ["North Island","South Island","Tahiti"]))
         gkData.append(GKQ(quesQ: "What is the most popular sport throughout the world?", ansQ: "Football (soccer)", options: ["Cricket","Badminton","Basketball"]))
         gkData.append(GKQ(quesQ: "Is hot air lighter or heavier than cold air?", ansQ: "Lighter", options: ["heavier","Equal","Nothing"]))
         gkData.append(GKQ(quesQ: "How many hours are there in seven days?", ansQ: "One hundred and sixty-eight", options: ["One hundred and twenty-four","Two hundred and thirty-eight","sixty-eight"]))
         gkData.append(GKQ(quesQ: "What colour do you get if you mix blue and yellow paint together?", ansQ: "Green", options: ["Red","Purple","Violet"]))
         gkData.append(GKQ(quesQ: "In which American city is The Statue of Liberty is located?", ansQ: "New York", options: ["Florida","Los angles","Sun Francisco"]))
         gkData.append(GKQ(quesQ: "Global warming is caused by too much of which type of gas?", ansQ: "Carbon dioxide", options: ["Oxygen","Nitrogen","Helium"]))
         gkData.append(GKQ(quesQ: "How would you say hello in French?", ansQ: "Bonjour", options: ["Ciao","Hallo","salve"]))
         gkData.append(GKQ(quesQ: "Which metal makes the strongest magnets?", ansQ: "Iron", options: ["Platinum","Aluminium","Copper"]))
         gkData.append(GKQ(quesQ: "Which year did the Second World War start?", ansQ: "1939", options: ["1839","1734","1910"]))
         gkData.append(GKQ(quesQ: "What is the largest Scandinavian country?", ansQ: "Sweden", options: ["Denmark","Norway","Finland"]))
         gkData.append(GKQ(quesQ: "Which gas do plants absorb from the atmosphere?", ansQ: "Carbon Dioxide", options: ["Oxygen","Nitrogen","Helium"]))
         gkData.append(GKQ(quesQ: "How many strings does a violin have?", ansQ: "Four", options: ["Seven","Nine","Five"]))
         gkData.append(GKQ(quesQ: "How many years are there in a century?", ansQ: "One hundred", options: ["Ten","Fifty","Twelve"]))
         gkData.append(GKQ(quesQ: "Which continent is India in?", ansQ: "Asia", options: ["Europe","Australia","Africa"]))
         gkData.append(GKQ(quesQ: "How many zeros are there in one hundred thousand?", ansQ: "Five", options: ["Seven","Three","Ten"]))
         gkData.append(GKQ(quesQ: "In the fairytale of Cinderella, what does Cinderella leave behind at the ball?", ansQ: "A glass slipper", options: ["Flower","Ear ring","A pet"]))
         gkData.append(GKQ(quesQ: "Which continent is the Sahara Desert located on?", ansQ: "Africa", options: ["Asia","Europe","Australia"]))
         gkData.append(GKQ(quesQ: "Parrots, pelicans and cuckoos are all types of what?", ansQ: "Birds", options: ["Songs","Books","Flowers"]))
         gkData.append(GKQ(quesQ: "What two colours make up the flag of Spain?", ansQ: "Red and yellow", options: ["White and red","Black and Green","Red and Green"]))
         gkData.append(GKQ(quesQ: "How much change would you have from £2 if you bought two stamps at 60c each?", ansQ: "80c", options: ["70c","50c","30c"]))
         gkData.append(GKQ(quesQ: "What does a semicolon look like?", ansQ: ";", options: [",",":","."]))
         gkData.append(GKQ(quesQ: "Which Disney character has a nose that grows longer every time he tells a lie?", ansQ: "Pinocchio", options: ["Pricess Aurora","Winnie the Pooh","Pluto"]))
         gkData.append(GKQ(quesQ: "How many hours are there in two days?", ansQ: "48", options: ["36","24","72"]))
         gkData.append(GKQ(quesQ: "Which of the following is not a reptile?", ansQ: "Spider", options: ["Turtle","Lizard","Snake"]))
         gkData.append(GKQ(quesQ: "What country is the River Thames in?", ansQ: "England", options: ["Denmark","Ireland","Canada"]))
         gkData.append(GKQ(quesQ: "Can you unscramble this word to find the name of a superhero: MATNAB?", ansQ: "Batman", options: ["Bamtan","Nambat","Nabtam"]))
         gkData.append(GKQ(quesQ: "Trout, barracuda and carp are all types of what?", ansQ: "Fish", options: ["Rivers","Lakes","Fruits"]))
         gkData.append(GKQ(quesQ: "Which way is anti-clockwise?", ansQ: "Left", options: ["Right","East","West"]))
         gkData.append(GKQ(quesQ: "How many days are there in May?", ansQ: "31", options: ["29","30","28"]))
        
         gkData.append(GKQ(quesQ: "What number must be added to 67 to make 114?", ansQ: "47", options: ["37","27","57"]))
         gkData.append(GKQ(quesQ: "Which country is Berlin the capital of?", ansQ: "Germany", options: ["Belgium","Italy","France"]))
         gkData.append(GKQ(quesQ: "25% is same as?", ansQ: "1/4", options: ["3/4","1/2","1/5"]))
         gkData.append(GKQ(quesQ: "Which is the smallest desert in the world?", ansQ: "Carcross Desert", options: ["Sahara Desert","Arabian Desert","Patagonian Desert"]))
         gkData.append(GKQ(quesQ: "How many consonants are there in the English alphabet?", ansQ: "21", options: ["31","20","22"]))
         gkData.append(GKQ(quesQ: "How many millimeters are there in 1cm?", ansQ: "10 mm", options: ["100 mm","1000 mm","1 mm"]))
         gkData.append(GKQ(quesQ: "What is the largest rainforest in the world?", ansQ: "The Amazon", options: ["Daintree","Alaska","Cloud"]))
         gkData.append(GKQ(quesQ: "Which of the following materials is a type of metal?", ansQ: "Gold", options: ["Glass","Resin","Plastic"]))
         gkData.append(GKQ(quesQ: "Which is the largest city of Australia?", ansQ: "Sydney", options: ["Canberra","Melbourne","Brisbane"]))
         gkData.append(GKQ(quesQ: "Which planet is known as the Red Planet?", ansQ: "Mars", options: ["Jupiter","Saturn","Neptune"]))
         gkData.append(GKQ(quesQ: "Which ocean separates North America from Europe?", ansQ: "Atlantic Ocean", options: ["Arctic Ocean","Indian Ocean","North Pacific Ocean"]))
         gkData.append(GKQ(quesQ: "In which country is Mount Everest located?", ansQ: "Nepal", options: ["India","Sri Lanka","Bhutan"]))
         gkData.append(GKQ(quesQ: "What is the name of Prince William's wife?", ansQ: "Catherine", options: ["Diana","Elizabeth","Camelia"]))
         gkData.append(GKQ(quesQ: "What is the name of a hot liquid that erupts from a volcano?", ansQ: "Lava", options: ["Lama","Fire","Lara"]))
        
        gkData.append(GKQ(quesQ: "Which of the following animals is a herbivore?", ansQ: "Giraffe", options: ["Hippo","Tiger","Lion"]))
        gkData.append(GKQ(quesQ: "In ancient history, a Pharaoh was a ruler in which country?", ansQ: "Egypt", options: ["Arab","England","Afganistan"]))
        gkData.append(GKQ(quesQ: "In which Disney movie is a boy raised by a family of wolves?", ansQ: "The Jungle Book", options: ["Arabian Nights","Cinderella","Beauty and the Beast"]))
        
        
        gkData.append(GKQ(quesQ: "What is the capital city of Russia?", ansQ: "Moscow", options: ["Kabul","Dhaka","Kazan"]))
        gkData.append(GKQ(quesQ: "What type of fruit is dried to make raisins?", ansQ: "Grapes", options: ["Black Berry","Strawberry","Peach"]))
        gkData.append(GKQ(quesQ: "How many months of the year have 31 days?", ansQ: "Seven", options: ["Three","Five","Nine"]))
        gkData.append(GKQ(quesQ: "Which is the tallest building in America?", ansQ: "One World Trade Center", options: ["Willis Tower","The Empire State","Aon Center"]))
        gkData.append(GKQ(quesQ: "The bones that make up your spine are called what?", ansQ: "Vertebrae", options: ["Ribs","Epidermis","Quadriceps"]))
        gkData.append(GKQ(quesQ: "Mona Lisa is the creation of ___ ?", ansQ: "Leonardo da Vinci", options: ["Pablo Picasso","Vincent van Gogh","Rabindra Nath Tagore"]))
        gkData.append(GKQ(quesQ: "8 O'clock in ____ the  is written as 8am?", ansQ: "evening", options: ["Morning","Night","Noon"]))
        gkData.append(GKQ(quesQ: "Where does the President of America live?", ansQ: "The White House", options: ["The Blue House","The Red House","The Green House"]))
        gkData.append(GKQ(quesQ: "In which ocean did the famous Titanic ship sink in 1912?", ansQ: "Atlantic", options: ["Pacific","Mediterranean","Arabian"]))
        gkData.append(GKQ(quesQ: "What type of animal is a ladybird?", ansQ: "Insect", options: ["Vertebrate","Arachnid","Reptile"]))
        gkData.append(GKQ(quesQ: "How many angles does a triangle have?", ansQ: "Three", options: ["Seven","Nine","Five"]))
        gkData.append(GKQ(quesQ: "What color must be added to yellow to make orange?", ansQ: "red", options: ["Green","Blue","Black"]))
        gkData.append(GKQ(quesQ: "What is the name of the substance that gives skin and hair its pigment?", ansQ: "Melanin", options: ["Epidermis","Bone","Blood"]))
        gkData.append(GKQ(quesQ: "Which continent has the largest population of people?", ansQ: "Asia", options: ["Africa","North America","Europe"]))
        gkData.append(GKQ(quesQ: "Which of these shapes has the lowest number of sides?", ansQ: "Triangle", options: ["Hexagon","Square","Octagon"]))
        
    
         gkData.append(GKQ(quesQ: "What is the smallest planet in the Solar System?", ansQ: "Mercury", options: ["Mars","Neptune","Saturn"]))
         gkData.append(GKQ(quesQ: "What is the largest planet in the Solar System?", ansQ: "Jupiter", options: ["Neptune","Mars","Jupiter"]))
         gkData.append(GKQ(quesQ: "What is the hottest planet in the Solar System?", ansQ: "Venus", options: ["Mars","Saturn","Jupiter"]))
         gkData.append(GKQ(quesQ: "What planet in the solar system is Neptune from the Sun?", ansQ: "Neptune", options: ["Mars","Saturn","Jupiter"]))
         gkData.append(GKQ(quesQ: "What is the second smallest planet in the solar system?", ansQ: "Mars", options: ["Venus","Mercury","Neptune"]))
         gkData.append(GKQ(quesQ: "What planet is closest in size to Earth?", ansQ: "Venus", options: ["Saturn","Mercury","Mars"]))
         gkData.append(GKQ(quesQ: "What planet is closest to the Sun?", ansQ: "Mercury", options: ["Saturn","Neptune","Mars"]))
         gkData.append(GKQ(quesQ: "Triton is the largest natural satellite of what planet", ansQ: "Neptune", options: ["Mars","Jupiter","Mercury"]))
        
        
         gkData.append(GKQ(quesQ: "What is the brightest planet in the night sky?", ansQ: "Venus", options: ["Mars","Jupiter","Mercury"]))
         gkData.append(GKQ(quesQ: "Phobos and Deimos are moons of what planet?", ansQ: "Mars", options: ["Venus","Jupiter","Mercury"]))
        gkData.append(GKQ(quesQ: "Which Planets Have Rings around Them?", ansQ: "Saturn", options: ["Mars","Jupiter","Mercury"]))
        gkData.append(GKQ(quesQ: "Who was the first woman to reach space?", ansQ: "Valentina Tereshkova, in 1963", options: ["Kalpana Chawla","Catherine Coleman","Ellen Baker"]))
        gkData.append(GKQ(quesQ: "Who was the first person to set foot on the Moon?",ansQ: "Neil Armstrong", options: ["Yuri Gagarin","Buzz Aldrin","Alan Bean"]))
        gkData.append(GKQ(quesQ: "When does a lunar eclipse occur?",ansQ: "when the Earth is between — the Sun and the Moon.", options: ["when the Moon is between — the Sun and the Earth.","the Sun is between — the Moon and the Earth.","the Mars is between — the Sun and the Earth."]))
        gkData.append(GKQ(quesQ: "Which planet has approximately the same landmass as Earth?", ansQ: "Mars", options: ["Venus","Jupiter","Mercury"]))
        gkData.append(GKQ(quesQ: "What is the fastest land animal in the world?", ansQ: "The cheetah", options: ["The tiger","The Lion","The horse"]))
        
        gkData.append(GKQ(quesQ: "How many legs does a spider have?", ansQ: "Eight", options: ["Seven","Nine","Five"]))
        gkData.append(GKQ(quesQ: "What is the tallest animal in the world?", ansQ: "The giraffe", options: ["The elephant","The cheetah","The zebra"]))
        gkData.append(GKQ(quesQ: "What is the only continent on earth where Giraffes live in the wild?", ansQ: "Africa", options: ["Australia","Asia","Europe"]))
        gkData.append(GKQ(quesQ: "The colored part of the human eye that controls how much light passes through the pupil is called the?", ansQ: "Iris", options: ["Cornea","Lens","Retina"]))
        gkData.append(GKQ(quesQ: "What substance are nails made of?", ansQ: "Keratin", options: ["Skin","Bone","Melanin"]))
        gkData.append(GKQ(quesQ: "What is the human body’s biggest organ?", ansQ: "The skin", options: ["The bone","The lungs","The heart"]))
        gkData.append(GKQ(quesQ: "The outside layer of skin on the human body is called the?", ansQ: "Epidermis", options: ["Dermis","Hypodermis","Melanin"]))
        gkData.append(GKQ(quesQ: "The shape of DNA is known as?", ansQ: "A double helix", options: ["Circular","Helical","Twisted"]))
        gkData.append(GKQ(quesQ: "An adult human body has over ___ bones.", ansQ: "500", options: ["400","380","475"]))
        
        gkData.append(GKQ(quesQ: "Earth is located in which galaxy?", ansQ: "The Milky Way Galaxy", options: ["Whirlpool Galaxy","Starburst Galaxy","Andromeda Galaxy"]))
        gkData.append(GKQ(quesQ: "What is the name of the force holding us to the Earth?", ansQ: "Gravity", options: ["Electric","Magnetic","Tension"]))
        gkData.append(GKQ(quesQ: "What is the name of the first satellite sent into space?", ansQ: "Sputnik", options: ["Jugnu","Aqua","Telstar"]))
        gkData.append(GKQ(quesQ: "What planet is famous for its big red spot on it?", ansQ: "Jupiter", options: ["Mars","Neptune","Venus"]))
        gkData.append(GKQ(quesQ: "What country experiences the most tornadoes?", ansQ: "USA", options: ["England","Canada","Indonesia"]))
        gkData.append(GKQ(quesQ: "How many bones do sharks have in their bodies?", ansQ: "0", options: ["10","29","34"]))
        gkData.append(GKQ(quesQ: "What is the name of the world’s largest reef system?", ansQ: "Great Barrier Reef", options: ["African Coral Reef","Amazon Reef","Apo Reef"]))
        gkData.append(GKQ(quesQ: "What state of the USA is the Grand Canyon located in?", ansQ: "Arizona", options: ["Florida","California","Pennsylvania"]))
        
         gkData.append(GKQ(quesQ: "How many horns did Triceratops have?", ansQ: "Three", options: ["Zero","Two","One"]))
         gkData.append(GKQ(quesQ: "A person who studies fossils and prehistoric life such as dinosaurs is known as a what?", ansQ: "Paleontologist", options: ["Anthropologist","Astronomer","Pathologist"]))
         gkData.append(GKQ(quesQ: "What is the next number in the Fibonacci sequence: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ?", ansQ: "55", options: ["57","54","65"]))
         gkData.append(GKQ(quesQ: "The perimeter of a circle is also known as what?", ansQ: "The circumference", options: ["The area","The center","The Length"]))
         gkData.append(GKQ(quesQ: "The deepest point in all of the world’s oceans is named what?", ansQ: "Mariana Trench", options: ["Challenger deep","Mariana Islands","Pacific Trench"]))
         gkData.append(GKQ(quesQ: "Ayers Rock in Australia is also know as what?", ansQ: "Uluru", options: ["Olgas","Attilla","Artilla"]))
    
    
      return gkData
    
}

    }
