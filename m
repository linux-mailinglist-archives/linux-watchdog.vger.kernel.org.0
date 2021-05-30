Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C0C395047
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 11:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhE3J23 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 05:28:29 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40473 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhE3J20 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 05:28:26 -0400
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6bwO-1lLJgV48Kc-017zow; Sun, 30 May 2021 11:26:26 +0200
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
Subject: [PATCH 6/6] arm64: dts: broadcom: Add reference to RPi 400
Date:   Sun, 30 May 2021 11:26:15 +0200
Message-Id: <1622366775-5309-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:q/IbM1RlSms3sEeZn3zRYhinPp/899xwqhVcoiG5y1OBVgwsH6O
 e7PYL8xAInkdBGzu1pOE39H3F6P9naNEqYuwAc2mpB1xyVd5yvqvtTi658nyWWz/82oD93a
 3pkVyQzPykdSjEGnG44qgyV2CFFgG/9NvEtNjADpNfOqWDnJ5sUAZ4jUIhhg8Vrjwyaj2jX
 qIWusPryam50OJwErfRZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mju3w2jQjGc=:3jeTML6iMxctlGtCXzoSbA
 zwlvr5OyBCNqFLSUOhJ/T9zgQMAH6EOsUeqY5HiuWTYdGgVnVt9hGuRNVie2LZPEh3BGfM3T6
 OqE0716A90G4quNQ7SamvcvomRKgtNRMwamzKI/huIOUbOG4/l+b0gBTscn/w51XsG+vk0eNW
 eTs/GaWkNk9uvmzGmoyn71cwVQK+yF0F0/4/XbaJKScptNnuoqkmEaoIafFwHD/c/5GEAjE3K
 PTFM3oxkCN5cW/UNLVHl+305m1HrqMaeWnLRY3GTm207x/weU0iGoTMfRxnw2BbJaqqYGCNDC
 iIsqV+8//ToAobliW5LFFMr1T15l3PSdWaolSVr5WcS1JxB8yBJKE5y1lNVknMUTfYXjsYLh/
 oCvsi1B+sQKJD66agRWgCW1JHtTxVWiDI9aS/6ceoWvH3+i2KsZ8W3HweNKdE4Y7583atVle0
 nS62CzSjpjRgMiGP0slRljV2RAa91HZ8aDpO+/cx+cq74PfrQf7syfLwxTX6979YRCZAj8Cmf
 chqmXcWOYgNcmADcGiAkbA=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds a reference to the dts of the Raspberry Pi 400,
so we don't need to maintain the content in arm64.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
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

