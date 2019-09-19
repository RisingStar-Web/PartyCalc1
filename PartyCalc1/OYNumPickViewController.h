//
//  OYNumPickViewController.h
//  PartyCalc1
//
//  Created by Ярослав on 23.10.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OYNumPickViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *numPicker;
@property (weak, nonatomic) IBOutlet UIImageView *mNum;
@property (weak, nonatomic) IBOutlet UIImageView *fNum;
@property NSNumber* gender;
@property NSNumber* weight;
@property NSNumber* kindOfDrink;
@property NSNumber* moodIndexOfDrink;
@property NSNumber* volume;
@property NSNumber* food;
@property NSNumber* mood;
@property NSArray* comingDrinks;
@property NSArray* comingVolumes;
@property NSInteger index;
@property NSInteger index1;
-(void)refreshAction;
-(void)refreshActionFem;
@end
