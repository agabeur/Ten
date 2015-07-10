//
//  SDUNewHomeViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 26/05/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUNewHomeViewController.h"
#import "SDURestMapListViewController.h"
#import "SDUUniversalSearchTableView.h"
#import "SDUScreenSizes.h"
#import "SDUSearchBarView.h"
#import "SDUScrollView.h"
#import "SDULocationLabel.h"
#import "SDURestButton.h"
#import "SDUBarButton.h"
#import "SDURestLabel.h"
#import "SDUBarLabel.h"
#import "SDURestTagView.h"
#import "SDUBarTagView.h"

@interface SDUNewHomeViewController ()
{
    SDULoginModel *_SDULoginModel;
}
@property (strong, nonatomic) SDUScrollView *scrollView;
@property (strong, nonatomic) SDURestButton *restButton;
@property (strong, nonatomic) SDUBarButton *barButton;
@property (strong, nonatomic) SDURestLabel *restLabel;
@property (strong, nonatomic) SDUBarLabel *barLabel;
@property (strong, nonatomic) SDULocationLabel *locationLabel;
@property (strong, nonatomic) UIView *loginView;
@property (strong, nonatomic) UIView *shortProfileView;
@property (strong,nonatomic) SDURestTagView *restTagView;
@property (strong,nonatomic) SDUBarTagView *barTagView;
@property (strong, nonatomic) FBLoginView *loginButton;
@property (strong, nonatomic) FBLoginView *logoutButton;
@property (strong, nonatomic) FBProfilePictureView *profilePicture;
@property (strong, nonatomic) UILabel *name;
@property (weak, nonatomic) FBGraphObject *user;
@property CGFloat screenWidth;
@property CGFloat screenHeight;
@property CGFloat navigationBarHeight;
@property int buttonRadius;
@property BOOL restTagViewToggled;
@property BOOL barTagViewToggled;
@property NSArray *tags;
@property NSString *clickedTag;
@property SDUSearchBarView *searchBar;
@property SDUUniversalSearchTableView *searchView;
@property SDUScreenSizes *screenSizes;

@end

@implementation SDUNewHomeViewController

