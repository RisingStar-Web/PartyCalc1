//
//  OYMoodCalc.h
//  PartyCalc1
//
//  Created by Ярослав on 09.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OYMoodCalc : NSObject
@property NSInteger gender;
@property NSInteger drinkMood;
@property NSInteger startMood;
@property NSInteger numberWom;
@property NSInteger numberMen;
@property NSInteger place;
@property NSInteger business;
-(NSInteger)calcMoodIndex;
@end
