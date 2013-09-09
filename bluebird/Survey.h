//
//  Survey.h
//  bluebird
//
//  Created by jtq6 on 8/28/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BluebirdObject.h"
#import "SurveyQuestion.h"
#import "SurveyAnswer.h"

@interface Survey : BluebirdObject

@property(nonatomic, strong) NSMutableArray *questions;
@property(nonatomic, strong) NSString *name;

-(id)initWithStaticData;
-(NSInteger)numberOfQuestions;
-(NSInteger)numberOfAnsweredQuestions;

-(SurveyQuestion *)questionAtIndex:(NSInteger)index;
-(NSString *)questionTextAtIndex:(NSInteger)index;
-(NSString *)getResultsTweet;
-(void)restart;

@end
