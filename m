Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94AF1F931
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 May 2019 19:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfEORPK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 May 2019 13:15:10 -0400
Received: from mout.gmx.net ([212.227.15.15]:37091 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbfEORPJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 May 2019 13:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1557940479;
        bh=Nr3h1+y4CIbQ5dWtN97akntOP5NuL28h1LY/fjhmquw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=ID2evJrKjBHz2LRgYwhzkqjNSXgc7MPS7EZUthir6++AV2j7lGqyxlsIOx26/YbR7
         iVZ50S/QsjenlSTUW/Ro7nLYnyvVps5tmNhlVf3+ChsdcJh0/pZx68mtyuPyeFxX66
         /TRGT4n9xSczVFHd3P9Ddww1ZsBybI7Isll8Mb+s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.144]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDywo-1hYhFD37Cu-009vYa; Wed, 15 May 2019 19:14:39 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Eric Anholt <eric@anholt.net>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] watchdog: bcm2835_wdt: Fix module autoload
Date:   Wed, 15 May 2019 19:14:18 +0200
Message-Id: <1557940458-8661-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:TsA9YOEJPGxTelJ7VCsYWR6sqtVxZ1Z1wLmBOSBPmP0CX8mJ/wl
 +GerF/0Gn3JfN0MnZEm3GV/JWHngw4KbzIghCRPSaynzprPuHwrhFFxMoWphAOjAE/biPmC
 2uYNpdA1BurCxRjjDMEGwDgih2xMAPmr9H3xiKcIelOrBjDCh30fb76JQYM2Xe0ATikuZpH
 4Xes11UA5xa6OibOVpXLg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4GIwKZnNH0U=:FqJ0Y9sew2VI1/fkNpFIRZ
 OVsbFWGC76tApBT9treKz2zgyGuby6mpyFKxHwDp9CgHGfv+zBjzMEpAM98ilYpgEjLLA0CP+
 o0P9bnDQxnLi/TXxlvaY99S8zH1/TaBVNln7d4pguhb/fv6vahPlrXizql0SCOGpeOrLZJ6r9
 29JLpPGg9A8s6PGEkbhKRy4+drIXGQ9pZMtz2P0dlc1Jh5PeeoLtl3AtalJYscf4OuaVvNqwm
 tqhJTz9s6VuW5IG90y0qxWjOZAJLXgKnBTZ8P8UYD+08rbVd9XdSZsUQQkGEhhIjdihseHAV5
 e3iZDCYRNeKdIP8cN4FoAY04JnztxEYc1+79g7ETJsW/cqc/tAn0QJasaMVgWpJ4frS2zwLkG
 Er0syyXsbrTfb5znc0zUq7WfabjQFWSnBuaY3erSLaKlwfgHz9V5Pb1UhhXrm0aQoDT053Jq6
 ok/+zHsu4WqwyhBBjVHkLQJxdq7EcYYFgcLh1KWC8tSJmf4z683Nozc60WN5U68GSLBEeRKwX
 EabEgeosjbEt4iLsX4HvfuONcrlEgAYJ90uznJO9o/k5ZtP7T72mEPNcLHiC5/Zyz275nG95b
 fB1q6+H7aVwW+CPo3F4KT74Ycqns18ve32TyLnJrHtp08cI81GgEPAOo1PcOAV11CET/IT/KN
 8tKRT4tQoAa+nticuPFB43cKC/2NLZ0RSBNL7bkyjztTWCzOdjaTCiucrUT690wduXnQjawWC
 txGCx9bIRInXBucs+jgV1KUgKQtEA/lZ9EUB7TiNrCypnrQFKS+n/HPRIXxCXzg81ggk4dBpj
 5JdNn4IUX5F94zKRMWnHEDHtDJkVtUz0lrmj/CJpIv1cEVA1zJQNSDsOnxIwmTo6Quxc7zCRR
 Ft2z0WHw6MK6c+MFS05ukWcC+x68Lm5/oNYIbtiPzFRCmSqh36nvrBSmhZOavE
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The commit 5e6acc3e678e ("bcm2835-pm: Move bcm2835-watchdog's DT probe
to an MFD.") broke module autoloading on Raspberry Pi. So add a
module alias this fix this.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/watchdog/bcm2835_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt=
.c
index 1834524..c7695a0 100644
=2D-- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -241,6 +241,7 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (defa=
ult=3D"
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");

+MODULE_ALIAS("platform:bcm2835-wdt");
 MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
 MODULE_DESCRIPTION("Driver for Broadcom BCM2835 watchdog timer");
 MODULE_LICENSE("GPL");
=2D-
2.7.4

