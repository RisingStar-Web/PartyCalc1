//
//  OYFoodTableViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYFoodTableViewController.h"
#import "OYMoodTableViewController.h"
@interface OYFoodTableViewController ()

@end

@implementation OYFoodTableViewController{
    NSDictionary* _paramsDict;
    NSArray* _foodArray;
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
    _foodArray = _paramsDict[@"food"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _foodArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString* title = _foodArray[indexPath.row][@"title"];
    cell.textLabel.text = title;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:_foodArray[indexPath.row][@"image"]];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OYMoodTableViewController* vc = segue.destinationViewController;
    NSInteger index = self.tableView.indexPathForSelectedRow.row;
    vc.volume = self.volume;
    vc.gender = self.gender;
    vc.weight = self.weight;
    vc.kindOfDrink = self.kindOfDrink;
    vc.moodIndexOfDrink = self.moodIndexOfDrink;
    vc.food = _foodArray[index][@"k"];
    vc.comingDrinks = self.comingDrinks;
    vc.comingVolumes = self.comingVolumes;
}


@end
