//
//  OTKPod+NSJSONSerialization.h
//  APOD
//
//  Created by Tobi Kuyoro on 22/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKPod.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTKPod (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
