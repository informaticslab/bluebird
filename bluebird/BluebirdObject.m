//
//  BluebirdObject.m
//  bluebird
//
//  Created by jtq6 on 8/28/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import "BluebirdObject.h"

@implementation BluebirdObject


-(id)initWithText:(NSString *)newText hashtag:(NSString *)newHashtag
{
    self = [super init];
    
    if (self) {
        _text = newText;
        _hashtag = newHashtag;
    }
    
    return self;
    
}



@end
