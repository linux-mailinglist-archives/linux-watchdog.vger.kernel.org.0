Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C564D3BB
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2019 18:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfFTQ2x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Jun 2019 12:28:53 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:36661 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfFTQ2x (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Jun 2019 12:28:53 -0400
Received: by mail-pl1-f180.google.com with SMTP id k8so1608529plt.3;
        Thu, 20 Jun 2019 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=4ZKn9SIkImq9+behPWZc5ze07PPRzxroUNp3IbIuFxo=;
        b=I3sYrskbgAMR6bHRNKXcwili2ooiCE6rOTTfUVgcg6OEUD4885ZK9nRvjJ67ei/yhn
         NHaAB/uNkNjElqXTPE3Ka5nB5vEhtDId+LF2rD96tZ0+dNYB5kYb0n2I3/PXQTetz7y8
         SPWYhZ21s157B1Y1IV8Bu0Z72LPAOWW7qWPG/fUdf0P0njqd70uqnhYOfZjRSimBnP+X
         gtEs+7b0Nq9s5lE4LGNJ3PSD9oG+714lx4dVr2S+7k9nzEfnIXS+Ih0BfUAK9PFySrqL
         oUqKwYWRTr2sbeFJhXv+3g9iHZNoAjhY8p1gDj90YiYV8SQ68e0IpvlzMG0Ip/CRxJx2
         M8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=4ZKn9SIkImq9+behPWZc5ze07PPRzxroUNp3IbIuFxo=;
        b=OpX10QjpbpwU4mRYd5jUbenniy8ah0MpfBXxNaTM2/9/9xW7Xr1mvKIWmEHNYVEC4S
         bSjBYKB273VyDAw0tH0gl3xEECsAD7M0jcwoEFqXvh7YYHBnryi5HRHstBQD/rUwLi7f
         K+9ks8nc/CrfvySDb7LS6PWZd7OTdtin5pgnhOgjNk/m8FgboiaRJ6Cbu1pZ14hmEce4
         T92VRBZFXdD4ds/l216h5UAnt4mZ1aXgCJgQ9a4gVng9DAnrZ+qXeFrtAYVWtVg4Xpjh
         Iv38yU2ididCgZGrj/34mlSVqe3AsuSnwFFuOw5QzsHH6a5trQUwhjbnfRIDVa0YqS8B
         P8QQ==
X-Gm-Message-State: APjAAAUhNCWiRBWoSIyQa92Fdd3drHycM8t4fKM238NC0apjs18dLkMj
        9OELk/ALN6hnwzRW3x1CIx0=
X-Google-Smtp-Source: APXvYqwixvbsaERqOZ6d8+PgqxDKbMAcrfnRIi+n4u7QD/d7dYL54RFkS8Gt26mxjqd+lwhpJSVfWA==
X-Received: by 2002:a17:902:7448:: with SMTP id e8mr116753488plt.222.1561048130954;
        Thu, 20 Jun 2019 09:28:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c18sm24265967pfc.180.2019.06.20.09.28.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 09:28:50 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wan ZongShun <mcuos.com@gmail.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog: convert remaining drivers to use SPDX license identifier
Date:   Thu, 20 Jun 2019 09:28:46 -0700
Message-Id: <1561048126-27578-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This gets rid of the unnecessary license boilerplate, and avoids
having to deal with individual patches one by one.

No functional changes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Note: Several drivers include a paragraph such as

"Neither <name> nor <company> admit liability nor
 provide warranty for any of this software. This material is
 provided "AS-IS" and at no charge."

Presumably this is covered by the GPL license. However, since I am not
an attorney, I am not sure, and I opted for leaving such paragraphs in
place.

 drivers/watchdog/acquirewdt.c          |  6 +-----
 drivers/watchdog/advantechwdt.c        |  6 +-----
 drivers/watchdog/ath79_wdt.c           |  6 +-----
 drivers/watchdog/davinci_wdt.c         |  6 ++----
 drivers/watchdog/ebc-c384_wdt.c        |  9 ---------
 drivers/watchdog/eurotechwdt.c         |  6 +-----
 drivers/watchdog/ftwdt010_wdt.c        |  5 +----
 drivers/watchdog/hpwdt.c               |  6 +-----
 drivers/watchdog/iTCO_vendor_support.c |  7 +------
 drivers/watchdog/iTCO_wdt.c            |  6 +-----
 drivers/watchdog/ib700wdt.c            |  6 +-----
 drivers/watchdog/ie6xx_wdt.c           | 17 +----------------
 drivers/watchdog/imgpdc_wdt.c          |  5 +----
 drivers/watchdog/intel_scu_watchdog.c  | 19 +------------------
 drivers/watchdog/intel_scu_watchdog.h  | 17 +----------------
 drivers/watchdog/iop_wdt.c             | 14 +-------------
 drivers/watchdog/kempld_wdt.c          | 10 +---------
 drivers/watchdog/ks8695_wdt.c          |  5 +----
 drivers/watchdog/lantiq_wdt.c          |  5 +----
 drivers/watchdog/lpc18xx_wdt.c         |  5 +----
 drivers/watchdog/max77620_wdt.c        |  5 +----
 drivers/watchdog/mt7621_wdt.c          |  5 +----
 drivers/watchdog/mv64x60_wdt.c         |  6 ++----
 drivers/watchdog/nuc900_wdt.c          |  6 +-----
 drivers/watchdog/nv_tco.h              |  6 +-----
 drivers/watchdog/octeon-wdt-main.c     | 11 +----------
 drivers/watchdog/omap_wdt.c            |  6 ++----
 drivers/watchdog/omap_wdt.h            | 21 +--------------------
 drivers/watchdog/pc87413_wdt.c         |  6 +-----
 drivers/watchdog/pcwd_pci.c            |  6 +-----
 drivers/watchdog/pcwd_usb.c            |  6 +-----
 drivers/watchdog/pnx4008_wdt.c         |  5 +----
 drivers/watchdog/qcom-wdt.c            | 14 ++------------
 drivers/watchdog/retu_wdt.c            | 10 +---------
 drivers/watchdog/rn5t618_wdt.c         |  8 +-------
 drivers/watchdog/rt2880_wdt.c          |  5 +----
 drivers/watchdog/sa1100_wdt.c          |  6 +-----
 drivers/watchdog/sbc7240_wdt.c         | 11 +----------
 drivers/watchdog/sbc8360.c             |  6 +-----
 drivers/watchdog/sbsa_gwdt.c           | 10 +---------
 drivers/watchdog/sch311x_wdt.c         |  6 +-----
 drivers/watchdog/softdog.c             |  6 +-----
 drivers/watchdog/txx9wdt.c             |  5 +----
 drivers/watchdog/w83627hf_wdt.c        |  6 +-----
 drivers/watchdog/wafer5823wdt.c        |  6 +-----
 drivers/watchdog/watchdog_core.c       |  6 +-----
 drivers/watchdog/watchdog_core.h       |  6 +-----
 drivers/watchdog/watchdog_dev.c        |  6 +-----
 drivers/watchdog/wd501p.h              |  6 +-----
 drivers/watchdog/wdt.c                 |  6 +-----
 drivers/watchdog/wdt_pci.c             |  6 +-----
 51 files changed, 54 insertions(+), 336 deletions(-)

diff --git a/drivers/watchdog/acquirewdt.c b/drivers/watchdog/acquirewdt.c
index 957d1255d4ca..848db958411e 100644
--- a/drivers/watchdog/acquirewdt.c
+++ b/drivers/watchdog/acquirewdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Acquire Single Board Computer Watchdog Timer driver
  *
@@ -6,11 +7,6 @@
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/advantechwdt.c b/drivers/watchdog/advantechwdt.c
index 2766af292a71..0d02bb275b3d 100644
--- a/drivers/watchdog/advantechwdt.c
+++ b/drivers/watchdog/advantechwdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Advantech Single Board Computer WDT driver
  *
@@ -9,11 +10,6 @@
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index 02234c254b10..2cb8b4d56cce 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Atheros AR71XX/AR724X/AR913X built-in hardware watchdog timer.
  *
@@ -10,11 +11,6 @@
  *
  * which again was based on sa1100 driver,
  *	Copyright (C) 2000 Oleg Drokin <green@crimea.edu>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
index 49a81c32a1b7..2b3f3cd382ef 100644
--- a/drivers/watchdog/davinci_wdt.c
+++ b/drivers/watchdog/davinci_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * drivers/char/watchdog/davinci_wdt.c
  *
@@ -5,10 +6,7 @@
  *
  * Copyright (C) 2006-2013 Texas Instruments.
  *
- * 2007 (c) MontaVista Software, Inc. This file is licensed under
- * the terms of the GNU General Public License version 2. This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * 2007 (c) MontaVista Software, Inc.
  */
 
 #include <linux/module.h>
diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
index c176f59fea28..8ef4b0df3855 100644
--- a/drivers/watchdog/ebc-c384_wdt.c
+++ b/drivers/watchdog/ebc-c384_wdt.c
@@ -2,15 +2,6 @@
 /*
  * Watchdog timer driver for the WinSystems EBC-C384
  * Copyright (C) 2016 William Breathitt Gray
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License, version 2, as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
  */
 #include <linux/device.h>
 #include <linux/dmi.h>
diff --git a/drivers/watchdog/eurotechwdt.c b/drivers/watchdog/eurotechwdt.c
index 89129e6fa9b6..3a83a48abcae 100644
--- a/drivers/watchdog/eurotechwdt.c
+++ b/drivers/watchdog/eurotechwdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Eurotech CPU-1220/1410/1420 on board WDT driver
  *
@@ -11,11 +12,6 @@
  *	(c) Copyright 1996-1997 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
index c0b081c6fbda..09ba57d35aa4 100644
--- a/drivers/watchdog/ftwdt010_wdt.c
+++ b/drivers/watchdog/ftwdt010_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Watchdog driver for Faraday Technology FTWDT010
  *
@@ -5,10 +6,6 @@
  *
  * Inspired by the out-of-tree drivers from OpenWRT:
  * Copyright (C) 2009 Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index ca7af6ae2c5d..2f1b96a02c29 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *	HPE WatchDog Driver
  *	based on
@@ -6,11 +7,6 @@
  *
  *	(c) Copyright 2018 Hewlett Packard Enterprise Development LP
  *	Thomas Mingarelli <thomas.mingarelli@hpe.com>
- *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	version 2 as published by the Free Software Foundation
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/iTCO_vendor_support.c b/drivers/watchdog/iTCO_vendor_support.c
index 68a9d9cc2eb8..4f1b96f59349 100644
--- a/drivers/watchdog/iTCO_vendor_support.c
+++ b/drivers/watchdog/iTCO_vendor_support.c
@@ -1,13 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	intel TCO vendor specific watchdog driver support
  *
  *	(c) Copyright 2006-2009 Wim Van Sebroeck <wim@iguana.be>.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Wim Van Sebroeck nor Iguana vzw. admit liability nor
  *	provide warranty for any of this software. This material is
  *	provided "AS-IS" and at no charge.
@@ -216,4 +212,3 @@ MODULE_AUTHOR("Wim Van Sebroeck <wim@iguana.be>, "
 MODULE_DESCRIPTION("Intel TCO Vendor Specific WatchDog Timer Driver Support");
 MODULE_VERSION(DRV_VERSION);
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 89cea6ce9a08..c559f706ae7e 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -1,13 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	intel TCO Watchdog Driver
  *
  *	(c) Copyright 2006-2011 Wim Van Sebroeck <wim@iguana.be>.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Wim Van Sebroeck nor Iguana vzw. admit liability nor
  *	provide warranty for any of this software. This material is
  *	provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/ib700wdt.c b/drivers/watchdog/ib700wdt.c
index 30d6cec582af..92fd7f33bc4d 100644
--- a/drivers/watchdog/ib700wdt.c
+++ b/drivers/watchdog/ib700wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	IB700 Single Board Computer WDT driver
  *
@@ -14,11 +15,6 @@
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/ie6xx_wdt.c b/drivers/watchdog/ie6xx_wdt.c
index 334c098b36b6..84b92d60327b 100644
--- a/drivers/watchdog/ie6xx_wdt.c
+++ b/drivers/watchdog/ie6xx_wdt.c
@@ -1,24 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *      Intel Atom E6xx Watchdog driver
  *
  *      Copyright (C) 2011 Alexander Stein
  *                <alexander.stein@systec-electronic.com>
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of version 2 of the GNU General
- *      Public License as published by the Free Software Foundation.
- *
- *      This program is distributed in the hope that it will be
- *      useful, but WITHOUT ANY WARRANTY; without even the implied
- *      warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
- *      PURPOSE.  See the GNU General Public License for more details.
- *      You should have received a copy of the GNU General Public
- *      License along with this program; if not, write to the Free
- *      Software Foundation, Inc., 59 Temple Place - Suite 330,
- *      Boston, MA  02111-1307, USA.
- *      The full GNU General Public License is included in this
- *      distribution in the file called COPYING.
- *
  */
 
 #include <linux/module.h>
diff --git a/drivers/watchdog/imgpdc_wdt.c b/drivers/watchdog/imgpdc_wdt.c
index 0fc31aadeee3..613b3e64981e 100644
--- a/drivers/watchdog/imgpdc_wdt.c
+++ b/drivers/watchdog/imgpdc_wdt.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Imagination Technologies PowerDown Controller Watchdog Timer.
  *
  * Copyright (c) 2014 Imagination Technologies Ltd.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
  * Based on drivers/watchdog/sunxi_wdt.c Copyright (c) 2013 Carlo Caione
  *                                                     2012 Henrik Nordstrom
  *
diff --git a/drivers/watchdog/intel_scu_watchdog.c b/drivers/watchdog/intel_scu_watchdog.c
index f7baf75d38c0..55d3c61b95b8 100644
--- a/drivers/watchdog/intel_scu_watchdog.c
+++ b/drivers/watchdog/intel_scu_watchdog.c
@@ -1,25 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *      Intel_SCU 0.2:  An Intel SCU IOH Based Watchdog Device
  *			for Intel part #(s):
  *				- AF82MP20 PCH
- *
- *      Copyright (C) 2009-2010 Intel Corporation. All rights reserved.
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of version 2 of the GNU General
- *      Public License as published by the Free Software Foundation.
- *
- *      This program is distributed in the hope that it will be
- *      useful, but WITHOUT ANY WARRANTY; without even the implied
- *      warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
- *      PURPOSE.  See the GNU General Public License for more details.
- *      You should have received a copy of the GNU General Public
- *      License along with this program; if not, write to the Free
- *      Software Foundation, Inc., 59 Temple Place - Suite 330,
- *      Boston, MA  02111-1307, USA.
- *      The full GNU General Public License is included in this
- *      distribution in the file called COPYING.
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/intel_scu_watchdog.h b/drivers/watchdog/intel_scu_watchdog.h
index f3ac608deb6a..a532d08bbfb2 100644
--- a/drivers/watchdog/intel_scu_watchdog.h
+++ b/drivers/watchdog/intel_scu_watchdog.h
@@ -1,25 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  *      Intel_SCU 0.2:  An Intel SCU IOH Based Watchdog Device
  *			for Intel part #(s):
  *				- AF82MP20 PCH
  *
  *      Copyright (C) 2009-2010 Intel Corporation. All rights reserved.
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of version 2 of the GNU General
- *      Public License as published by the Free Software Foundation.
- *
- *      This program is distributed in the hope that it will be
- *      useful, but WITHOUT ANY WARRANTY; without even the implied
- *      warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
- *      PURPOSE.  See the GNU General Public License for more details.
- *      You should have received a copy of the GNU General Public
- *      License along with this program; if not, write to the Free
- *      Software Foundation, Inc., 59 Temple Place - Suite 330,
- *      Boston, MA  02111-1307, USA.
- *      The full GNU General Public License is included in this
- *      distribution in the file called COPYING.
- *
  */
 
 #ifndef __INTEL_SCU_WATCHDOG_H
diff --git a/drivers/watchdog/iop_wdt.c b/drivers/watchdog/iop_wdt.c
index d910a7dec21b..fb75fe9ff1f7 100644
--- a/drivers/watchdog/iop_wdt.c
+++ b/drivers/watchdog/iop_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * drivers/char/watchdog/iop_wdt.c
  *
@@ -6,19 +7,6 @@
  *
  * Based on ixp4xx driver, Copyright 2004 (c) MontaVista, Software, Inc.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
- * Place - Suite 330, Boston, MA 02111-1307 USA.
- *
  *	Curt E Bruns <curt.e.bruns@intel.com>
  *	Peter Milne <peter.milne@d-tacq.com>
  *	Dan Williams <dan.j.williams@intel.com>
diff --git a/drivers/watchdog/kempld_wdt.c b/drivers/watchdog/kempld_wdt.c
index 543eb0f27a42..0b852db700bc 100644
--- a/drivers/watchdog/kempld_wdt.c
+++ b/drivers/watchdog/kempld_wdt.c
@@ -1,18 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Kontron PLD watchdog driver
  *
  * Copyright (c) 2010-2013 Kontron Europe GmbH
  * Author: Michael Brunner <michael.brunner@kontron.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License 2 as published
- * by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  * Note: From the PLD watchdog point of view timeout and pretimeout are
  *       defined differently than in the kernel.
  *       First the pretimeout stage runs out before the timeout stage gets
diff --git a/drivers/watchdog/ks8695_wdt.c b/drivers/watchdog/ks8695_wdt.c
index 0565cf30017b..fb572ff3181c 100644
--- a/drivers/watchdog/ks8695_wdt.c
+++ b/drivers/watchdog/ks8695_wdt.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Watchdog driver for Kendin/Micrel KS8695.
  *
  * (C) 2007 Andrew Victor
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/lantiq_wdt.c b/drivers/watchdog/lantiq_wdt.c
index 4caf02ba5d49..8013b1cd544a 100644
--- a/drivers/watchdog/lantiq_wdt.c
+++ b/drivers/watchdog/lantiq_wdt.c
@@ -1,8 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- *  This program is free software; you can redistribute it and/or modify it
- *  under the terms of the GNU General Public License version 2 as published
- *  by the Free Software Foundation.
- *
  *  Copyright (C) 2010 John Crispin <john@phrozen.org>
  *  Copyright (C) 2017 Hauke Mehrtens <hauke@hauke-m.de>
  *  Based on EP93xx wdt driver
diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
index 0e82abd71d35..751cb60b6794 100644
--- a/drivers/watchdog/lpc18xx_wdt.c
+++ b/drivers/watchdog/lpc18xx_wdt.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * NXP LPC18xx Watchdog Timer (WDT)
  *
  * Copyright (c) 2015 Ariel D'Alessandro <ariel@vanguardiasur.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
  * Notes
  * -----
  * The Watchdog consists of a fixed divide-by-4 clock pre-scaler and a 24-bit
diff --git a/drivers/watchdog/max77620_wdt.c b/drivers/watchdog/max77620_wdt.c
index 21e0f118cb86..b5450ab5a4c7 100644
--- a/drivers/watchdog/max77620_wdt.c
+++ b/drivers/watchdog/max77620_wdt.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Maxim MAX77620 Watchdog Driver
  *
  * Copyright (C) 2016 NVIDIA CORPORATION. All rights reserved.
  *
  * Author: Laxman Dewangan <ldewangan@nvidia.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/err.h>
diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
index cbb3c0dde136..c6d202d82105 100644
--- a/drivers/watchdog/mt7621_wdt.c
+++ b/drivers/watchdog/mt7621_wdt.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Ralink MT7621/MT7628 built-in hardware watchdog timer
  *
  * Copyright (C) 2014 John Crispin <john@phrozen.org>
  *
  * This driver was based on: drivers/watchdog/rt2880_wdt.c
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/watchdog/mv64x60_wdt.c b/drivers/watchdog/mv64x60_wdt.c
index c785f4f0a196..74bf7144a970 100644
--- a/drivers/watchdog/mv64x60_wdt.c
+++ b/drivers/watchdog/mv64x60_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * mv64x60_wdt.c - MV64X60 (Marvell Discovery) watchdog userspace interface
  *
@@ -9,10 +10,7 @@
  *
  * Derived from mpc8xx_wdt.c, with the following copyright.
  *
- * 2002 (c) Florian Schirmer <jolt@tuxbox.org> This file is licensed under
- * the terms of the GNU General Public License version 2. This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * 2002 (c) Florian Schirmer <jolt@tuxbox.org>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/nuc900_wdt.c b/drivers/watchdog/nuc900_wdt.c
index f36eae34e848..ad3d5046a76b 100644
--- a/drivers/watchdog/nuc900_wdt.c
+++ b/drivers/watchdog/nuc900_wdt.c
@@ -1,12 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2009 Nuvoton technology corporation.
  *
  * Wan ZongShun <mcuos.com@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation;version 2 of the License.
- *
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/watchdog/nv_tco.h b/drivers/watchdog/nv_tco.h
index c2d1d04e055b..d325e528010f 100644
--- a/drivers/watchdog/nv_tco.h
+++ b/drivers/watchdog/nv_tco.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  *	nv_tco:	TCO timer driver for nVidia chipsets.
  *
@@ -10,11 +11,6 @@
  *	Reserved.
  *				http://www.kernelconcepts.de
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither kernel concepts nor Nils Faerber admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/octeon-wdt-main.c b/drivers/watchdog/octeon-wdt-main.c
index 0ec419a3f7ed..fde9e739b436 100644
--- a/drivers/watchdog/octeon-wdt-main.c
+++ b/drivers/watchdog/octeon-wdt-main.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Octeon Watchdog driver
  *
@@ -10,22 +11,12 @@
  *	(c) Copyright 1996-1997 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
  *
  *	(c) Copyright 1995    Alan Cox <alan@lxorguk.ukuu.org.uk>
  *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- *
  * The OCTEON watchdog has a maximum timeout of 2^32 * io_clock.
  * For most systems this is less than 10 seconds, so to allow for
  * software to request longer watchdog heartbeats, we maintain software
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index d49688d93f6a..9b91882fe3c4 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * omap_wdt.c
  *
@@ -6,10 +7,7 @@
  * Author: MontaVista Software, Inc.
  *	 <gdavis@mvista.com> or <source@mvista.com>
  *
- * 2003 (c) MontaVista Software, Inc. This file is licensed under the
- * terms of the GNU General Public License version 2. This program is
- * licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * 2003 (c) MontaVista Software, Inc.
  *
  * History:
  *
diff --git a/drivers/watchdog/omap_wdt.h b/drivers/watchdog/omap_wdt.h
index 42f31ec5e90d..950b4643f3e7 100644
--- a/drivers/watchdog/omap_wdt.h
+++ b/drivers/watchdog/omap_wdt.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  *  linux/drivers/char/watchdog/omap_wdt.h
  *
@@ -5,26 +6,6 @@
  *      OMAP Watchdog timer register definitions
  *
  *  Copyright (C) 2004 Texas Instruments.
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- *  THIS  SOFTWARE  IS PROVIDED   ``AS  IS'' AND   ANY  EXPRESS OR IMPLIED
- *  WARRANTIES,   INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES OF
- *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
- *  NO  EVENT  SHALL   THE AUTHOR  BE    LIABLE FOR ANY   DIRECT, INDIRECT,
- *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *  NOT LIMITED   TO, PROCUREMENT OF  SUBSTITUTE GOODS  OR SERVICES; LOSS OF
- *  USE, DATA,  OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
- *  ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
- *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- *  You should have received a copy of the  GNU General Public License along
- *  with this program; if not, write  to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #ifndef _OMAP_WATCHDOG_H
diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
index ca21d6c240a3..2af1a8b3f973 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *      NS pc87413-wdt Watchdog Timer driver for Linux 2.6.x.x
  *
@@ -6,11 +7,6 @@
  *      (C) Copyright 2006 Sven Anders, <anders@anduras.de>
  *                     and Marcus Junker, <junker@anduras.de>
  *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of the GNU General Public License
- *      as published by the Free Software Foundation; either version
- *      2 of the License, or (at your option) any later version.
- *
  *      Neither Sven Anders, Marcus Junker nor ANDURAS AG
  *      admit liability nor provide warranty for any of this software.
  *      This material is provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/pcwd_pci.c b/drivers/watchdog/pcwd_pci.c
index 5773d2591d3f..e30c1f762045 100644
--- a/drivers/watchdog/pcwd_pci.c
+++ b/drivers/watchdog/pcwd_pci.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Berkshire PCI-PC Watchdog Card Driver
  *
@@ -10,11 +11,6 @@
  *	  Matt Domsch <Matt_Domsch@dell.com>,
  *	  Rob Radez <rob@osinvestor.com>
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Wim Van Sebroeck nor Iguana vzw. admit liability nor
  *	provide warranty for any of this software. This material is
  *	provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 5de6182dae33..6727f8ab2d18 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Berkshire USB-PC Watchdog Card Driver
  *
@@ -10,11 +11,6 @@
  *	  Rob Radez <rob@osinvestor.com>,
  *	  Greg Kroah-Hartman <greg@kroah.com>
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Wim Van Sebroeck nor Iguana vzw. admit liability nor
  *	provide warranty for any of this software. This material is
  *	provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/pnx4008_wdt.c b/drivers/watchdog/pnx4008_wdt.c
index 124b1c66dc29..7b446b696f2b 100644
--- a/drivers/watchdog/pnx4008_wdt.c
+++ b/drivers/watchdog/pnx4008_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * drivers/char/watchdog/pnx4008_wdt.c
  *
@@ -11,10 +12,6 @@
  * 2005-2006 (c) MontaVista Software, Inc.
  *
  * (C) 2012 Wolfram Sang, Pengutronix
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index aa750d8e5045..c8416a03bc2d 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -1,15 +1,5 @@
-/* Copyright (c) 2014, The Linux Foundation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 and
- * only version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2014, The Linux Foundation. All rights reserved. */
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
diff --git a/drivers/watchdog/retu_wdt.c b/drivers/watchdog/retu_wdt.c
index 39cd51df2ffc..258dfcf9cbda 100644
--- a/drivers/watchdog/retu_wdt.c
+++ b/drivers/watchdog/retu_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Retu watchdog driver
  *
@@ -5,15 +6,6 @@
  *
  * Based on code written by Amit Kucheria and Michael Buesch.
  * Rewritten by Aaro Koskinen.
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License. See the file "COPYING" in the main directory of this
- * archive for more details.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
  */
 
 #include <linux/slab.h>
diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
index 21fcb36f9074..b91813864487 100644
--- a/drivers/watchdog/rn5t618_wdt.c
+++ b/drivers/watchdog/rn5t618_wdt.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Watchdog driver for Ricoh RN5T618 PMIC
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/device.h>
diff --git a/drivers/watchdog/rt2880_wdt.c b/drivers/watchdog/rt2880_wdt.c
index 905e60f45eec..6a65e8cee036 100644
--- a/drivers/watchdog/rt2880_wdt.c
+++ b/drivers/watchdog/rt2880_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Ralink RT288x/RT3xxx/MT76xx built-in hardware watchdog timer
  *
@@ -5,10 +6,6 @@
  * Copyright (C) 2013 John Crispin <john@phrozen.org>
  *
  * This driver was based on: drivers/watchdog/softdog.c
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
index bfa035e1a75e..cbd8c957182f 100644
--- a/drivers/watchdog/sa1100_wdt.c
+++ b/drivers/watchdog/sa1100_wdt.c
@@ -1,14 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Watchdog driver for the SA11x0/PXA2xx
  *
  *	(c) Copyright 2000 Oleg Drokin <green@crimea.edu>
  *	    Based on SoftDog driver by Alan Cox <alan@lxorguk.ukuu.org.uk>
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Oleg Drokin nor iXcelerator.com admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/sbc7240_wdt.c b/drivers/watchdog/sbc7240_wdt.c
index efc81b318939..12cdee7d5069 100644
--- a/drivers/watchdog/sbc7240_wdt.c
+++ b/drivers/watchdog/sbc7240_wdt.c
@@ -1,19 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *	NANO7240 SBC Watchdog device driver
  *
  *	Based on w83877f.c by Scott Jennings,
  *
- *	This program is free software; you can redistribute it and/or modify
- *	it under the terms of the GNU General Public License version 2 as
- *	published by the Free Software Foundation;
- *
- *	Software distributed under the License is distributed on an "AS IS"
- *	basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *	implied. See the License for the specific language governing
- *	rights and limitations under the License.
- *
  *	(c) Copyright 2007  Gilles GIGAN <gilles.gigan@jcu.edu.au>
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/sbc8360.c b/drivers/watchdog/sbc8360.c
index 3396024e7b76..4f8b9912fc51 100644
--- a/drivers/watchdog/sbc8360.c
+++ b/drivers/watchdog/sbc8360.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	SBC8360 Watchdog driver
  *
@@ -19,11 +20,6 @@
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 3219422f67a9..fb4e1beea166 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * SBSA(Server Base System Architecture) Generic Watchdog driver
  *
@@ -7,15 +8,6 @@
  *         Al Stone <al.stone@linaro.org>
  *         Timur Tabi <timur@codeaurora.org>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License 2 as published
- * by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  * ARM SBSA Generic Watchdog has two stage timeouts:
  * the first signal (WS0) is for alerting the system by interrupt,
  * the second one (WS1) is a real hardware reset.
diff --git a/drivers/watchdog/sch311x_wdt.c b/drivers/watchdog/sch311x_wdt.c
index ed6e9fac5d74..3612f1df381b 100644
--- a/drivers/watchdog/sch311x_wdt.c
+++ b/drivers/watchdog/sch311x_wdt.c
@@ -1,14 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	sch311x_wdt.c - Driver for the SCH311x Super-I/O chips
  *			integrated watchdog.
  *
  *	(c) Copyright 2008 Wim Van Sebroeck <wim@iguana.be>.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Wim Van Sebroeck nor Iguana vzw. admit liability nor
  *	provide warranty for any of this software. This material is
  *	provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 060740625485..3e4885c1545e 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -1,14 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	SoftDog:	A Software Watchdog Device
  *
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *							All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/txx9wdt.c b/drivers/watchdog/txx9wdt.c
index fcb4da5b1f4c..1c6904bd71dd 100644
--- a/drivers/watchdog/txx9wdt.c
+++ b/drivers/watchdog/txx9wdt.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * txx9wdt: A Hardware Watchdog Driver for TXx9 SoCs
  *
  * Copyright (C) 2007 Atsushi Nemoto <anemo@mba.ocn.ne.jp>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/w83627hf_wdt.c b/drivers/watchdog/w83627hf_wdt.c
index 3a49ba9ea608..38b31e9947aa 100644
--- a/drivers/watchdog/w83627hf_wdt.c
+++ b/drivers/watchdog/w83627hf_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	w83627hf/thf WDT driver
  *
@@ -17,11 +18,6 @@
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/wafer5823wdt.c b/drivers/watchdog/wafer5823wdt.c
index 0a8073b419f8..6d2071a0590d 100644
--- a/drivers/watchdog/wafer5823wdt.c
+++ b/drivers/watchdog/wafer5823wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	ICP Wafer 5823 Single Board Computer WDT driver
  *	http://www.icpamerica.com/wafer_5823.php
@@ -13,11 +14,6 @@
  *	(c) Copyright 1996-1997 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index cf3247224a6e..21e8085b848b 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	watchdog_core.c
  *
@@ -16,11 +17,6 @@
  *	  Satyam Sharma <satyam@infradead.org>
  *	  Randy Dunlap <randy.dunlap@oracle.com>
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox, CymruNet Ltd., Wim Van Sebroeck nor Iguana vzw.
  *	admit liability nor provide warranty for any of this software.
  *	This material is provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
index 86ff962d1e15..a5062e8e0d13 100644
--- a/drivers/watchdog/watchdog_core.h
+++ b/drivers/watchdog/watchdog_core.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  *	watchdog_core.h
  *
@@ -16,11 +17,6 @@
  *	  Satyam Sharma <satyam@infradead.org>
  *	  Randy Dunlap <randy.dunlap@oracle.com>
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox, CymruNet Ltd., Wim Van Sebroeck nor Iguana vzw.
  *	admit liability nor provide warranty for any of this software.
  *	This material is provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index edfb884044e0..dbd2ad4c9294 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	watchdog_dev.c
  *
@@ -20,11 +21,6 @@
  *	  Satyam Sharma <satyam@infradead.org>
  *	  Randy Dunlap <randy.dunlap@oracle.com>
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox, CymruNet Ltd., Wim Van Sebroeck nor Iguana vzw.
  *	admit liability nor provide warranty for any of this software.
  *	This material is provided "AS-IS" and at no charge.
diff --git a/drivers/watchdog/wd501p.h b/drivers/watchdog/wd501p.h
index 0e3a497d5626..43a4d88fd363 100644
--- a/drivers/watchdog/wd501p.h
+++ b/drivers/watchdog/wd501p.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0+ */
 /*
  *	Industrial Computer Source WDT500/501 driver
  *
@@ -11,12 +12,7 @@
  *
  *	http://www.cymru.net
  *
- *	This driver is provided under the GNU General Public License,
- *	incorporated herein by reference. The driver is provided without
- *	warranty or support.
- *
  *	Release 0.04.
- *
  */
 
 
diff --git a/drivers/watchdog/wdt.c b/drivers/watchdog/wdt.c
index 3d2f5ed60e88..0650100fad00 100644
--- a/drivers/watchdog/wdt.c
+++ b/drivers/watchdog/wdt.c
@@ -1,14 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Industrial Computer Source WDT501 driver
  *
  *	(c) Copyright 1996-1997 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
index ff3a41f47127..66303ab95685 100644
--- a/drivers/watchdog/wdt_pci.c
+++ b/drivers/watchdog/wdt_pci.c
@@ -1,14 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *	Industrial Computer Source PCI-WDT500/501 driver
  *
  *	(c) Copyright 1996-1997 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
  *	warranty for any of this software. This material is provided
  *	"AS-IS" and at no charge.
-- 
2.7.4

