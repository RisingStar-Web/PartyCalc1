//
//  OYAlcoCalc.h
//  PartyCalc1
//
//  Created by Ярослав on 09.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OYAlcoCalc : NSObject
@property NSInteger gender;
@property NSInteger weight;
@property NSInteger volume;
@property NSInteger kindOfDrink;
@property NSInteger food;

-(NSInteger)calcAlcoIndex;

@end
