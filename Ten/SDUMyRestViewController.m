//
//  SDUMyRestViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 17/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUMyRestViewController.h"
#import "SDURest.h"
#import "SDUMyRestDetailViewController.h"
#import "NSString+NSString_extended.h"
#import "SDUAddRestTableViewController.h"

@interface SDUMyRestViewController ()
{
    SDUMyRestModel *_SDUMyRestModel;
    NSArray *_feedItems;
    SDUSearchRestModel *_SDUSearchRestModel;
    NSArray *_feedSearchItems;
    BOOL _isSearching;
}

@end

@implementation SDUMyRestViewController

@synthesize restaurants = _restaurants;
@synthesize listView = _listView;

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _isSearching = false;
    //[self.tableView reloadData];
    
    self.restaurants = [[NSMutableArray alloc]init];
    _feedItems = [[NSArray alloc]init];
    _feedSearchItems = [[NSArray alloc] init];

    _SDUMyRestModel = [[SDUMyRestModel alloc]init];
    _SDUSearchRestModel = [[SDUSearchRestModel alloc]init];
    
    _SDUMyRestModel.delegate = self;
    _SDUSearchRestModel.delegate = self;
    
    [_SDUMyRestModel downloadMyRestaurants];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)restDownloaded:(NSArray *)items
{
    _feedItems = items;
    self.restaurants = NULL;
    self.restaurants = [[NSMutableArray alloc]init];
    [self.restaurants addObjectsFromArray:_feedItems];
    [self.listView reloadData];

}

-(void)restSearchDownloaded:(NSArray *)items
{
    _feedSearchItems = items;
    self.searchResults = nil;
    self.searchResults = [[NSMutableArray alloc] init];
    [self.searchResults addObjectsFromArray:_feedSearchItems];
    [self.listView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!_isSearching) {
        return self.restaurants.count;
    } else return self.searchResults.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_isSearching) {
            static NSString *CellIdentifier = @"RestCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            SDURest *currentRest = [self.restaurants objectAtIndex:indexPath.row];
            cell.textLabel.text = currentRest.name;
            return cell;
    } else {
    static NSString *CellIdentifier = @"AddRestCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    SDURest *currentRest = [self.searchResults objectAtIndex:indexPath.row];
    NSString *text = currentRest.name;
    cell.textLabel.text = text;
    
    return cell;
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_isSearching) {
        return YES;
    } else return NO;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_SDUMyRestModel deleteRestaurant:[self.restaurants objectAtIndex:indexPath.row]];
        [self.restaurants removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length] == 0) {
        _isSearching = false;
        self.searchResults = nil;
        self.searchResults = [[NSMutableArray alloc] init];
        [self.listView reloadData];
    }else{
        _isSearching = true;
        NSString *URLSearchText = [searchText urlEncodeUsingEncoding:NSUTF8StringEncoding];
        [_SDUSearchRestModel downloadItems:URLSearchText];
        [self.listView reloadData];
    }
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"restDetailSegue"]) {
        SDUMyRestDetailViewController *restDetailViewController = segue.destinationViewController;
        restDetailViewController.curRest = [self.restaurants objectAtIndex:self.listView.indexPathForSelectedRow.row];
        
    } else if ([segue.identifier isEqualToString:@"addRestSegue"]) {
        SDUAddRestTableViewController *addRestTableViewController = segue.destinationViewController;
        addRestTableViewController.curRest = [self.searchResults objectAtIndex:self.tableView.indexPathForSelectedRow.row];

    }
}

@end
