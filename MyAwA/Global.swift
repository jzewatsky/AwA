//
//  Global.swift
//  MyAwA
//
//  Created by Athletes with Autism on 7/31/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import Foundation

class Main {
    var storyText = NSArray()
    var storyImage = NSArray()
    var saveName = NSString()
    var tempImages2 = Array<NSString>()
    var movies = NSArray()
    var movieTitles = NSArray()
    var movieDictonary = Dictionary<String,Array<String>>()
    var fromMovie = Bool()
    var createStory = Bool()
    var globaltimer = Float()
    var globaltimerplay = Bool()
    var globalTimerStartValue = Float()
    init(storyText:NSArray, storyImage:NSArray, tempImages2:Array<NSString>, movies:NSArray, movieTitles:NSArray, movieDictonary:Dictionary<String,Array<String>>, saveName:NSString, fromMovie:Bool, createStory:Bool, globaltimer:Float, globaltimerplay:Bool, globalTimerStartValue:Float) {
        self.storyText = storyText
        self.storyImage = storyImage
        self.saveName = saveName
        self.tempImages2 = tempImages2
        self.movies = movies
        self.movieTitles = movieTitles
        self.movieDictonary = movieDictonary
        self.fromMovie = fromMovie
        self.createStory = createStory
        self.globaltimer = globaltimer
        self.globaltimerplay = globaltimerplay
        self.globalTimerStartValue = globalTimerStartValue
        
    }
}
var mainGlobalArray = Main(storyText: [], storyImage: [], tempImages2: [], movies: [], movieTitles: [], movieDictonary: [:], saveName:"", fromMovie: false, createStory: false, globaltimer: 0, globaltimerplay: false, globalTimerStartValue: 0)