//
//  Header.h
//  SnapChatTabbar
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 dd. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define Pd_NavigationBar_Height 44
#define Pd_StatusBar_Height ( 20)
#define Pd_Top_Bar_Height ((Pd_StatusBar_Height) + (Pd_NavigationBar_Height))
#define Pd_Tab_Bar_Height (49)
#define Pd_Bottom_Home_Indicator_Height 34

#define Pd_Main_StoryBoard [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]
#define Pd_View_Controller_Default_Manager [PdViewControllerManager defaultManager]

#define Pd_Screen_Height  [UIScreen mainScreen].bounds.size.height

#define Pd_Screen_width  [UIScreen mainScreen].bounds.size.width

#define Pd_Screen_Bounds  [UIScreen mainScreen].bounds

#define Pd_Default_Avatar_Image [UIImage imageNamed:@"fam_default"]
#define Pd_Network_Image_Default_Placeholder [UIImage imageNamed:@"img_bg"]

#define Pd_Back_Image [UIImage imageNamed:@"fam_back1"]

#define RGBColor(r,g,b,a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
#define Pd_Background_Color  RGBColor(240, 239, 245, 1)

//导航栏
#define Pd_NavigationBar_Title_Font [UIFont mediumSystemFontOfSize:19]


#endif /* Header_h */
