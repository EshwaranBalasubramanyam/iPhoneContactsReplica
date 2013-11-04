//
//  BasicInformationViewController.m
//  Scoop
//
//  Created by Eshwaran Balasubramanyam on 22/10/13.
//  Copyright (c) 2013 Scoop Global. All rights reserved.
//

#import "BasicInformationViewController.h"

#import "URLCell.h"
#import "PhoneCell.h"
#import "EmailCell.h"
#import "ProfileTableCell.h"
#import "TypesViewController.h"



#import <QuartzCore/QuartzCore.h>

#define HEADER_HEIGHT 22.0



@interface BasicInformationViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,PhoneCellDelegate,EmailCellDelegate,URLCellDelegate,UITextViewDelegate,TypesSelectionDelegate,AddressCellDelegate>


@property (weak, nonatomic) IBOutlet UITableView *basicInfoTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSMutableArray *phoneArray;
@property (strong, nonatomic) NSMutableArray *emailArray;
@property (strong, nonatomic) NSMutableArray *URLArray;
@property (strong, nonatomic) NSMutableArray *addressArray;
@property (strong,nonatomic) TypesViewController *typesVC;
@property (strong , nonatomic) NSArray *phoneTypesArray;
@property (strong , nonatomic) NSArray *emailTypesArray;
@property (strong , nonatomic) NSArray *URLTypesArray;
@property (strong , nonatomic) NSArray *addressTypesArray;
@property (strong, nonatomic) NSMutableArray *sortedCountryArray;




@property (strong,nonatomic) ProfileBaseCell *cellToChangeType;


@property NSInteger sectionToWhichAdded;


@end

