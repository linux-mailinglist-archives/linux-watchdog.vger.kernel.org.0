Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2243AA30A
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jun 2021 20:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhFPSTe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Jun 2021 14:19:34 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:53657 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhFPSTa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Jun 2021 14:19:30 -0400
Received: from orion.localdomain ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MSckp-1lipfY1QCX-00SvL1; Wed, 16 Jun 2021 20:17:09 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 1/2] watchdog: iTCO_wdt: use pm_ptr()
Date:   Wed, 16 Jun 2021 20:17:07 +0200
Message-Id: <20210616181708.19530-1-info@metux.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6DJzhz40a7wQjQkPatjTk5KWsym7XND8yH1E6Ro84tKwozaVELh
 yZAL+kIpXMfWSfiM4rEveYH28tp3+M9sGslwhuHg2lsiDgphItJDhvgpGmcGN3AmJ4YLZoJ
 D3hiPH0wx/n0iDcAPQPJPSStqWpmkuPsRnW06RMGqAC27uIN0Xxuf4tC7a1yazbGrD9Bl2E
 8aRCHTXGEhOxx0iIxjuGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nPEtIBGVxYM=:VSaMvefL3JWlaeh5q6nHm0
 sUvOBAqr6v40unvAGD0gr6MpgT862CeSUF0/SUogU2nGddZ3Oj+jTFZMrelRS7qBjzFBGlAAz
 B0JWFLyUujPI4L7xIGymq8zc8lXUbxfBi2aVVtGIfDVAw2Pbw+u6ABM28xbwo0D3+d7yNPgU9
 28HffE5BtHFbaNlRS8YGRACMNUyNFJrnRMZxE8bAppMTWqnp+MQnLJAMmhS/7APF30FMbgiTc
 SvTG4i1mu78khfrqBrpszXv1iYtLDfQpMcuu5jm3PC1GfJuKVMIrTavbkRGtc8FUGhEC4w6dX
 hnWaKu5lSTDLEuuoJ7SMvzHt8XTrpvkhOyETww4TkPziszGJqFBOMsQRTCxNXKGKm3zv1y2wM
 aD2gcEdI3HjkhBW0oLTMUEMd4JzO9+7Zfg/6fWBdgJGE5heuzudtc3TAXVqKnEwX7pYN+X5TQ
 KGcxe56ZIYc92TdsrTKHPG/LdiEvpLfmusf4f8z8cWEJ1IRbocvU3vs1MMET9/FO9TVVVXHUD
 jP8vtFVZeoBebGmadto1TU=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Reduce a little bit of boilerplate by using pm_ptr().

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/watchdog/iTCO_wdt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index bf31d7b67a69..6ba2b2f60737 100644
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
2.20.1

