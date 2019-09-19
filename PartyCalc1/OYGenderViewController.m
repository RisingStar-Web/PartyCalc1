//
//  OYGenderViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 11.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYGenderViewController.h"
#import "OYWeightViewController.h"
@interface OYGenderViewController ()

@end

@implementation OYGenderViewController{
    NSDictionary* _parametersDictionary;
    NSArray* _genderArray;
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
    _parametersDictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    _genderArray = _parametersDictionary[@"gender"];
    return _genderArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = _genderArray[indexPath.row][@"title"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:_genderArray[indexPath.row][@"image"]];
    
    
    return cell;
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"go"]) {
        OYWeightViewController* vc = segue.destinationViewController;
        NSInteger index = self.tableView.indexPathForSelectedRow.row;

        vc.gender = _genderArray[index][@"index"];

    }
}


@end
