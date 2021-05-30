Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42F039503D
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 11:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhE3J2Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 05:28:24 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:46035 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhE3J2Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 05:28:24 -0400
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4rHF-1lnYxU3Tdv-00237j; Sun, 30 May 2021 11:26:23 +0200
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
Subject: [PATCH 2/6] watchdog: bcm2835_wdt: consider system-power-controller property
Date:   Sun, 30 May 2021 11:26:11 +0200
Message-Id: <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:znMLKDa+F9vbUNC4d6v6cN23njiteUY11YM6VToN2SKxyQaAFDm
 iTgrXwtbB9aJUYqQrtheGOaIsy2rJbndQA38ZQPOG7Tqlz6Wa2IYlwgvkAGMh4QuL2Zf4AQ
 AIPJwB6oqF19LE7kXL9/jKRIeldK7EQ3hdUgLWJX9HkI+Mb72JOg0L0j1JqdqnrDMod+Huc
 /8uVLBTmlK9Jh6NwV9KpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nt1DezL2uzU=:726DgPyLW1LjrTWqlvHfkH
 M9eRW5E7YgdDh1RXYl2r2zezeRqNayb6YyWhLi5ffRFw/6ug9JO6SRayGEXkvoKRU3CJxawug
 wACu3WwADz3CueN+56f9ooKWxY2m/ZGKJeQPKBPX84uuAHwLm37ibNb6sdF9qixT3I6DseHMu
 88qCeG3lZaVFDRUnC/x6WCi4DNt/CiwPwBNUStR+B9y6+Z20xTXaaZr0SHjUg/2y/JS+Sp5ji
 nEuhMtVkaCIm9a2kg5apBYPgjQ9HBgUwhtL4LCVSzZyh6+TCpLFLWK9GbLyhrQczyfKXfrkPr
 qC2SyIRYMnG1vs2GbWSaKlM9iXoJhxEnSkyiq3lVfE7ISFzrjBOWqPVMaXNN2qbN1a+3o+XU5
 C4cZd7N5idCliwNztdjVsQaVOiAxXqco9Z9aDnEEu3QKMd19JMrvI4PvbE8ylDbe4ydMwtgNp
 Q+eYfvlc6eAExORK80rSxEnlSPy0XT9zFFE+FQi8qLgGyAJi28jz66AAAATKyXZT9gm5qYf4p
 Bszo+ubYLJQli38vRUs6dU=
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

