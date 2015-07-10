//
//  SDUUserProfileViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 14/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUUserProfileViewController.h"
#import "SDUFriendsListView.h"

@interface SDUUserProfileViewController ()

@property (strong, nonatomic) SDUFriendsListModel *friendsListModel;
@property (strong, nonatomic) SDUFriendsListView *friendsList;

@end

@implementation SDUUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.friendsList = [[SDUFriendsListView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.friendsList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"friendCell"];
    
    self.friendsListModel = [[SDUFriendsListModel alloc] init];
    self.friendsListModel.delegate = self;
    self.friendsList.dataSource = self;
    self.friendsList.delegate = self;
    [self.view addSubview:self.friendsList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"friendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSString *currentFriend = [self.friendsListModel.FBFriends objectAtIndex:indexPath.row];

    cell.textLabel.text = currentFriend;

    return cell;
}

- (void)FBDataDownloaded
{
    [self.friendsList reloadData];
}

@end
