//
//  PokemonListController.h
//  desafio-stone
//
//  Created by Lucas M Soares on 07/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PokemonListController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)seePurchaseList:(id)sender;

@end
