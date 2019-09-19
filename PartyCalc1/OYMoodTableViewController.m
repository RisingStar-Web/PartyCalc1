//
//  OYMoodTableViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYMoodTableViewController.h"
#import "OYNumPickViewController.h"
@interface OYMoodTableViewController ()

@end

@implementation OYMoodTableViewController{
    NSDictionary* _paramsDict;
    NSArray* _moodArray;
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
    _moodArray = _paramsDict[@"mood"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _moodArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString* title = _moodArray[indexPath.row][@"title"];
    cell.textLabel.text = title;
    cell.textLabel.textColor = [UIColor whiteColor];
    if ([self.gender doubleValue] == 0.68) {
        cell.imageView.image = [UIImage imageNamed:_moodArray[indexPath.row][@"image1"]];
    }else{
        cell.imageView.image = [UIImage imageNamed:_moodArray[indexPath.row][@"image"]];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OYNumPickViewController* vc = segue.destinationViewController;
    NSInteger index = self.tableView.indexPathForSelectedRow.row;
    vc.volume = self.volume;
    vc.gender = self.gender;
    vc.weight = self.weight;
    vc.kindOfDrink = self.kindOfDrink;
    vc.moodIndexOfDrink = self.moodIndexOfDrink;
    vc.food = self.food;
    vc.mood = _moodArray[index][@"k"];
    vc.comingDrinks = self.comingDrinks;
    vc.comingVolumes = self.comingVolumes;
}


@end