@implementation BasicInformationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [self.basicInfoTableView setEditing:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden = YES;
    
    self.phoneArray = [[NSMutableArray alloc] init];
    self.emailArray = [[NSMutableArray alloc] init];
    self.URLArray = [[NSMutableArray alloc] init];
    self.addressArray = [[NSMutableArray alloc] init];
     self.addressArray = [[NSMutableArray alloc] init];
    self.sectionToWhichAdded = -1;
    

    self.phoneTypesArray = [NSArray arrayWithObjects:@"Work",@"Sales",@"Board",@"Support", nil];
    self.emailTypesArray = [NSArray arrayWithObjects:@"Work",@"Sales",@"Support", nil];
    self.URLTypesArray = [NSArray arrayWithObjects:@"Home Page",@"Sales",@"Support", nil];
    self.addressTypesArray = [NSArray arrayWithObjects:@"HQ",@"Sales",@"Support", nil];

    
    [self.scrollView setContentSize:CGSizeMake(320, 700)];
    
    NSLocale *locale = [NSLocale currentLocale];
    NSArray *countryArray = [NSLocale ISOCountryCodes];
    
    self.sortedCountryArray = [[NSMutableArray alloc] init];
    
    for (NSString *countryCode in countryArray) {
        
        NSString *displayNameString = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
        [self.sortedCountryArray addObject:displayNameString];
        
    }
    [self.sortedCountryArray sortUsingSelector:@selector(localizedCompare:)];

    

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Delegate Method

//
// number of sections in table view
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numberOfSections = 4;
    return numberOfSections;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger noOfRows = 1;
    
    if (section == SECTION_PHONE) {
        noOfRows = noOfRows + [self.phoneArray count];
    }
    
    if (section == SECTION_EMAIL) {
        
        noOfRows = noOfRows + [self.emailArray count];
        
    }
    if (section == SECTION_URL) {
        
        noOfRows = noOfRows + [self.URLArray count];
        
    }
    if (section == SECTION_ADDRESS) {
        
        noOfRows = noOfRows + [self.addressArray count];
        
    }
   

    
    
    return noOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return HEADER_HEIGHT;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, HEADER_HEIGHT)];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    
    return  headerView;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    if (indexPath.section == SECTION_ADDRESS) {
        
        NSInteger compare =[self.addressArray count] -1;
        
        if (indexPath.row > compare) {
            
            rowHeight = 44.0f;
            
        }else{
            
            rowHeight = 200.0f;

        }
    }else{
        rowHeight = 44.0f;
    }
    
    return rowHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    ProfileBaseCell  *cell = (ProfileBaseCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if(cell == nil) {
        
        if(indexPath.section == SECTION_PHONE){
            
            NSInteger test =[self.phoneArray count] -1;
            
            if (indexPath.row > test) {
                
                [[NSBundle mainBundle] loadNibNamed:@"ProfileTableCell" owner:self options:nil];
                
            }else{
                
                [[NSBundle mainBundle] loadNibNamed:@"PhoneCell" owner:self options:nil];
            }
            
        }else if(indexPath.section == SECTION_EMAIL){
            
            NSInteger test =[self.emailArray count] -1;
            
            if (indexPath.row > test) {
                
                [[NSBundle mainBundle] loadNibNamed:@"ProfileTableCell" owner:self options:nil];
                
            }else{
                
                [[NSBundle mainBundle] loadNibNamed:@"EmailCell" owner:self options:nil];
            }
            
            
        }else if(indexPath.section == SECTION_URL){
            
            NSInteger test =[self.URLArray count] -1;
            
            if (indexPath.row > test) {
                
                [[NSBundle mainBundle] loadNibNamed:@"ProfileTableCell" owner:self options:nil];
                
            }else{
                
                [[NSBundle mainBundle] loadNibNamed:@"URLCell" owner:self options:nil];
            }
            
        }else if(indexPath.section == SECTION_ADDRESS){
            
            NSInteger compare =[self.addressArray count] -1;
            
            if (indexPath.row > compare) {
                
                [[NSBundle mainBundle] loadNibNamed:@"ProfileTableCell" owner:self options:nil];
                
            }else{
                
                [[NSBundle mainBundle] loadNibNamed:@"AddressCell" owner:self options:nil];
            }
            
            
        }

        else{
            
            [[NSBundle mainBundle] loadNibNamed:@"ProfileTableCell" owner:self options:nil];
            
        }
        
        cell = tblCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.phonCelldelegate = self;
        cell.emailCelldelegate = self;
        cell.urlCellDelegate = self;
        cell.addressCellDelegate= self;
        cell.rowNumber = indexPath.row;
        [cell.contentView setBackgroundColor:[UIColor clearColor]];
        
        if (indexPath.section == SECTION_PHONE) {
            
            NSInteger test =[self.phoneTypesArray count] -1;
            
            if (([self.phoneArray count]-1) < test) {
                [cell setTypetitle:[self.phoneTypesArray objectAtIndex:([self.phoneArray count]-1)]];
            }else{
                [cell setTypetitle:[self.phoneTypesArray lastObject]];
            }
        }else  if (indexPath.section == SECTION_EMAIL) {
            
            NSInteger test =[self.emailTypesArray count] -1;
            
            if (([self.emailArray count]-1) < test) {
                [cell setTypetitle:[self.emailTypesArray objectAtIndex:([self.emailArray count]-1)]];
            }else{
                [cell setTypetitle:[self.emailTypesArray lastObject]];
            }
        }else  if (indexPath.section == SECTION_URL) {
            
            NSInteger test =[self.URLTypesArray count] -1;
            
            if (([self.URLArray count]-1) < test) {
                [cell setTypetitle:[self.URLTypesArray objectAtIndex:([self.URLArray count]-1)]];
            }else{
                [cell setTypetitle:[self.URLTypesArray lastObject]];
            }
        }else  if (indexPath.section == SECTION_ADDRESS) {
            
            NSInteger test =[self.addressTypesArray count] -1;
            
            if (([self.addressArray count]-1) < test) {
                [cell setTypetitle:[self.addressTypesArray objectAtIndex:([self.addressArray count]-1)]];
            }else{
                [cell setTypetitle:[self.addressTypesArray lastObject]];
            }
            
        }

        


        if (indexPath.section == self.sectionToWhichAdded) {
            if (indexPath.row == 0) {
                [cell makeCellFieldAsFirstResponder];
            }
        }
        [cell configureCell:indexPath.section];
        
    }
    
    return cell;
    
}

