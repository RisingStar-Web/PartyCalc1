//
//  OYAlcoCalc.m
//  PartyCalc1
//
//  Created by Ярослав on 09.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYAlcoCalc.h"

@implementation OYAlcoCalc{
    NSInteger _alcoIndex;
}
-(NSInteger)calcAlcoIndex{
    _alcoIndex = (self.volume*self.kindOfDrink/(self.weight*self.gender))*self.food;
    return _alcoIndex;
}
@end
