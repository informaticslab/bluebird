//
//  BluebirdObject.h
//  bluebird
//
//  Created by jtq6 on 8/28/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BluebirdObject : NSObject

@property(nonatomic, strong) NSString *hashtag;
@property(nonatomic, strong) NSString *text;

-(id)initWithText:(NSString *)text hashtag:(NSString *)hashtag;

@end

