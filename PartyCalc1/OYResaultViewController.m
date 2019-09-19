//
//  OYResaultViewController.m
//  PartyCalc1
//
//  Created by Ярослав on 12.08.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#import "OYResaultViewController.h"
#import <Social/Social.h>
@interface OYResaultViewController ()

@end

@implementation OYResaultViewController{
    NSDictionary* _paramsDict;
    NSArray* _resArray;
    NSString* _resText;
    NSInteger _alcoIndex;
    NSInteger _moodIndex;
    NSNumber* _femNum;
    NSNumber* _malNum;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _femNum = self.femNum;
    _malNum = self.malNum;
    
    NSLog(@"%@ chicks", self.femNum);
    self.tryAg.imageView.image = [UIImage imageNamed:@"tryanother"];
    if (self.femNum.doubleValue == 0) {
        self.femNum = @0.99;
    }
    if (self.malNum.doubleValue == 0) {
        self.malNum = @0.99;
    }
 //   NSLog(@"%@", self.femNum);
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    _paramsDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    if ((self.gender.doubleValue > 0.6)&&(self.femNum>0)) {
        _resArray = _paramsDict[@"resault"];
    }else if ((self.gender.doubleValue > 0.6)&&(self.femNum==0)){
       _resArray = _paramsDict[@"resault2"];
    }else if ((self.gender.doubleValue < 0.6)&&(self.malNum>0)){
       _resArray = _paramsDict[@"resault3"];
    }else if ((self.gender.doubleValue < 0.6)&&(self.malNum==0)){
        _resArray = _paramsDict[@"resault4"];
    }
    
    _resText = _resArray[self.calcAlcoIndex+1][self.calcMoodIndex-1][@"title"];
    self.resaultText.text = _resText;
    self.resaultImage.image = [UIImage imageNamed:_resArray[self.calcAlcoIndex+1][self.calcMoodIndex-1][@"image"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)calcMoodIndex{
    int i;
    double k=0, z=0;
    for (i=0; i<self.comingDrinks.count; i++) {
        k = k+[self.comingDrinks[i][@"vol"] doubleValue]*[self.comingVolumes[i][@"vol"] doubleValue];
    }
    for (i=0; i<self.comingDrinks.count; i++) {
        z=z+[self.comingVolumes[i][@"vol"] doubleValue];
    }
    k = k/z;
    if (self.comingDrinks.count == 0) {
        k=0;
    }
    if ([self.gender doubleValue] == 0.68){
        if ([self.femNum doubleValue] <= [self.malNum doubleValue]) {
            _moodIndex = k+[self.mood doubleValue]+[self.place doubleValue]+[self.entertainment doubleValue];
        }else{
            _moodIndex = k+[self.mood doubleValue]+[self.place doubleValue]+[self.entertainment doubleValue] + (([self.femNum doubleValue]/[self.malNum doubleValue])/10);
        }
    }else{
        if ([self.malNum doubleValue] <= [self.femNum doubleValue]) {
            _moodIndex = k+[self.mood doubleValue]+[self.place doubleValue]+[self.entertainment doubleValue];
        }else{
            _moodIndex = k+[self.mood doubleValue]+[self.place doubleValue]+[self.entertainment doubleValue] + (([self.malNum doubleValue]/[self.femNum doubleValue])/10);
        }
    }
    _moodIndex = _moodIndex*1.2;
    if (_moodIndex<1) {
        _moodIndex = 1;
    }
    if (_moodIndex>7) {
        _moodIndex = 7;
    }
  //  NSLog(@"mood %ld", (long)_moodIndex);
    
    return _moodIndex;

}

- (IBAction)postFacebook:(id)sender {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        //Retina display
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(self.view.bounds.size);
    }
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   // if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        SLComposeViewController *facebookPost= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    NSString* drinksString = [NSString new];
    NSString* peopleString = [NSString new];
    NSLog(@"chicks! %@", _femNum);
    if ([NSLocaleUsesMetricSystem boolValue] != 1) {
        
    if (self.comingDrinks.count == 1) {
        drinksString = [NSString stringWithFormat:@"%@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"]];
    }else if (self.comingDrinks.count == 2){
        drinksString = [NSString stringWithFormat:@"%@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"]];
    }else if (self.comingDrinks.count == 3){
        drinksString = [NSString stringWithFormat:@"%@ml of %@, %@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"], self.comingVolumes[2][@"vol"], self.comingDrinks[2][@"title"]];
    }else if (self.comingDrinks.count == 4){
        drinksString = [NSString stringWithFormat:@"%@ml of %@, %@ml of %@, %@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"], self.comingVolumes[2][@"vol"], self.comingDrinks[2][@"title"], self.comingVolumes[3][@"vol"], self.comingDrinks[3][@"title"]];
    }else if (self.comingDrinks.count == 5){
        drinksString = [NSString stringWithFormat:@"%@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"], self.comingVolumes[2][@"vol"], self.comingDrinks[2][@"title"], self.comingVolumes[3][@"vol"], self.comingDrinks[3][@"title"], self.comingVolumes[4][@"vol"], self.comingDrinks[4][@"title"]];
    }else if (self.comingDrinks.count == 6){
        drinksString = [NSString stringWithFormat:@"%@ml of %@, %@ml of %@,%@ml of %@, %@ml of %@, %@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"], self.comingVolumes[2][@"vol"], self.comingDrinks[2][@"title"], self.comingVolumes[3][@"vol"], self.comingDrinks[3][@"title"], self.comingVolumes[4][@"vol"], self.comingDrinks[4][@"title"], self.comingVolumes[5][@"vol"], self.comingDrinks[5][@"title"]];
    }else if (self.comingDrinks.count == 7){
        drinksString = [NSString stringWithFormat:@"%@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"], self.comingVolumes[2][@"vol"], self.comingDrinks[2][@"title"], self.comingVolumes[3][@"vol"], self.comingDrinks[3][@"title"], self.comingVolumes[4][@"vol"], self.comingDrinks[4][@"title"], self.comingVolumes[5][@"vol"], self.comingDrinks[5][@"title"], self.comingVolumes[6][@"vol"], self.comingDrinks[6][@"title"]];
    }else if (self.comingDrinks.count == 8){
        drinksString = [NSString stringWithFormat:@"%@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"], self.comingVolumes[2][@"vol"], self.comingDrinks[2][@"title"], self.comingVolumes[3][@"vol"], self.comingDrinks[3][@"title"], self.comingVolumes[4][@"vol"], self.comingDrinks[4][@"title"], self.comingVolumes[5][@"vol"], self.comingDrinks[5][@"title"], self.comingVolumes[6][@"vol"], self.comingDrinks[6][@"title"], self.comingVolumes[7][@"vol"], self.comingDrinks[7][@"title"]];
    }else if (self.comingDrinks.count == 9){
        drinksString = [NSString stringWithFormat:@"%@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@, %@ml of %@ and %@ml of %@", self.comingVolumes[0][@"vol"], self.comingDrinks[0][@"title"], self.comingVolumes[1][@"vol"], self.comingDrinks[1][@"title"], self.comingVolumes[2][@"vol"], self.comingDrinks[2][@"title"], self.comingVolumes[3][@"vol"], self.comingDrinks[3][@"title"], self.comingVolumes[4][@"vol"], self.comingDrinks[4][@"title"], self.comingVolumes[5][@"vol"], self.comingDrinks[5][@"title"], self.comingVolumes[6][@"vol"], self.comingDrinks[6][@"title"], self.comingVolumes[7][@"vol"], self.comingDrinks[7][@"title"], self.comingVolumes[8][@"vol"], self.comingDrinks[8][@"title"]];
    }
    }else{
        
        if (self.comingDrinks.count == 1) {
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"]];
        }else if (self.comingDrinks.count == 2){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"]];
        }else if (self.comingDrinks.count == 3){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@, %.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"], [self.comingVolumes[2][@"vol"] doubleValue]/30, self.comingDrinks[2][@"title"]];
        }else if (self.comingDrinks.count == 4){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@, %.f oz. of %@, %.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"], [self.comingVolumes[2][@"vol"] doubleValue]/30, self.comingDrinks[2][@"title"], [self.comingVolumes[3][@"vol"] doubleValue]/30, self.comingDrinks[3][@"title"]];
        }else if (self.comingDrinks.count == 5){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"], [self.comingVolumes[2][@"vol"] doubleValue]/30, self.comingDrinks[2][@"title"], [self.comingVolumes[3][@"vol"] doubleValue]/30, self.comingDrinks[3][@"title"], [self.comingVolumes[4][@"vol"] doubleValue]/30, self.comingDrinks[4][@"title"]];
        }else if (self.comingDrinks.count == 6){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"], [self.comingVolumes[2][@"vol"] doubleValue]/30, self.comingDrinks[2][@"title"], [self.comingVolumes[3][@"vol"] doubleValue]/30, self.comingDrinks[3][@"title"], [self.comingVolumes[4][@"vol"] doubleValue]/30, self.comingDrinks[4][@"title"], [self.comingVolumes[5][@"vol"] doubleValue]/30, self.comingDrinks[5][@"title"]];
        }else if (self.comingDrinks.count == 7){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"], [self.comingVolumes[2][@"vol"] doubleValue]/30, self.comingDrinks[2][@"title"], [self.comingVolumes[3][@"vol"] doubleValue]/30, self.comingDrinks[3][@"title"], [self.comingVolumes[4][@"vol"] doubleValue]/30, self.comingDrinks[4][@"title"], [self.comingVolumes[5][@"vol"] doubleValue]/30, self.comingDrinks[5][@"title"], [self.comingVolumes[6][@"vol"] doubleValue]/30, self.comingDrinks[6][@"title"]];
        }else if (self.comingDrinks.count == 8){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"], [self.comingVolumes[2][@"vol"] doubleValue]/30, self.comingDrinks[2][@"title"], [self.comingVolumes[3][@"vol"] doubleValue]/30, self.comingDrinks[3][@"title"], [self.comingVolumes[4][@"vol"] doubleValue]/30, self.comingDrinks[4][@"title"], [self.comingVolumes[5][@"vol"] doubleValue]/30, self.comingDrinks[5][@"title"], [self.comingVolumes[6][@"vol"] doubleValue]/30, self.comingDrinks[6][@"title"], [self.comingVolumes[7][@"vol"] doubleValue]/30, self.comingDrinks[7][@"title"]];
        }else if (self.comingDrinks.count == 9){
            drinksString = [NSString stringWithFormat:@"%.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@, %.f oz. of %@ and %.f oz. of %@", [self.comingVolumes[0][@"vol"] doubleValue]/30, self.comingDrinks[0][@"title"], [self.comingVolumes[1][@"vol"] doubleValue]/30, self.comingDrinks[1][@"title"], [self.comingVolumes[2][@"vol"] doubleValue]/30, self.comingDrinks[2][@"title"], [self.comingVolumes[3][@"vol"] doubleValue]/30, self.comingDrinks[3][@"title"], [self.comingVolumes[4][@"vol"] doubleValue]/30, self.comingDrinks[4][@"title"], [self.comingVolumes[5][@"vol"] doubleValue]/30, self.comingDrinks[5][@"title"], [self.comingVolumes[6][@"vol"] doubleValue]/30, self.comingDrinks[6][@"title"], [self.comingVolumes[7][@"vol"] doubleValue]/30, self.comingDrinks[7][@"title"], [self.comingVolumes[8][@"vol"] doubleValue]/30, self.comingDrinks[8][@"title"]];}
    }
    if ([_malNum doubleValue]<1 && [_femNum doubleValue] <1) {
        peopleString = [NSString stringWithFormat:@"alone"];
    }else if ([_malNum doubleValue]==1 &&[_femNum doubleValue]<1){
        peopleString = [NSString stringWithFormat:@"with one bro"];
    }else if ([_malNum doubleValue]<1 && [_femNum doubleValue] == 1){
        peopleString = [NSString stringWithFormat:@"with one chick"];
    }else if ([_malNum doubleValue] == 1 && [_femNum doubleValue]==1){
        peopleString = [NSString stringWithFormat:@"with one bro and one chick"];
    }else if ([_malNum doubleValue]>1 && [_femNum doubleValue]<1){
        peopleString = [NSString stringWithFormat:@"with %@ bros", _malNum];
    }else if ([_malNum doubleValue]<1 && [_femNum doubleValue]>1){
        peopleString = [NSString stringWithFormat:@"with %@ chicks", _femNum];
    }else if ([_malNum doubleValue]>1 && [_femNum doubleValue]==1){
        peopleString = [NSString stringWithFormat:@"with %@ bros and one chick", _femNum];
    }else if ([_malNum doubleValue]==1 && [_femNum doubleValue]>1){
        peopleString = [NSString stringWithFormat:@"with one bro and %@ chicks", _femNum];
    }else if ([_malNum doubleValue]>1 && [_femNum doubleValue]>1){
        peopleString = [NSString stringWithFormat:@"with %@ bros and %@ chicks", _malNum, _femNum];
    }
    NSString* postText = [NSString stringWithFormat:@"Hi all! Today I’m going for a drink %@\n I’ll be having: %@\n And most likely it’ll end this way: %@\n Don’t forget to ask if I’m OK tomorrow. \n Calculated and shared by Alconizer, your drinking companion.", peopleString, drinksString, _resText];
    [facebookPost setInitialText:postText];
    [facebookPost addImage:finalImage];
    NSURL* url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/alconizer/id934531284?l=ru&ls=1&mt=8"];
    
   //   NSURL* new = [NSURL URLWithString:@"Alconizer" relativeToURL:url];
    [facebookPost addURL:url];
  
        [self presentViewController:facebookPost animated:YES completion:nil];
    
        
    
 //   NSLog(@"tapped");
}
-(NSInteger)calcAlcoIndex{
    int i;
    float k = 0;
    for (i=0; i<self.comingDrinks.count; i++) {
        k = k + [self.comingVolumes[i][@"vol"] doubleValue]*[self.comingDrinks[i][@"vol"] doubleValue];
    }
    _alcoIndex = ((k/([self.weight doubleValue]*[self.gender doubleValue]))*[self.food doubleValue])*((self.comingDrinks.count/10)+1);
    if (_alcoIndex<1) {
        _alcoIndex = 0;
    }
    if (_alcoIndex>11) {
        _alcoIndex = 11;
    }
//  NSLog(@"alco %ld", (long)_alcoIndex);
    return _alcoIndex;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
