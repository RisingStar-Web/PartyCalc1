//
//  OYNumberOfFemTableViewController.h
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OYNumberOfFemTableViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *chicksBrosPicker;
@property NSNumber* gender;
@property NSNumber* weight;
@property NSNumber* kindOfDrink;
@property NSNumber* moodIndexOfDrink;
@property NSNumber* volume;
@property NSNumber* food;
@property NSNumber* mood;
@property NSArray* comingDrinks;
@property NSArray* comingVolumes;
@end
