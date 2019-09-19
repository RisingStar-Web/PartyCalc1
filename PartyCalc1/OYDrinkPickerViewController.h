//
//  OYDrinkPickerViewController.h
//  PartyCalc1
//
//  Created by Ярослав on 07.10.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OYDrinkPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *drinkPicker;
@property (weak, nonatomic) IBOutlet UIImageView *drinkImage;
@property (weak, nonatomic) IBOutlet UIImageView *volumeImage;

-(void)refreshAction;
-(void)refreshVolAction;
@property NSInteger index;

@property NSInteger index1;
@property NSMutableArray* comingDrinks;
@property NSMutableArray* comingVolumes;

@end
