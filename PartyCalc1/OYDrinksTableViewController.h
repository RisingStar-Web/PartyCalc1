//
//  OYDrinksTableViewController.h
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OYDrinkPickerViewController.h"
@interface OYDrinksTableViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addButtonTitle;

@property NSNumber* gender;
@property NSNumber* weight;
@property NSMutableArray* drinks;
@property NSNumber* volume;
@property NSMutableArray* comingDrinks;
@property NSMutableArray* comingVolumes;
@property NSInteger flag;
@property NSArray* dataSource;
@property NSInteger index;
@property NSInteger index1;

@end
