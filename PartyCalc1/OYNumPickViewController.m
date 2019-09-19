//
//  OYNumPickViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 23.10.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYNumPickViewController.h"
#import "OYPlaceTableViewController.h"

@implementation OYNumPickViewController{
    NSDictionary* _paramsDict;
    NSArray* _femNumArray;
    NSArray* _malNumArray;
    NSInteger _index;
    NSInteger _index1;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"How many people at the party?";
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data"
                                                         ofType:@"plist"];
    _paramsDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _femNumArray = _paramsDict[@"numberOfFemales"];
    _malNumArray = _paramsDict[@"numberOfMales"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (component==1) {
        
        return _femNumArray.count;
    }else{
        
        return _malNumArray.count;
    }
    
}
/*- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    [self refreshAction];
    if (component == 0) {
        [self refreshAction];
        return [NSString stringWithFormat:@"%@", _malNumArray[row]];
    }else{
        [self refreshAction];
        return [NSString stringWithFormat:@"%@", _femNumArray[row]];
    }
}
*/
- (UIView *)pickerView:(UIPickerView *)thePickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view
{
    if (component == 0) {

        NSLog(@"%ld", (long)[self.numPicker selectedRowInComponent:0]);
        UILabel* label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%@", _malNumArray[row]];
        label.textColor = [UIColor whiteColor];
        [self refreshAction];
        return label;
    }else{

        UILabel* label1 = [UILabel new];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.textColor = [UIColor whiteColor];
        label1.text = [NSString stringWithFormat:@"%@", _femNumArray[row]];
        [self refreshActionFem];
        return label1;
    }
}

-(void)refreshAction{
    
    
    _index = [self.numPicker selectedRowInComponent:0];
 //   self.index = _index;
    _index1 = [self.numPicker selectedRowInComponent:1];
 //   self.index1 = _index1;
    NSString* mImage = [NSString stringWithFormat:@"%@", _malNumArray[_index]];
//    NSLog(@"%ld", (long)[self.numPicker selectedRowInComponent:0]);
    UIImage* mimage = [UIImage imageNamed:mImage];
    self.mNum.image = mimage;
    [self reloadInputViews];
}
-(void)refreshActionFem{

    NSString* fImage = [NSString stringWithFormat:@"%@f", _femNumArray[[self.numPicker selectedRowInComponent:1]]];
    UIImage* fimage = [UIImage imageNamed:fImage];
    self.fNum.image = fimage;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"go"]) {
        
    OYPlaceTableViewController* vc = segue.destinationViewController;
        NSInteger index = [self.numPicker selectedRowInComponent:0];
        NSInteger index1 = [self.numPicker selectedRowInComponent:1];
    //    NSLog(@"index1 = %ld", [self.numPicker selectedRowInComponent:1]);
    vc.volume = self.volume;
    vc.gender = self.gender;
    vc.weight = self.weight;
    vc.kindOfDrink = self.kindOfDrink;
    vc.moodIndexOfDrink = self.moodIndexOfDrink;
    vc.food = self.food;
    vc.mood = self.mood;
    vc.femNum = _femNumArray[index1];
    vc.malNum = _malNumArray[index];
    vc.comingDrinks = self.comingDrinks;
    vc.comingVolumes = self.comingVolumes;
    }
}


@end
