//
//  OYWeightViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 11.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYWeightViewController.h"
#import "OYDrinksTableViewController.h"
@interface OYWeightViewController ()

@end

@implementation OYWeightViewController{
    NSDictionary* _parameterArray;
    NSArray* _weightArray;
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
    _parameterArray = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _weightArray = _parameterArray[@"weight"][0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _weightArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float i = [_weightArray[indexPath.row][@"weight"] doubleValue];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString* weightString = [NSString new];
    [NSLocaleUsesMetricSystem boolValue];
    if ([NSLocaleUsesMetricSystem boolValue] == 1) {
        weightString = [NSString stringWithFormat:@"%.f lbs", i*2.2];
    }else{
        weightString = [NSString stringWithFormat:@"%.f kg", i];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
   // NSLog(@"%f", self.gender.doubleValue);
    cell.textLabel.text = weightString;
    if (self.gender.doubleValue == 0.68) {
        cell.imageView.image = [UIImage imageNamed:_weightArray[indexPath.row][@"image"]];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"weightoffem"];
    }
    return cell;
}




// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"go"]) {
        OYDrinksTableViewController* vc = segue.destinationViewController;
        NSInteger index = self.tableView.indexPathForSelectedRow.row;
        
        vc.gender = self.gender;
        vc.weight = _weightArray[index][@"weight"];
}



}
@end