//
//  SDUFriendCell.m
//  Ten
//
//  Created by Stanislas Duthoit on 17/05/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUFriendCell.h"

@implementation SDUFriendCell

@synthesize friend = _friend;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