#pragma mark ProfileTableCellDelegate Methods


-(void) addCell:(NSInteger) cellType{
    
    
    NSMutableArray *arCells=[NSMutableArray array];
    
    [arCells addObject:[NSIndexPath indexPathForRow:0 inSection:cellType]];
    
    if (cellType == SECTION_PHONE) {
        [self.phoneArray addObject:@"added"];
    }
    
    if (cellType == SECTION_EMAIL) {
        [self.emailArray addObject:@"added"];
    }
    
    if (cellType == SECTION_URL) {
        [self.URLArray addObject:@"added"];
    }
    
    if (cellType == SECTION_ADDRESS) {
        [self.addressArray addObject:@"added"];
    }
    
    
    [self.basicInfoTableView insertRowsAtIndexPaths:arCells withRowAnimation:UITableViewRowAnimationLeft];
    [self increaseSizes];
    //[self.basicInfoTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == SECTION_PHONE)
    {
        NSInteger test =[self.phoneArray count] -1;
        
        if (indexPath.row > test) {
            
            return UITableViewCellEditingStyleInsert;
            
        }else{
            
            return UITableViewCellEditingStyleDelete;
        }
        
        
    }else if (indexPath.section == SECTION_EMAIL){
        
        NSInteger test =[self.emailArray count] -1;
        
        if (indexPath.row > test) {
            
            return UITableViewCellEditingStyleInsert;
            
        }else{
            
            return UITableViewCellEditingStyleDelete;
        }
        
    }else if (indexPath.section == SECTION_URL){
        
        NSInteger test =[self.URLArray count] -1;
        
        if (indexPath.row > test) {
            
            return UITableViewCellEditingStyleInsert;
            
        }else{
            
            return UITableViewCellEditingStyleDelete;
        }
        
    }else if (indexPath.section == SECTION_ADDRESS){
        
        NSInteger test =[self.addressArray count] -1;
        
        if (indexPath.row > test) {
            
            return UITableViewCellEditingStyleInsert;
            
        }else{
            
            return UITableViewCellEditingStyleDelete;
        }
        
    }

    else
    {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleNone;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  YES;
}

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleInsert) {
    
        self.sectionToWhichAdded = indexPath.section;
        [self addCell:indexPath.section];
   
    }else{
        
        NSMutableArray *arCells=[NSMutableArray array];
        
        [arCells addObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        
        if (indexPath.section == SECTION_PHONE) {
            
            [self.phoneArray removeObjectAtIndex:indexPath.row];
      
        }else if(indexPath.section == SECTION_EMAIL){
            
            [self.emailArray removeObjectAtIndex:indexPath.row];
        
        }else if(indexPath.section == SECTION_URL){
            
            [self.URLArray removeObjectAtIndex:indexPath.row];
        }else if(indexPath.section == SECTION_ADDRESS){
           
            [self.addressArray removeObjectAtIndex:indexPath.row];
        }
        
        [self.basicInfoTableView deleteRowsAtIndexPaths:arCells withRowAnimation:UITableViewRowAnimationAutomatic];
        [self decreaseSizes];
        
    }
    
    
}


-(void)showPhoneTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell{
    
    if (self.typesVC) {
        self.typesVC = nil;
    }
    self.typesVC = [[TypesViewController alloc] initWithNibName:@"TypesViewController" bundle:nil];

     self.typesVC.dataArray = self.phoneTypesArray;
    self.cellToChangeType = cell;
    self.typesVC.delegate = self;
    [self.typesVC setIsCountrySelect:NO];
    NSInteger compare = self.phoneTypesArray.count -1;
    if (rowNumber < compare) {
         self.typesVC.selectedRow = rowNumber;
    }else{
        self.typesVC.selectedRow = compare;
    }
   
     [self presentViewController:self.typesVC animated:YES completion:nil];
}


