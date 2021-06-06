Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8158E39CEFD
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Jun 2021 14:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFFMSx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Jun 2021 08:18:53 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:59203 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhFFMSv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Jun 2021 08:18:51 -0400
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4b5s-1lpJTP14fG-001gEM; Sun, 06 Jun 2021 14:16:37 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 7/7] arm64: dts: broadcom: Add reference to RPi 400
Date:   Sun,  6 Jun 2021 14:16:17 +0200
Message-Id: <1622981777-5023-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:yQabTqkX47ibDNJg4fwGitdfVsJvfe3A8a/9Q17mnamUZCUWQD+
 7uuOMkf4ZjSUPT8dwp9Aevg2o4CVeCNByyza3MEmZ0kTixP4SB4kbSBeX88RQjpLRlGyjvf
 0eiSAXv816T4jzTXOzRsfYsbWvgTl9pJcusI3jqwQ/cxfwR14Np+9i48Mc0k7/F5lVmuiRm
 u79E49GcIYcyKP2hIQLYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:age9Y4juz4M=:xKIjLn2ZqpPYY+UCVH1snQ
 t/NYA5TLET0jglDSd1zF/3HJVjCx/nevPejwPXUI4uMhW9ka6S2Lv4I6PCIwlMV9CoFceHfKH
 i3Umf4GKUbahxwHLJkvJIR7Dhb/0LjKigIxzGZp9FIEg2bhbsEQF5yDbzSf8vjf3oxq7Dyn/a
 DQxDNaWu945l1u4epTAMXg2y5ISauvSJogks/g8GYPNV4IyhYEFPPNx2vQmVI4Qjmbk5SsYgr
 gFmYbpIu7lDJjYNs814GBDAGAl2/c5eaEl8fDfFGhhD3X3n0COokR/UCWIcBmqTrlZcgLQl5Z
 6Pyc+tEMGL/7LwgTGOMdkNec1RGEXYheo2Rm/rTUBtg/uOfBhY/jjKBWEGVR4C9epx6t80SQT
 c33B4zsGoz4uorHK6X2ds/2gFjwWRvxDMQWe6RVbHJh2TfYU/8dchXG4fxg1sQHvT/Nn/r2UI
 +mVqeBhqBXS8QJmb4X/YO1kIj+ByLHWxDkXPcV88CqYMGFW1TgQMYsw5EdtxUtPi8XfLizmga
 4OSPBR9RGY9z+zyEc1QBak=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds a reference to the dts of the Raspberry Pi 400,
so we don't need to maintain the content in arm64.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
---
 arch/arm64/boot/dts/broadcom/Makefile            | 3 ++-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 998e240..11eae3e 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-4-b.dtb \
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
+			      bcm2711-rpi-4-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts
new file mode 100644
index 0000000..b9000f5
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "arm/bcm2711-rpi-400.dts"
-- 
2.7.4

