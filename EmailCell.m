//
//  EmailCell.m
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import "EmailCell.h"

@implementation EmailCell

@synthesize emailCelldelegate;

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

-(IBAction)cellButtonTapped:(id)sender{
    
     [self.emailCelldelegate showEmailTypes:self.rowNumber forCell:self];
    
}

-(void) configureCell:(NSInteger) buttonTag{
    
    
    [self.emailTextField setDelegate:self.emailCelldelegate];
    
}

-(void) setTypetitle:(NSString *) title{
    
    [self.emailTypeButton setTitle:title forState:UIControlStateNormal];
}

-(void) makeCellFieldAsFirstResponder{
    
    [self.emailTextField becomeFirstResponder];
}


@end
