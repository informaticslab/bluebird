//
//  SurveyQuestion.h
//  bluebird
//
//  Created by jtq6 on 8/28/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BluebirdObject.h"

@interface SurveyQuestion : BluebirdObject

@property(nonatomic, strong) NSMutableArray *answers;
-(void) addAnswerWithText:(NSString *)newText hashtag:(NSString *)newHashtag;

@end
