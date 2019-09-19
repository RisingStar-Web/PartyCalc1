//
//  OYResaultViewController.h
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OYResaultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *tryAg;

@property NSNumber* gender;
@property NSNumber* weight;
@property NSNumber* kindOfDrink;
@property NSNumber* moodIndexOfDrink;
@property NSNumber* volume;
@property NSNumber* food;
@property NSNumber* mood;
@property NSNumber* femNum;
@property NSNumber* malNum;
@property NSNumber* place;
@property NSNumber* entertainment;
@property NSArray* comingDrinks;
@property NSArray* comingVolumes;
@property (weak, nonatomic) IBOutlet UIImageView *resaultImage;
@property (weak, nonatomic) IBOutlet UILabel *resaultText;
-(NSInteger)calcMoodIndex;
- (IBAction)postFacebook:(id)sender;
-(NSInteger)calcAlcoIndex;
@end
