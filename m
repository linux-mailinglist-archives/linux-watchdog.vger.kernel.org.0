Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBC72B6893
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Nov 2020 16:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387597AbgKQPWb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 17 Nov 2020 10:22:31 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:53769 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729290AbgKQPWa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 17 Nov 2020 10:22:30 -0500
Received: from orion.localdomain ([95.118.38.12]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N3bnP-1kDZxM3eYV-010b8c; Tue, 17 Nov 2020 16:22:15 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 3/3] watchdog: iTCO_wdt: use pm_ptr()
Date:   Tue, 17 Nov 2020 16:22:14 +0100
Message-Id: <20201117152214.32244-3-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117152214.32244-1-info@metux.net>
References: <20201117152214.32244-1-info@metux.net>
X-Provags-ID: V03:K1:ILCqRf3Jr5YSFwKCf+KSsS7EMZOJHiq2iNx/dWYxG3v2258Gn/9
 Tb0RcmbsCI+co0XqoUX4oVhJwUGdAIo2UotZdESAoL9/DmbcT+WBXP4g0Z1om9q5QjywIrp
 QOV2FbmPNRADMxULVrBlMMvAa8r9qaMrPPkQWHDEfoVFssoM1ubA50RQu/h/8BGeEc0nrJ3
 HLeUaj8YYEFXjm/UuWTPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:em3U6ChGRT4=:gRnQ+ndIpM62BzitS4Aizo
 WlBq9iDx+lQ2nHLvo1EANzLA2OfTf0y/+ZqFouLMJWQkR+Rb4yboBv6zN0xHOuSU74ysU6rCz
 l4Mx+0FYUld9uoblLucUIsb8x2ad2QCuYpkfbHae4IjkybS6KzJI40Ts/N8BzC/JQTUp316vT
 rT2sWBUd5Rs9f8vtBzA1n/4nwkNfbi4GDlMxrBw7t923hsPl2i6HBEDwkAV2DqeYpDKRuiR8L
 ZcrTx86Jwi1eGl566B2BdxK/vr1A0+74mfZU0jDe/Kk60XYhu5cl8N7EWJ8+qomkgG7dKB6au
 CQdfmQvofpxTR+6V6lBqstsX/Tt7XDJgAH6vC+HrMD+ilqXJYznAY4nYaS5Ogsk0O2afo48w9
 w52JlsuBx+Xh9TPNUvMcdS/0sZN0Fwp0OLdOYvEePokHaHKH/7+aJz2rhm2gI
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Reduce a little bit of boilerplate by using pm_ptr().

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/watchdog/iTCO_wdt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index edc588a06ae6..660fc262fbc0 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -636,16 +636,13 @@ static const struct dev_pm_ops iTCO_wdt_pm = {
 	.resume_noirq = iTCO_wdt_resume_noirq,
 };
 
-#define ITCO_WDT_PM_OPS	(&iTCO_wdt_pm)
-#else
-#define ITCO_WDT_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP */
 
 static struct platform_driver iTCO_wdt_driver = {
 	.probe          = iTCO_wdt_probe,
 	.driver         = {
 		.name   = DRV_NAME,
-		.pm     = ITCO_WDT_PM_OPS,
+		.pm     = pm_ptr(&iTCO_wdt_pm),
 	},
 };
 
-- 
2.11.0

