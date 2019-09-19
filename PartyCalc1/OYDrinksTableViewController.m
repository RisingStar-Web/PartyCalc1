//
//  OYDrinksTableViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYDrinksTableViewController.h"
#import "OYDrinkPickerViewController.h"
#import "OYFoodTableViewController.h"
#import "OYTransitClass.h"

@interface OYDrinksTableViewController ()

@end

@implementation OYDrinksTableViewController{
    NSDictionary* _paramsDict;
    NSArray* _kindArray;
    NSArray* _volumesArray;
    NSInteger _index;
    NSInteger _index1;
    OYDrinkPickerViewController* _vcd;
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
    /*UILabel* navigationLabel = [UILabel new];
    navigationLabel.text = @"What are you going to drink?";
    navigationLabel.textColor = [UIColor whiteColor];
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView.tintColor = [UIColor whiteColor];
   */

    
   NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data"
                                                        ofType:@"plist"];
    _paramsDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _kindArray = _paramsDict[@"drinks"];
    _volumesArray = _paramsDict[@"volume"];
    self.comingDrinks = [NSMutableArray new];
    self.comingVolumes = [NSMutableArray new];
    NSLog(@"bla %@", self.childViewControllers.lastObject);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.comingDrinks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
    //    NSString* drinkText = _volArray[indexPath.row][@"title"];
    if ([NSLocaleUsesMetricSystem boolValue] != 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", self.comingDrinks[indexPath.row][@"title"]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ ml", self.comingVolumes[indexPath.row][@"vol"]];
        cell.imageView.image = [UIImage imageNamed:self.comingDrinks[indexPath.row][@"image"]];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%@", self.comingDrinks[indexPath.row][@"title"]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.f oz.", ([self.comingVolumes[indexPath.row][@"vol"] doubleValue])/30];
        cell.imageView.image = [UIImage imageNamed:self.comingDrinks[indexPath.row][@"image"]];
    }
    
        return cell;

}

/*- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (component==1) {
        return _kindArray.count;
    }else{
        return _volumesArray.count;
    }
    
}*/

/*- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == 0) {
        return _kindArray[row][@"title"];
    }else{
        if ([NSLocaleUsesMetricSystem boolValue] != 1) {
            return [NSString stringWithFormat:@"%@ ml", _volumesArray[row]];
        }else{
            return [NSString stringWithFormat:@"%.f oz.", ([_volumesArray[row] doubleValue])/30];
        }
    }
}*/
/*-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    if (component == 0) {

        
        //Add subview retains view, so OK to release now
        NSString* imageName = _kindArray[row][@"image"];
        UIImage* image = [UIImage imageNamed:imageName];
        UIImageView* view = [[UIImageView alloc]initWithImage:image];
        return view;
    }else{
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 110, 60)];
        UIView *myColorView = [UIView new]; //Set desired frame
        myColorView.backgroundColor = [UIColor redColor]; //Set desired color or add a UIImageView if you want...
        
        UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_kindArray[row][@"image"]]];
        [view addSubview:myImageView];
        [view addSubview:myColorView];
        
        //Add subview retains view, so OK to release now
        
        
        return view;
    }
}*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.comingDrinks removeObjectAtIndex:indexPath.row];
        [self.comingVolumes removeObjectAtIndex:indexPath.row];
        //удаляем ячейку из табл вью с анимацией
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)doneCheck:(id)sender {
    if (self.comingDrinks.count<1) {
          UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please, add some drink" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else{
        [self performSegueWithIdentifier:@"go" sender:nil];
    }
      
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"go"]) {

        //    [self performSegueWithIdentifier:@"go" sender:nil];
            OYFoodTableViewController* vc = segue.destinationViewController;
            vc.gender = self.gender;
            vc.weight = self.weight;
            vc.comingDrinks = self.comingDrinks;
            vc.comingVolumes = self.comingVolumes;
    }
}

- (IBAction)addDrink:(id)sender {
    [self.addButtonTitle setTitle:@"Add drink" forState:UIControlStateNormal];
     _index = [OYTransitClass sharedManager].index;
    [self.comingDrinks addObject:_kindArray[_index]];
    _index1 = [OYTransitClass sharedManager].index1;
    [self.comingVolumes addObject:_volumesArray[_index1]];
    [self.tableView reloadData];
    
}




@end
