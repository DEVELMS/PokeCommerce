//
//  PokemonListController.m
//  desafio-stone
//
//  Created by Lucas M Soares on 07/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PokemonListController.h"
#import "Extensions.h"
#import "Constants.h"
#import "PokemonListModel.h"
#import "PokemonListCell.h"
#import "PokemonListProtocol.h"
#import "PokemonDetailController.h"
#import "PurchaseController.h"
#import <SIAlertView/SIAlertView.h>

@interface PokemonListController () <PokemonListDelegate,PokemonListActions,UITableViewDelegate,UITableViewDataSource>

@end

@implementation PokemonListController {

    PokemonListModel *pokemonList;
    PokemonModel *pokemon;
    NSArray *pokemons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self selfStyles];
    [self loadData];
}

- (void)selfStyles {
    
    UIColor *mainColor = [[UIColor alloc] colorFromHex:mainColorHex];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.barTintColor = mainColor;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = mainColor;
    self.tableView.opaque = NO;
    self.tableView.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)loadData {

    [self.view addLoading];
    
    pokemonList = [[PokemonListModel alloc] init];
    pokemonList.delegate = self;
    
    [pokemonList getPokemons];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sgPokemonDetail"]) {
        
        PokemonDetailController *pdc = [segue destinationViewController];
        pdc.pokemon = pokemon;
    }
    else if ([segue.identifier isEqualToString:@"sgPurchase"]) {
        
        PurchaseController *pc = [segue destinationViewController];
        pc.pokemon = pokemon;
    }
}

#pragma mark - PokemonListDelegate methods

- (void)pokemonListResponse:(id)response {
    
    [self.view removeLoading];
    
    pokemons = response;
    
    [self.tableView reloadData];
}

- (void)pokemonListResponseFail:(id)response {

    [self.view removeLoading];
    
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Poke Commerce" andMessage:@"Verifique sua conexão de internet"];
    
    [alertView addButtonWithTitle:@"Ok" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alert) {
                              
        [self loadData];
    }];
    
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    
    [alertView show];
}

#pragma mark - PokemonListActions methods

- (void)buyPokemon:(PokemonModel *)pokemon_ {

    pokemon = pokemon_;
    
    [self performSegueWithIdentifier:@"sgPurchase" sender:self];
}

- (void)seePokemonDetail:(PokemonModel *)pokemon_ {
    
    pokemon = pokemon_;
    
    [self performSegueWithIdentifier:@"sgPokemonDetail" sender:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return pokemons.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 340;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PokemonListCell";
    
    PokemonListCell *cell = (PokemonListCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.delegate = self;
    
    [cell init:pokemons[indexPath.row]];
    
    return cell;
}

- (IBAction)seePurchaseList:(id)sender {

    [self performSegueWithIdentifier:@"sgPurchases" sender:self];
}

@end
