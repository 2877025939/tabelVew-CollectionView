//
//  Header.h
//  tabelVew嵌套CollectionView
//
//  Created by anan on 2017/10/11.
//  Copyright © 2017年 Plan. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)
#define Height (IS_IPHONEX ? ([[UIScreen mainScreen] bounds].size.height-20):([[UIScreen mainScreen] bounds].size.height))
#define NavHeight (IS_IPHONEX ? (88):(64))



#endif /* Header_h */
