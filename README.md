iterm2-borderless-padding
-------------------------

This repo contains the binary and patch file used to remove borders and add padding to iTerm2.

```
From e4f74ef9f1386494f4bbdd64398adf2ae9c7382b Mon Sep 17 00:00:00 2001
From: Jared Culp <jculp14@gmail.com>
Date: Tue, 26 May 2015 13:34:59 -0400
Subject: [PATCH] Remove borders, add padding

---
 sources/PseudoTerminal.m         | 3 +--
 sources/iTermTextDrawingHelper.h | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sources/PseudoTerminal.m b/sources/PseudoTerminal.m
index fc628c5..4b6ef53 100644
--- a/sources/PseudoTerminal.m
+++ b/sources/PseudoTerminal.m
@@ -355,8 +355,7 @@ static const CGFloat kHorizontalTabBarHeight = 22;
             return NSBorderlessWindowMask;
 
         default:
-            return (NSTitledWindowMask |
-                    NSClosableWindowMask |
+            return (NSClosableWindowMask |
                     NSMiniaturizableWindowMask |
                     NSResizableWindowMask |
                     NSTexturedBackgroundWindowMask);
diff --git a/sources/iTermTextDrawingHelper.h b/sources/iTermTextDrawingHelper.h
index 3863769..2c811fb 100644
--- a/sources/iTermTextDrawingHelper.h
+++ b/sources/iTermTextDrawingHelper.h
@@ -12,10 +12,10 @@
 #import "VT100GridTypes.h"
 
 // Number of pixels margin on left and right edge.
-#define MARGIN 5
+#define MARGIN 25
 
 // Number of pixels margin on the top.
-#define VMARGIN 2
+#define VMARGIN 25
 
 @class iTermColorMap;
 @class iTermFindOnPageHelper;
-- 
2.4.0
```

You can apply the patch to the [source](https://github.com/gnachman/iTerm2) (you might need to resolve merge conflicts) and run `xcodebuild` if you want to change the padding values.
