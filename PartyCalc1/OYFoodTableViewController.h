//
//  OYFoodTableViewController.h
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OYFoodTableViewController : UITableViewController
@property NSNumber* gender;
@property NSNumber* weight;
@property NSNumber* kindOfDrink;
@property NSNumber* moodIndexOfDrink;
@property NSNumber* volume;
@property NSArray* comingDrinks;
@property NSArray* comingVolumes;
@end
