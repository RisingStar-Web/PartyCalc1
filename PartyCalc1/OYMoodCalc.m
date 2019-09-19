//
//  OYMoodCalc.m
//  PartyCalc1
//
//  Created by Ярослав on 09.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYMoodCalc.h"


@implementation OYMoodCalc{
    NSInteger _moodIndex;
}
-(NSInteger)calcMoodIndex{
    
    if (self.gender == 0,68){
        if (self.numberWom <= self.numberMen) {
            _moodIndex = self.drinkMood+self.startMood+self.place+self.business;
        }else{
            _moodIndex = self.drinkMood+self.startMood+self.place+self.business + ((self.numberWom/self.numberMen)/10);
        }
    }else{
        if (self.numberMen <= self.numberWom) {
            _moodIndex = self.drinkMood+self.startMood+self.place+self.business;
        }else{
            _moodIndex = self.drinkMood+self.startMood+self.place+self.business + ((self.numberMen/self.numberWom)/10);
        }
    }
    return _moodIndex;
}


@end