-(void)showEmailTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell{
    
    if (self.typesVC) {
        self.typesVC = nil;
    }
    self.typesVC = [[TypesViewController alloc] initWithNibName:@"TypesViewController" bundle:nil];

    self.typesVC.dataArray = self.emailTypesArray;
    self.cellToChangeType = cell;
    self.typesVC.delegate = self;
     [self.typesVC setIsCountrySelect:NO];
    NSInteger compare = self.emailTypesArray.count -1;
    if (rowNumber < compare) {
        self.typesVC.selectedRow = rowNumber;
    }else{
        self.typesVC.selectedRow = compare;
    }
    
    [self presentViewController:self.typesVC animated:YES completion:nil];
}



-(void)showURLTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell{
    
    if (self.typesVC) {
        self.typesVC = nil;
    }
    self.typesVC = [[TypesViewController alloc] initWithNibName:@"TypesViewController" bundle:nil];

    self.typesVC.dataArray = self.URLTypesArray;
    self.cellToChangeType = cell;
    self.typesVC.delegate = self;
     [self.typesVC setIsCountrySelect:NO];
    NSInteger compare = self.URLTypesArray.count -1;
    if (rowNumber < compare) {
        self.typesVC.selectedRow = rowNumber;
    }else{
        self.typesVC.selectedRow = compare;
    }
    
    [self presentViewController:self.typesVC animated:YES completion:nil];
}




#pragma UITextfieldDelegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    NSLog(@"textFieldDidEndEditing");
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
   
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark Animate Height Of Table View and Scroll View Accordingly

- (void)increaseSizes
{
    CGFloat height = self.basicInfoTableView.frame.size.height;
    CGFloat scrollHeight = self.scrollView.contentSize.height;
    
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.basicInfoTableView.frame;
        frame.size.height = height+44.0;
        self.basicInfoTableView.frame = frame;
        
        [self.scrollView setContentSize:CGSizeMake(320, scrollHeight+44.0)];
        
        // if you have other controls that should be resized/moved to accommodate
        // the resized tableview, do that here, too
    }];
}


- (void)decreaseSizes
{
    CGFloat height = self.basicInfoTableView.frame.size.height;
    CGFloat scrollHeight = self.scrollView.contentSize.height;
    
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.basicInfoTableView.frame;
        frame.size.height = height-44.0;
        self.basicInfoTableView.frame = frame;
        
        [self.scrollView setContentSize:CGSizeMake(320, scrollHeight-44.0)];
        
        // if you have other controls that should be resized/moved to accommodate
        // the resized tableview, do that here, too
    }];
}





#pragma mark TypesSelectionDelegate methods

-(void) didSelectType:(NSString *) type atIndex:(NSInteger) index{
    
    [self.cellToChangeType setTypetitle:type];
    
}

-(void)showAddressTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell{
    
    if (self.typesVC) {
        self.typesVC = nil;
    }
    self.typesVC = [[TypesViewController alloc] initWithNibName:@"TypesViewController" bundle:nil];
    
    self.typesVC.dataArray = self.addressTypesArray;
    self.cellToChangeType = cell;
    self.typesVC.delegate = self;
    NSInteger compare = self.addressTypesArray.count -1;
    if (rowNumber < compare) {
        self.typesVC.selectedRow = rowNumber;
    }else{
        self.typesVC.selectedRow = compare;
    }
    
    [self presentViewController:self.typesVC animated:YES completion:nil];
}

-(void)showCountryList:(ProfileBaseCell *) cell{
    
    if (self.typesVC) {
        self.typesVC = nil;
    }
    self.typesVC = [[TypesViewController alloc] initWithNibName:@"TypesViewController" bundle:nil];
    
    self.typesVC.dataArray = self.sortedCountryArray;
    self.cellToChangeType = cell;
    self.typesVC.delegate = self;
    [self.typesVC setIsCountrySelect:YES];
    
    [self presentViewController:self.typesVC animated:YES completion:nil];
    
    
}

#pragma mark TypesSelectionDelegate methods


-(void) didSelectCountry:(NSString *) country{
    
    [self.cellToChangeType setCountryName:country];
    
}

@end




