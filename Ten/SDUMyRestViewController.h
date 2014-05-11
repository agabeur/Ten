//
//  SDUMyRestViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 17/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDUMyRestViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *restaurants;
@property (nonatomic, strong) IBOutlet UITableView *listView;

@end