CLLocationManager *userLocationManager;
CLGeocoder *geocoder;
CLPlacemark *placemark;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.screenSizes = [SDUScreenSizes sharedManager];
    self.screenSizes.screenHeight = self.view.frame.size.height;
    self.screenSizes.screenWidth = self.view.frame.size.width;
    self.screenSizes.navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    self.screenSizes.screenFrame = self.view.frame;
    self.screenSizes.buttonRadius = 40;
    
    userLocationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    userLocationManager.delegate = self;
    userLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [userLocationManager startUpdatingLocation];
        
    self.barTagViewToggled = NO;
    self.restTagViewToggled = NO;
    
    self.searchView = [[SDUUniversalSearchTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.searchView];
    
    self.searchBar = [[SDUSearchBarView alloc] init];
    [self.navigationController.navigationBar addSubview:self.searchBar];
    
    self.scrollView = [[SDUScrollView alloc] init];
    self.view = self.scrollView;
    
    self.locationLabel = [[SDULocationLabel alloc] init];
    [self.scrollView addSubview:self.locationLabel];
    
    self.restButton = [[SDURestButton alloc] init];
    [self.restButton addTarget:self action:@selector(restButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.restButton];
    
    self.barButton = [[SDUBarButton alloc] init];
    [self.barButton addTarget:self action:@selector(barButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.barButton];
    
    self.restLabel = [[SDURestLabel alloc] init];
    [self.scrollView addSubview:self.restLabel];
    
    self.barLabel = [[SDUBarLabel alloc] init];
    [self.view addSubview:self.barLabel];
    
    self.restTagView = [[SDURestTagView alloc] init];
    [self.scrollView addSubview:self.restTagView];
    [self.restTagView.button0 addTarget:self action:@selector(clickedRestTagButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.barTagView = [[SDUBarTagView alloc] init];
    [self.scrollView addSubview:self.barTagView];
    
    [self addShortProfileView];
    [self addLoginView];
    
    if (FBSession.activeSession.isOpen) {
        self.loginView.hidden = YES;
        self.shortProfileView.hidden = NO;
    } else if (!FBSession.activeSession.isOpen) {
        self.shortProfileView.hidden = YES;
        self.loginView.hidden = NO;
    }
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.986 green:0.000 blue:0.027 alpha:1.000];
    
    self.tags = [[NSArray alloc] initWithObjects:@"Date", @"Friends", @"Parents", @"Kids", @"Work", nil];
    
    _SDULoginModel = [[SDULoginModel alloc] init];
    _SDULoginModel.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.searchBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Handling buttons

- (void)restButtonClicked
{
    if (!self.restTagViewToggled && !self.barTagViewToggled) {
        
        [self displayTagView:self.restTagView];
        self.restTagViewToggled = YES;
        
    } else if (self.restTagViewToggled && !self.barTagViewToggled) {
        
        [self hideTagView:self.restTagView];
        self.restTagViewToggled = NO;
        
    } else if (!self.restTagViewToggled && self.barTagViewToggled) {
        [self hideTagView:self.barTagView];
        self.barTagViewToggled = NO;
        [self performSelector:@selector(displayTagView:) withObject:self.restTagView afterDelay:0.5];
        self.restTagViewToggled = YES;
    }
}

- (void)barButtonClicked
{
    if (!self.restTagViewToggled && !self.barTagViewToggled) {
        
        [self displayTagView:self.barTagView];
        self.barTagViewToggled = YES;
        
    } else if (!self.restTagViewToggled && self.barTagViewToggled) {
        
        [self hideTagView:self.barTagView];
        self.barTagViewToggled = NO;
        
    } else if (self.restTagViewToggled && !self.barTagViewToggled) {
        [self hideTagView:self.restTagView];
        self.restTagViewToggled = NO;
        [self performSelector:@selector(displayTagView:) withObject:self.barTagView afterDelay:0.5];
        self.barTagViewToggled = YES;
    }
}

- (void)displayTagView:(UIView *)tagView
{
    CGRect shortProfileFrame = self.shortProfileView.frame;
    shortProfileFrame.origin.y = tagView.frame.origin.y + tagView.frame.size.height;
    
    CGRect scrollViewFrame = self.view.frame;
    scrollViewFrame.size.height = tagView.frame.origin.y + tagView.frame.size.height + self.shortProfileView.frame.size.height;
    
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    scrollViewContentSize.height = 920;
//    scrollViewContentSize.height = tagView.frame.origin.y + tagView.frame.size.height + self.shortProfileView.frame.size.height;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         tagView.hidden = !tagView.hidden;
                         self.shortProfileView.frame = shortProfileFrame;
                         self.scrollView.frame = scrollViewFrame;
                         self.scrollView.contentSize = scrollViewContentSize;
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)hideTagView:(UIView *)tagView
{
    CGRect shortProfileFrame = self.shortProfileView.frame;
    shortProfileFrame.origin.y = tagView.frame.origin.y;
    
    CGRect scrollViewFrame = self.view.frame;
    scrollViewFrame.size.height = tagView.frame.origin.y + self.shortProfileView.frame.size.height;
    
    CGSize scrollViewContentSize = CGSizeMake(self.screenSizes.screenWidth, self.screenSizes.screenHeight+5);
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.shortProfileView.frame = shortProfileFrame;
                         self.scrollView.frame = scrollViewFrame;
                         self.scrollView.contentSize = scrollViewContentSize;
                     }
                     completion:^(BOOL finished){
                         tagView.hidden = !tagView.hidden;
                     }];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
//        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
//        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    // Stop Location Manager
    [userLocationManager stopUpdatingLocation];
    
    // Reverse Geocoding
//    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
//        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.locationLabel.text = [NSString stringWithFormat:@"%@, %@",
                                 placemark.locality,
                                 placemark.administrativeArea];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}

-(void)clickedRestTagButton:(UIButton *)sender
{
    self.clickedTag = [self.tags objectAtIndex:sender.tag];
    [self performSegueWithIdentifier:@"@RestSearch" sender:self];
}

-(void)addLoginView
{
    CGRect loginViewFrame = CGRectMake(0, self.screenSizes.screenHeight*2/3 - self.screenSizes.navigationBarHeight, self.screenSizes.screenWidth, self.screenSizes.screenHeight/3);
    self.loginView = [[UIView alloc] initWithFrame:loginViewFrame];
    self.loginView.backgroundColor = [UIColor colorWithRed:0.208f green:0.267f blue:0.345f alpha:1.00f];
    
    CGRect loginButtonFrame = CGRectMake(self.screenSizes.screenWidth/4, self.screenSizes.screenHeight/6, self.screenSizes.screenWidth/2, self.screenSizes.screenHeight/12);
    self.loginButton = [[FBLoginView alloc] initWithFrame:loginButtonFrame];
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends", @"read_custom_friendlists"];
    [self.loginView addSubview:self.loginButton];
    
    [self.scrollView addSubview:self.loginView];
}

-(void)addShortProfileView
{
    //    Create shortProfileView
    CGRect shortProfileFrame = CGRectMake(0, self.screenSizes.screenHeight*2/3 - self.screenSizes.navigationBarHeight, self.screenSizes.screenWidth, self.screenSizes.screenHeight/3);
    self.shortProfileView = [[UIView alloc] initWithFrame:shortProfileFrame];
    self.shortProfileView.backgroundColor = [UIColor colorWithRed:0.208f green:0.267f blue:0.345f alpha:1.00f];
    CGRect logoutButtonFrame = CGRectMake(self.screenSizes.screenWidth/4, self.screenSizes.screenHeight/6, self.screenSizes.screenWidth/2, self.screenSizes.screenHeight/12);
    self.logoutButton = [[FBLoginView alloc] init];
    self.logoutButton.delegate = self;
    self.logoutButton.readPermissions = @[@"public_profile", @"email", @"user_friends", @"read_custom_friendlists"];
    self.logoutButton.frame = logoutButtonFrame;
    [self.shortProfileView addSubview:self.logoutButton];
    
    CGRect lineFrame = CGRectMake(15, 0, 290, 1);
    UILabel *line = [[UILabel alloc]initWithFrame:lineFrame];
    line.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [self.shortProfileView addSubview:line];
    
    //    Facebook data
    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.user = facebookData.user;
    self.profilePicture = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(20, 20, 80, 80)];
    self.profilePicture.profileID = [self.user objectForKey:@"id"];
    self.profilePicture.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.profilePicture.profileID = [self.user objectForKey:@"id"];
    self.profilePicture.layer.masksToBounds = YES;
    self.profilePicture.layer.cornerRadius = 40.0;
    self.profilePicture.layer.borderColor = [UIColor whiteColor].CGColor;
    self.profilePicture.layer.borderWidth = 3.0f;
    self.profilePicture.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.profilePicture.layer.shouldRasterize = YES;
    self.profilePicture.clipsToBounds = YES;
    [self addGestureRecogniser:self.shortProfileView];
    
    [self.shortProfileView addSubview:self.profilePicture];
    
    [self.scrollView addSubview:self.shortProfileView];
}

