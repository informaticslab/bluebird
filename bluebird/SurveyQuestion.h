//
//  SurveyQuestion.h
//  bluebird
//
//  Created by jtq6 on 8/28/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BluebirdObject.h"
#import "SurveyAnswer.h"

@interface SurveyQuestion : BluebirdObject

@property(nonatomic, strong) NSMutableArray *answers;
@property(nonatomic, weak) SurveyAnswer *selectedAnswer;
@property NSUInteger selectedAnswerIndex;

-(void) addAnswerWithText:(NSString *)newText hashtag:(NSString *)newHashtag;

-(NSUInteger)countOfAnswers;
-(SurveyAnswer *)answerAtIndex:(NSUInteger)index;
-(NSString *)getHashTagResults;

@end
