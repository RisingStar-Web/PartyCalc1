//
//  OYNumberOfFemTableViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYNumberOfFemTableViewController.h"
#import "OYPlaceTableViewController.h"
@interface OYNumberOfFemTableViewController ()

@end

@implementation OYNumberOfFemTableViewController{
    NSDictionary* _paramsDict;
    NSArray* _femNumArray;
    NSArray* _malNumArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == 0) {
        return [NSString stringWithFormat:@"%@", _malNumArray[row]];
    }else if(component == 1){
        return [NSString stringWithFormat:@"%@", _femNumArray[row]];
    }else{
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _femNumArray[indexPath.row]];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"go"]) {
        
    OYPlaceTableViewController* vc = segue.destinationViewController;
    
    NSInteger index = [self.chicksBrosPicker selectedRowInComponent:0];
    NSInteger index1 = [self.chicksBrosPicker selectedRowInComponent:1];
    
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
    NSLog(@"index1 = ");
    }
}


@end
