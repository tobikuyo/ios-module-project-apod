//
//  OTKPod.h
//  APOD
//
//  Created by Tobi Kuyoro on 21/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OTKPod : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString * explanation;
@property (nonatomic) NSURL *imageURL;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithDate:(NSString *)date
                 explanation:(NSString *)explanation
                    imageURL:(NSURL *)imageURL
                       title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
