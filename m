Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB6C7E2905
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 16:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbjKFPtS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 10:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjKFPtS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 10:49:18 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704E4C9
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 07:49:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qD-0007h7-4a; Mon, 06 Nov 2023 16:48:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-0074pI-CD; Mon, 06 Nov 2023 16:48:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-00Dn7l-2k; Mon, 06 Nov 2023 16:48:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 0/5] watchdog: Drop platform_driver_probe() and convert to platform remove callback returning void (part II)
Date:   Mon,  6 Nov 2023 16:48:08 +0100
Message-ID: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CsAAXZNfJagYUNn9G20OK8DcPy3GbXjNMDl1T3VSBYQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSQq3aUszaj3irVk4cMap4zE+bCpxad780bIG4 3QZVmi9wpyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkKtwAKCRCPgPtYfRL+ TgRfB/oDmIgi03zoEKPaCUBxzxR+pVxsVJEghmbFYqG6Gksf8sRf0Ya7nwonZJP5VL3BEUbubr7 f8gZ0LP9tOFtCI95/WCJqvFNRpj/gGUsL8XgFgTcHi1d25NBzaJ9BP6J+uDavCMt4jSFg+FINyt rbVtjF2uG/1sG0Gkoja/wCpGH1NTxb/x0tFFJ2bgl+pZGfzL+FXMFcRWr+1lNVCzI1j90qR7+zl CKjm70zCOlPcDLu9RPTCey2LgMJqSQZApTijn4Q8tN5+nVELVn71AYD1OiY3n6ov28jnUPIzck8 qMd9TKQQLgYnR5YQs3cIcskmI4kIfM2AFZYM082YxXQRS2bY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

there are two different types of patches here that would justify to
different series. But as the patches are not independent I chose to put
them in a single series.

The first two patches drop usage of platform_driver_probe(). This is a
concept that isn't so relevant any more today. I didn't check, but it
saves typically only a few 100k and there are thoughts to deprecate it
to simplify the core. Getting the usage right is not trivial though the
drivers here got it nearly right. The alternative to these patches is to
add __refdata to the driver struct ideally with a comment describing the
need like is e.g. done in commit 5b44abbc39ca ("platform/x86: hp-wmi::
Mark driver struct with __refdata to prevent section mismatch warning").
Note that the warning only happens starting with commit f177cd0c15fc
("modpost: Don't let "driver"s reference .exit.*") that is expected to
be part of v6.7-rc1.

The remaining three patches convert the platform drivers to
.remove_new(), see commit 5c5a7680e67b ("platform: Provide a remove
callback that returns no value") for an extended explanation and the
eventual goal. Some time ago I already did this to watchdog drivers, but
I missed the at91sam9_wdt and txx9wdt driver, because my coccinelle
patch failed to detect these as patch opportunities (because of the
__exit_p annotation). the starfive-wdt driver is new since then.

Best regards
Uwe

Uwe Kleine-König (5):
  watchdog: at91sam9: Stop using module_platform_driver_probe()
  watchdog: txx9: Stop using module_platform_driver_probe()
  watchdog: at91sam9_wdt: Convert to platform remove callback returning
    void
  watchdog: starfive-wdt: Convert to platform remove callback returning
    void
  watchdog: txx9wdt: Convert to platform remove callback returning void

 drivers/watchdog/at91sam9_wdt.c | 12 +++++-------
 drivers/watchdog/starfive-wdt.c |  6 ++----
 drivers/watchdog/txx9wdt.c      | 11 +++++------
 3 files changed, 12 insertions(+), 17 deletions(-)

base-commit: 3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
-- 
2.42.0

