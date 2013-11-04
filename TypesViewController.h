//
//  TypesViewController.h
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TypesSelectionDelegate;

@interface TypesViewController : UIViewController

@property (strong,nonatomic) NSArray *dataArray;
@property (strong, nonatomic) id<TypesSelectionDelegate> delegate;
@property NSInteger selectedRow;
@property BOOL isCountrySelect;

@end

@protocol TypesSelectionDelegate <NSObject>

@optional
-(void) didSelectType:(NSString *) type atIndex:(NSInteger) index;
-(void) didSelectCountry:(NSString *) country;
@end
