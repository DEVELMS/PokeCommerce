//
//  Service.m
//  desafio-stone
//
//  Created by Lucas M Soares on 08/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import "Service.h"
#import <AFNetworking/AFHTTPSessionManager.h>

@implementation Service {

    AFHTTPSessionManager *manager;
}

- (id)init {
    
    if ( self = [super init] ) {
        
        [self prepareModel];
    }
    return self;
}

- (void)prepareModel {
    
    manager = [AFHTTPSessionManager manager];
}

- (void)requestService:(requestType)type parameters:(NSDictionary *)parameters URL:(NSString *)url {

    switch (type) {
        
        case Get:
        {
            NSLog(@"get to %@", url);
            
            [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
                
                if ([self.delegate respondsToSelector:@selector(requestResponseComplete:)]) {
                    [self.delegate requestResponseComplete:responseObject];
                }
                
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                
                if ([self.delegate respondsToSelector:@selector(requestResponseFail:)]) {
                    [self.delegate requestResponseFail:error];
                }
            }];
        }
            break;
            
        case Post:
        {
            NSLog(@"post to %@\nparameters: %@", url, parameters);
            
            [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
                
                if ([self.delegate respondsToSelector:@selector(requestResponseComplete:)]) {
                    [self.delegate requestResponseComplete:responseObject];
                }
                
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                
                if ([self.delegate respondsToSelector:@selector(requestResponseFail:)]) {
                    [self.delegate requestResponseFail:error];
                }
            }];
        }
            break;
            
        default:
            
            NSLog(@"requestType inválido");
            return;
            
            break;
    }
}

@end
