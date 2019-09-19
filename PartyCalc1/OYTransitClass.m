//
//  OYTransitClass.m
//  PartyCalc1
//
//  Created by Ярослав on 08.10.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYTransitClass.h"

@implementation OYTransitClass
+(OYTransitClass*)sharedManager{
    static OYTransitClass* _manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [OYTransitClass new];
    });
    return _manager;
}

@end
