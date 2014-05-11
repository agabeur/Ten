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

@interface SDUMyRestViewController ()

@end

@implementation SDUMyRestViewController

@synthesize restaurants = _restaurants;
@synthesize listView = _listView;

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
    self.restaurants = [[NSMutableArray alloc]init];
    
    //Add example restaurant
    CLLocationCoordinate2D acmeC2D;
    acmeC2D.latitude = (double) 40.727221;
    acmeC2D.longitude = (double) -73.99406899999997;
    SDURest *firstRest = [[SDURest alloc]initWithName:@"ACME" address:@"9 Great Jones St New York, NY 10012" coordinates:acmeC2D relevance:189];
    [self.restaurants addObject:firstRest];
    
    
    //Add second example restaurant
    CLLocationCoordinate2D bondstC2D;
    bondstC2D.latitude = (double) 40.7269571;
    bondstC2D.longitude = (double) -73.99439899999999;
    SDURest *secondtRest = [[SDURest alloc]initWithName:@"Bondst" address:@"6 Bond St New York, 10012" coordinates:bondstC2D relevance:210];
    [self.restaurants addObject:secondtRest];
    
    CLLocationCoordinate2D buenosAiresC2D;
    buenosAiresC2D.latitude = (double) 40.725229;
    buenosAiresC2D.longitude = (double) -73.983091;
    SDURest *thirdRest = [[SDURest alloc]initWithName:@"Buenos Aires" address:@"513 E 6th St New York, NY 10009" coordinates:buenosAiresC2D relevance:300];
    [self.restaurants addObject:thirdRest];
    
    CLLocationCoordinate2D beautyEssexC2D;
    beautyEssexC2D.latitude = (double) 40.720408;
    beautyEssexC2D.longitude = (double) -73.986883;
    SDURest *fourthRest = [[SDURest alloc]initWithName:@"Beauty & Essex" address:@"146 Essex St New York, NY 10002" coordinates:beautyEssexC2D relevance:150];
    [self.restaurants addObject:fourthRest];
    
    CLLocationCoordinate2D tacombiC2D;
    tacombiC2D.latitude = (double) 40.724014;
    tacombiC2D.longitude = (double) -73.993735;
    SDURest *fifthRest = [[SDURest alloc]initWithName:@"Tacombi" address:@"267 Elizabeth St New York, NY 10012" coordinates:tacombiC2D relevance:150];
    [self.restaurants addObject:fifthRest];
    
    CLLocationCoordinate2D shabuTatsuC2D;
    shabuTatsuC2D.latitude = (double) 40.7293014;
    shabuTatsuC2D.longitude = (double) -73.9858445;
    SDURest *sixthRest = [[SDURest alloc]initWithName:@"Shabu-Tatsu" address:@"216 E 10th St New York, NY 10003" coordinates:shabuTatsuC2D relevance:150];
    [self.restaurants addObject:sixthRest];
    
    CLLocationCoordinate2D blackCrescentC2D;
    blackCrescentC2D.latitude = (double) 40.718931;
    blackCrescentC2D.longitude = (double) -73.985001;
    SDURest *seventhRest = [[SDURest alloc]initWithName:@"Black Crescent" address:@"76 Clinton St New York, NY 10002" coordinates:blackCrescentC2D relevance:150];
    [self.restaurants addObject:seventhRest];
    
    CLLocationCoordinate2D raymiC2D;
    raymiC2D.latitude = (double) 40.743425;
    raymiC2D.longitude = (double) -73.991342;
    SDURest *eigthRest = [[SDURest alloc]initWithName:@"Raymi" address:@"43 W 24th St New York, NY 10010" coordinates:raymiC2D relevance:150];
    [self.restaurants addObject:eigthRest];
    
    CLLocationCoordinate2D blackIronC2D;
    blackIronC2D.latitude = (double) 40.724027;
    blackIronC2D.longitude = (double) -73.98278;
    SDURest *ninthRest = [[SDURest alloc]initWithName:@"Black Iron" address:@"540 E 5th St New York, NY 10009" coordinates:blackIronC2D relevance:150];
    [self.restaurants addObject:ninthRest];
    
    /*CLLocationCoordinate2D sushiOfGariC2D;
    sushiOfGariC2D.latitude = (double) 40.716773;
    sushiOfGariC2D.longitude = (double) -74.008431;
    SDURest *tenthRest = [[SDURest alloc]initWithName:@"Sushi of Gari" address:@"130 W Broadway New York, NY 10013" coordinates:sushiOfGariC2D relevance:150];
    [self.restaurants addObject:tenthRest];*/
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.restaurants.count == 10) {
        return 10;
    } else return self.restaurants.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.restaurants.count) {
        static NSString *CellIdentifier = @"RestCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        SDURest *currentRest = [self.restaurants objectAtIndex:indexPath.row];
        cell.textLabel.text = currentRest.name;
        return cell;
        
    } else {
        static NSString *CellIdentifier = @"AddRestCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = @"Add a restaurant";
        return cell;
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.restaurants.count) {
        return YES;
    }else return NO;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.restaurants removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    SDURest *movedRest = [self.restaurants objectAtIndex:fromIndexPath.row];
    [self.restaurants removeObjectAtIndex:fromIndexPath.row];
    [self.restaurants insertObject:movedRest atIndex:toIndexPath.row];
    
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"restDetailSegue"]) {
        SDUMyRestDetailViewController *restDetailViewController = segue.destinationViewController;
        restDetailViewController.curRest = [self.restaurants objectAtIndex:self.listView.indexPathForSelectedRow.row];
        
    }
}

@end
