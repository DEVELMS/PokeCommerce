//
//  PokemonController.m
//  desafio-stone
//
//  Created by Lucas M Soares on 07/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "PokemonDetailController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PurchaseController.h"

@interface PokemonDetailController ()

@end

@implementation PokemonDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAttributes];
}

- (void)setAttributes {

    self.name.text = self.pokemon.name;
    self.price.text = [NSString stringWithFormat:@"R$ %.00lf,00",self.pokemon.price];
    self.detail.text = self.pokemon.detail;
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:_pokemon.imageURL] placeholderImage:[UIImage imageNamed:@"pokemon_img"]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sgPurchase"]) {
        
        PurchaseController *pc = [segue destinationViewController];
        pc.pokemon = self.pokemon;
    }
}

- (IBAction)buyPokemon:(id)sender {
    
    [self performSegueWithIdentifier:@"sgPurchase" sender:self];
}

@end
