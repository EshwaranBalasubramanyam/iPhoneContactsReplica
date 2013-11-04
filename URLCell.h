//
//  URLCell.h
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileBaseCell.h"

@interface URLCell : ProfileBaseCell

@property (weak, nonatomic) IBOutlet UIButton *URLTypeButton;
@property (weak, nonatomic) IBOutlet UITextField *URLTextField;

-(IBAction)cellButtonTapped:(id)sender;

@end
