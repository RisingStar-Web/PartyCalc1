//
//  OYDrinkPickerViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 07.10.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYDrinkPickerViewController.h"
#import "OYDrinksTableViewController.h"
#import "OYTransitClass.h"
@interface OYDrinkPickerViewController ()

@end

@implementation OYDrinkPickerViewController{
    NSDictionary* _paramsDict;
    NSArray* _kindArray;
    NSArray* _volumesArray;
    NSInteger _index;
    NSInteger _index1;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data"
                                                         ofType:@"plist"];
    _paramsDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _kindArray = _paramsDict[@"drinks"];
    _volumesArray = _paramsDict[@"volume"];
    self.comingDrinks = [NSMutableArray new];
    self.comingVolumes = [NSMutableArray new];
//    NSLog(@"%@",)
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
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
    if (component==0) {
       // NSLog(@"%lu", (unsigned long)_kindArray.count);
        return _kindArray.count;
    }else{
        return _volumesArray.count;
    }
    
}
/*- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
//    CGRect rowFrame = CGRectMake(00.0f, 0.0f, [pickerView viewForRow:row forComponent:component].frame.size.width, [pickerView viewForRow:row forComponent:component].frame.size.height);
    UILabel *label = [UILabel new];
  //  label.font = [UIFont boldSystemFontOfSize:18.0f];
    
    // This is an array I pass to the picker in prepareForSegue:sender:
    label.text = _kindArray[row][@"title"];

    
        
        // self.lightColors is an array I instantiate in viewDidLoad: self.lightColors = @[ [UIColor yellowColor], [UIColor greenColor], [UIColor whiteColor] ];
        label.textColor = [UIColor whiteColor];

    
    return label;
}*/
/*
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == 0) {
        [self refreshAction];

        return _kindArray[row][@"title"];
    }else{
        if ([NSLocaleUsesMetricSystem boolValue] != 1) {
            [self refreshAction];
            return [NSString stringWithFormat:@"%@ ml", _volumesArray[row]];
        }else{
            [self refreshAction];
            return [NSString stringWithFormat:@"%.f oz.", ([_volumesArray[row] doubleValue])/30];
        }
    }
}
*/
- (UIView *)pickerView:(UIPickerView *)thePickerView
             viewForRow:(NSInteger)row
            forComponent:(NSInteger)component
           reusingView:(UIView *)view
{
    if (component == 0) {
        [self refreshAction];
        UILabel* label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = _kindArray[row][@"title"];
        label.textColor = [UIColor whiteColor];
        return label;
    }else{
        if ([NSLocaleUsesMetricSystem boolValue] != 1) {
            [self refreshAction];
            [self refreshVolAction];
            UILabel* label1 = [UILabel new];
            label1.textAlignment = NSTextAlignmentCenter;
            label1.textColor = [UIColor whiteColor];
            label1.text = [NSString stringWithFormat:@"%@ ml", _volumesArray[row][@"vol"]];
            return label1;
        }else{
            [self refreshAction];
            [self refreshVolAction];
            UILabel* label1 = [UILabel new];
            label1.textAlignment = NSTextAlignmentCenter;
            label1.textColor = [UIColor whiteColor];
            label1.text = [NSString stringWithFormat:@"%.f oz.", ([_volumesArray[row][@"vol"] doubleValue])/30];
            return label1;
        }
    }
}

-(void)refreshAction{
    _index = [self.drinkPicker selectedRowInComponent:0];
    self.index = _index;
    _index1 = [self.drinkPicker selectedRowInComponent:1];
    self.index1 = _index1;
    UIImage* drinkImage = [UIImage imageNamed:_kindArray[_index][@"image"]];
    self.drinkImage.image = drinkImage;
    [OYTransitClass sharedManager].index = _index;
    [OYTransitClass sharedManager].index1 = _index1;
    
}
-(void)refreshVolAction{
    _index = [self.drinkPicker selectedRowInComponent:0];
    self.index = _index;
    _index1 = [self.drinkPicker selectedRowInComponent:1];
    self.index1 = _index1;
    UIImage* volImage = [UIImage imageNamed:_volumesArray[_index1][@"image"]];
    self.volumeImage.image = volImage;
    [OYTransitClass sharedManager].index = _index;
    [OYTransitClass sharedManager].index1 = _index1;
    
}







@end
