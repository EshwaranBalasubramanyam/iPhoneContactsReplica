//
//  ProfileTableCell.m
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import "ProfileTableCell.h"

@implementation ProfileTableCell


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
    
    if (buttonTag == SECTION_PHONE) {
    
        [self.cellButton setTitle:@"add phone" forState:UIControlStateNormal];
    
    }else if (buttonTag == SECTION_EMAIL){
    
        [self.cellButton setTitle:@"add email" forState:UIControlStateNormal];
    
    }else if(buttonTag == SECTION_URL){
        
        [self.cellButton setTitle:@"add URL" forState:UIControlStateNormal];
   
    }else if(buttonTag == SECTION_ADDRESS){
        
        [self.cellButton setTitle:@"add address" forState:UIControlStateNormal];
    }
    
   
    [self.cellButton setTag:buttonTag];
        
}

-(IBAction)cellButtonTapped:(id)sender{
    
    NSLog(@"Cell Button tag : %ld",[sender tag]);
    
}


@end
