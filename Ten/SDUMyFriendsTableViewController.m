//
//  SDUMyFriendsTableViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 10/05/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUMyFriendsTableViewController.h"
#import "SDUFriendProfileViewController.h"
#import "SDUFriendCell.h"

@interface SDUMyFriendsTableViewController ()

@end

@implementation SDUMyFriendsTableViewController

@synthesize myFriends = _myFriends;
@synthesize searchResults = _searchResults;

-(void)showMenu:(id)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
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
    self.myFriends = [[NSMutableArray alloc] init];
    self.searchResults = [[NSArray alloc] init];
    
    SDUFriend *xavier = [[SDUFriend alloc] initWithName:@"Xavier"];
    [self.myFriends addObject:xavier];
    
    SDUFriend *catherine = [[SDUFriend alloc] initWithName:@"Catherine"];
    [self.myFriends addObject:catherine];
    
    SDUFriend *victor = [[SDUFriend alloc] initWithName:@"Victor"];
    [self.myFriends addObject:victor];
    
    SDUFriend *jg = [[SDUFriend alloc] initWithName:@"JG"];
    [self.myFriends addObject:jg];
    
    SDUFriend *agathe = [[SDUFriend alloc] initWithName:@"Agathe"];
    [self.myFriends addObject:agathe];
    
    SDUFriend *alexandra = [[SDUFriend alloc] initWithName:@"Alexandra"];
    [self.myFriends addObject:alexandra];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
    } else {
        return [self.myFriends count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"friendCell";
    SDUFriendCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[SDUFriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.friend = nil;
    }
    
    SDUFriend *currentFriend = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        currentFriend = [self.searchResults objectAtIndex:indexPath.row];
    } else {
        currentFriend = [self.myFriends objectAtIndex:indexPath.row];
    }
    cell.friend = currentFriend;
    cell.textLabel.text = cell.friend.name;
    
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    self.searchResults = [self.myFriends filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SDUFriendProfileViewController *friendProfileViewController = segue.destinationViewController;
    SDUFriend *curFriend = nil;
    if (self.searchDisplayController.active) {
        curFriend = [self.searchResults objectAtIndex:self.searchDisplayController.searchResultsTableView.indexPathForSelectedRow.row];
    } else {
        curFriend = [self.myFriends objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
        friendProfileViewController.friend = curFriend;
}

 

@end
