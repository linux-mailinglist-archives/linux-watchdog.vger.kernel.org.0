Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F251739CEF9
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Jun 2021 14:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhFFMSw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Jun 2021 08:18:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44261 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhFFMSt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Jun 2021 08:18:49 -0400
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MhDAi-1lCfGy1a0A-00eIIg; Sun, 06 Jun 2021 14:16:34 +0200
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
Subject: [PATCH V2 2/7] watchdog: bcm2835_wdt: consider system-power-controller property
Date:   Sun,  6 Jun 2021 14:16:12 +0200
Message-Id: <1622981777-5023-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:JLFyycZklyBchyUrgJGZAF2eo3x4PcQVRd297F7Spm5BBfxjS2b
 gjQ3mArwYloncUSL7Wakf6N97pDYIihP+p+IZRpTZ6GVFwbjG84Uk5eyVskJJjuZtvhaYEF
 yW+Z/8p1lNoT1PtutMj5SuvN9jDnrl/aRbNNMrckjiB6iQah0XzR9Cb3w23LnYGbcyqFK+N
 e0/OIc5dRKglnR3AxHdbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FaJCMb7rKRU=:VKCnjO8P/nMCBFiukRtEtK
 DJl2v8kSBKSY0KxrT+UpsTpRUGOf4davDQZYs8vYKl09ou7GSUftFKcpwXkyB8/pg1kuJxgtp
 GVYCzWPUfdGqo+4ofi9OuTawFP2Yy31wr7+Xl4UYIrS2TZmVMD3aPfPPZc5vwIPp1hY+s9wpI
 7tqbnO1CeFzbJFAXB8kRzZjAwv84Elh4lvyA9mvC3z7O+yQUuSWdZ3yvTkVo2O8ru9snBEC13
 H+nRKBzHpt3yCpbnrdrV7o0srqkvJJKjDJ2R+cPFTu9OQ9Vy3MsYx1fLfdv1krRXWltDUBD36
 6ALznBX1yxZuuNFg9/AxlpwVCi+aSdDPLKFILoyM01kb/4Vpx3HtFvpMLqv6Li619hES3OsYo
 A6I6L0IQWbTa8i5DQ151gFKX/4OPDJP+cM3Kq2iF80VWpy/f6m1/rqkqqQELjWtbJI6q/c09I
 0+9q50E3ajcqlb5wjtemqja9SHhNBqLChVRsUxXtwbd1jjWBmh3DjbWy2DOWbcMTcDBvfUwcu
 X8gIAL+Qq2KlA36r41NL8I=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Until now all Raspberry Pi boards used the power off function of the SoC.
But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
possibly cannot register the poweroff handler because the it's
already registered by this watchdog driver. So consider the
system-power-controller property for registering, which is already
defined in soc/bcm/brcm,bcm2835-pm.txt .

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index dec6ca0..9490717 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	if (pm_power_off == NULL) {
-		pm_power_off = bcm2835_power_off;
-		bcm2835_power_off_wdt = wdt;
+	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
+		if (!pm_power_off) {
+			pm_power_off = bcm2835_power_off;
+			bcm2835_power_off_wdt = wdt;
+		} else {
+			dev_info(dev, "Poweroff handler already present!\n");
+		}
 	}
 
 	dev_info(dev, "Broadcom BCM2835 watchdog timer");
-- 
2.7.4

