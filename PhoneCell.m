//
//  PhoneCell.m
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import "PhoneCell.h"

@implementation PhoneCell

@synthesize phonCelldelegate;

@synthesize rowNumber=_rowNumber;

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
    
        
    [self.phoneTextField setDelegate:self.phonCelldelegate];
    
}

-(void) setTypetitle:(NSString *) title{
    
    [self.phoneTypeButton setTitle:title forState:UIControlStateNormal];
}

-(void) makeCellFieldAsFirstResponder{
    
    [self.phoneTextField becomeFirstResponder];
}


-(IBAction)selectPhoneTypes:(id)sender{
    
    [self.phonCelldelegate showPhoneTypes:self.rowNumber forCell:self];
}

@end
