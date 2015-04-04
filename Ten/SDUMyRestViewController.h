//
//  SDUMyRestViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 17/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDUMyRestModel.h"
#import "SDUSearchRestModel.h"

@interface SDUMyRestViewController : UITableViewController<SDUMyRestModelProtocol, SDUSearchRestModelProtocol, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *restaurants;
@property (nonatomic, strong) IBOutlet UITableView *listView;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end
