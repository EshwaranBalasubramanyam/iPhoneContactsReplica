//
//  ProfileTableCell.h
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileBaseCell.h"



@interface ProfileTableCell : ProfileBaseCell
@property (weak, nonatomic) IBOutlet UIButton *cellButton;



-(IBAction)cellButtonTapped:(id)sender;

@end