-(void)addGestureRecogniser:(UIView *)touchView{
    
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickedProfilePicture)];
    [touchView addGestureRecognizer:singleTap];
}

-(void)clickedProfilePicture
{
    [self performSegueWithIdentifier:@"@UserProfile" sender:self];
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    
    self.loginView.hidden = YES;
    self.shortProfileView.hidden = NO;
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{

//    [[self.shortProfileView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.shortProfileView.hidden = YES;
    self.profilePicture.profileID = nil;
    self.name = nil;
    self.loginView.hidden = NO;
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
//    NSLog(@"%@", user);
    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.profilePicture.profileID = user.objectID;
//    self.lblUsername.text = user.name;
//    self.lblEmail.text = [user objectForKey:@"email"];
    
    facebookData.user = user;
    [_SDULoginModel uploadFBData:user];

    
//    [_SDULoginModel uploadFBData:user];
    
    /* make the API call */
    [FBRequestConnection startWithGraphPath:@"/me/friends"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              /* handle the result */
                              NSDictionary *userData = (NSDictionary *)result;
                              
                          }];
    
    CGRect nameFrame = CGRectMake(self.screenSizes.screenWidth/2, self.screenSizes.screenHeight/15, 200, 30);
    self.name = [[UILabel alloc] initWithFrame:nameFrame];
    self.name.text = [user objectForKey:@"first_name"];
//    self.name.backgroundColor = [UIColor redColor];
    self.name.textColor = [UIColor whiteColor];
    self.name.font = [UIFont fontWithName:@"Arial" size:20.0];
    [self.shortProfileView addSubview:self.name];
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"@RestSearch"]) {
    SDURestMapListViewController *restMapListViewController = segue.destinationViewController;
    restMapListViewController.mood = self.clickedTag;
    }
    self.searchBar.hidden = YES;
}


@end
