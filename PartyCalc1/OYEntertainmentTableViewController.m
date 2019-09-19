//
//  OYEntertainmentTableViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYEntertainmentTableViewController.h"
#import "OYResaultViewController.h"

@interface OYEntertainmentTableViewController ()

@end

@implementation OYEntertainmentTableViewController{
    NSDictionary* _paramsDict;
    NSArray* _enterArray;
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
    NSLog(@"chicks %@", self.femNum);
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data"
                                                         ofType:@"plist"];
    _paramsDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _enterArray = _paramsDict[@"entertainment"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return _enterArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _enterArray[indexPath.row][@"title"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:_enterArray[indexPath.row][@"image"]];
    
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OYResaultViewController* vc = segue.destinationViewController;
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
    vc.place = self.place;
    vc.entertainment = _enterArray[index][@"k"];
    vc.comingDrinks = self.comingDrinks;
    vc.comingVolumes = self.comingVolumes;

}


@end
