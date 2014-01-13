//
//  MovieModel.m
//  BoxOfficeApp
//
//  Created by Dinesh Joshi on 1/12/14.
//  Copyright (c) 2014 Dinesh Joshi. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

- (id) initWithDictionary: (NSDictionary *) dictionary {
    self.title = [dictionary objectForKey:@"title"];
    self.summary = [dictionary objectForKey:@"synopsis"];
    self.imgUrl = [[dictionary objectForKey:@"posters"] objectForKey:@"thumbnail"];
    
    id abridged_cast = [dictionary objectForKey:@"abridged_cast"];
    NSMutableArray *cast_members = [[NSMutableArray alloc] init];
    NSMutableString *cast_str = [[NSMutableString alloc] init];
    
    NSUInteger cast_size = [abridged_cast count];
    NSUInteger size_to_extract = (cast_size >= 3) ? 3 : cast_size;
    for(NSUInteger i=0; i < size_to_extract; i++) {
        [cast_members addObject:[[abridged_cast objectAtIndex:i] objectForKey:@"name"]];
    }
    
    cast_str = [cast_members componentsJoinedByString:@", "];
    self.cast = cast_str;
    
    return self;
}

@end
