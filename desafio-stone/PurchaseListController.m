//
//  PurchaseListController.m
//  desafio-stone
//
//  Created by Lucas M Soares on 13/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PurchaseListController.h"
#import "PurchaseListModel.h"
#import "PurchaseModel.h"
#import "Extensions.h"
#import "PurchaseListCell.h"
#import <SIAlertView/SIAlertView.h>

@interface PurchaseListController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation PurchaseListController {

    PurchaseListModel *purchaseList;
    NSArray *purchases;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData {
    
    purchaseList = [[PurchaseListModel alloc] init];
    purchases = [purchaseList getPurchases];
    
    if (purchases != nil) {
        
        [self.tableView reloadData];
    }
    else {
        
        SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Poke Commerce" andMessage:@"Nenhuma compra foi efetuada até o momento"];
        
        [alertView addButtonWithTitle:@"Ok" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alert) {
        }];
        
        alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
        
        [alertView show];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return purchases.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PurchaseListCell";
    
    PurchaseListCell *cell = (PurchaseListCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    [cell init:purchases[indexPath.row]];
    
    return cell;
}

@end
