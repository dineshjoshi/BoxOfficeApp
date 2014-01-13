//
//  MovieModel.h
//  BoxOfficeApp
//
//  Created by Dinesh Joshi on 1/12/14.
//  Copyright (c) 2014 Dinesh Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * cast;
@property (nonatomic, strong) NSString * summary;
@property (nonatomic, strong) NSString * imgUrl;


- (id) initWithDictionary: (NSDictionary *) dictionary;

@end
