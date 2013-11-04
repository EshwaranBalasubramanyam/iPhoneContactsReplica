//
//  ProfileBaseCell.m
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import "ProfileBaseCell.h"

@implementation ProfileBaseCell

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

-(void) configureCell:(NSInteger) buttonTag{
    
    
}

-(void) setTypetitle:(NSString *) title{
    
}

-(void) makeCellFieldAsFirstResponder{
    
    
}

-(void) setCountryName:(NSString *) countryName{
    
}

@end
