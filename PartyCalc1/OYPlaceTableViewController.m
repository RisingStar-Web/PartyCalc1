//
//  OYPlaceTableViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYPlaceTableViewController.h"
#import "OYEntertainmentTableViewController.h"

@interface OYPlaceTableViewController ()

@end

@implementation OYPlaceTableViewController{
    NSDictionary* _paramsDict;
    NSArray* _placeArray;
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
    NSLog(@"$$$$ %@", self.femNum);
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data"
                                                         ofType:@"plist"];
    _paramsDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _placeArray = _paramsDict[@"place"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _placeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _placeArray[indexPath.row][@"title"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:_placeArray[indexPath.row][@"image"]];
    
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OYEntertainmentTableViewController* vc = segue.destinationViewController;
    NSInteger index = self.tableView.indexPathForSelectedRow.row;
    vc.volume = self.volume;
    vc.gender = self.gender;
    vc.weight = self.weight;
    vc.kindOfDrink = self.kindOfDrink;
    vc.moodIndexOfDrink = self.moodIndexOfDrink;
    vc.food = self.food;
    vc.mood = self.mood;
    vc.femNum = self.femNum;
    vc.malNum = self.malNum;
    vc.place = _placeArray[index][@"k"];
    vc.comingDrinks = self.comingDrinks;
    vc.comingVolumes = self.comingVolumes;
}


@end
