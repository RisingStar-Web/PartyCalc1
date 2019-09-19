//
//  PickerProtocol.h
//  PartyCalc1
//
//  Created by Ярослав on 08.10.14.
//  Copyright (c) 2014 Orekhov Yar. All rights reserved.
//

#ifndef PartyCalc1_PickerProtocol_h
#define PartyCalc1_PickerProtocol_h
#import "ParentProtocol.h"
@protocol StaticTableParentProtocol <NSObject>

@optional

//-----------------------------------------------------------------------------------------------------------

- (void) tableView: (UITableView *) tableView
         didSelect: (BOOL) select
   cellAtIndexPath: (NSIndexPath *)indexPath
 inViewController : (UIViewController <StaticTableViewControllerProtocol> *) viewController;

//-----------------------------------------------------------------------------------------------------------

- (void) tableView: (UITableView *) tableView
     clickedButton: (UIButton *) button
       atIndexPath: (NSIndexPath *) buttonIndexPath
  inViewController: (UITableViewController <StaticTableViewControllerProtocol>*) viewController;

@end
#endif
