Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 767796AA179
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbjCCVh4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjCCVhs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:48 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905E862D8A
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:47 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-0008Uu-MS; Fri, 03 Mar 2023 22:37:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5n-001eA0-QH; Fri, 03 Mar 2023 22:37:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5n-001wx7-4V; Fri, 03 Mar 2023 22:37:31 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Doug Anderson <dianders@chromium.org>,
        Leela Krishna Amudala <leela.krishna@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-rpi-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, kernel@pengutronix.de
Subject: [PATCH 00/34] watchdog: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:42 +0100
Message-Id: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5331; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bNDpzN9/of+4snCKb3EGXWYrpRrxeI3XQNkd4apifJ0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmgPNppSVfN0zchjon388cNtIx4MUYSKuL0io xVUkuJcZqCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoDwAKCRDB/BR4rcrs CcFoB/sHA9SrFWIutlxg9+a1RdCx6cJfZm9Tot2NEcKrJvCpNxkep6leppye/weud7RS3eoWE1z zbXvkUQeGQ8HSzZ46TK9U6uD7DpOrVaLP3zqjMqWSqp+6xQ6EK4utvdFm04qKjBNvIYia/QTFHl iazKtym1+pnul81sOLMVb+1nSK53wmEvvrtRJQYbmyKgDLXGD0xvBVylE248G8h75wKe5UO3OIK EjaGNicFht0hwiOkHNSJo7nqECCUA8UgbsFzzxPg5i55wgCNH40zT7ssPPciKMlo2JC3oUE/sk+ 0+/As/hTfa8wE5qfUb3QLLCKWM8kSudzo5qOuQie6hmAejT1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

this patch series adapts the platform drivers below drivers/watchdog to
use the .remove_new() callback. Compared to the traditional .remove()
callback .remove_new() returns no value. This is a good thing because
the driver core doesn't (and cannot) cope for errors during remove. The
only effect of a non-zero return value in .remove() is that the driver
core emits a warning. The device is removed anyhow and an early return
from .remove() usually yields a resource leak. One driver suffering from
this problem (s3c2410) is fixed by the first patch.

By changing the remove callback to return void driver authors cannot
reasonably (but wrongly) assume any more that there happens some kind of
cleanup later.

All watchdog drivers but the above mentioned one returned zero
unconditionally in their remove callback, so they could all be converted
trivially to .remove_new().

Note that this series depends on commit 5c5a7680e67b ("platform: Provide
a remove callback that returns no value") that is already in Linus' tree
but not yet included in a tagged version.

Best regards
Uwe

Uwe Kleine-König (34):
  watchdog: s3c2410: Don't skip cleanup in remove's error path
  watchdog: acquirewdt: Convert to platform remove callback returning void
  watchdog: advantechwdt: Convert to platform remove callback returning void
  watchdog: ar7: Convert to platform remove callback returning void
  watchdog: at91rm9200: Convert to platform remove callback returning void
  watchdog: ath79: Convert to platform remove callback returning void
  watchdog: bcm2835: Convert to platform remove callback returning void
  watchdog: bcm47xx: Convert to platform remove callback returning void
  watchdog: bcm_kona: Convert to platform remove callback returning void
  watchdog: cpwd: Convert to platform remove callback returning void
  watchdog: dw: Convert to platform remove callback returning void
  watchdog: gef: Convert to platform remove callback returning void
  watchdog: geodewdt: Convert to platform remove callback returning void
  watchdog: ib700wdt: Convert to platform remove callback returning void
  watchdog: ie6xx: Convert to platform remove callback returning void
  watchdog: lpc18xx: Convert to platform remove callback returning void
  watchdog: mtx-1: Convert to platform remove callback returning void
  watchdog: nic7018: Convert to platform remove callback returning void
  watchdog: nv_tco: Convert to platform remove callback returning void
  watchdog: omap: Convert to platform remove callback returning void
  watchdog: orion: Convert to platform remove callback returning void
  watchdog: rc32434: Convert to platform remove callback returning void
  watchdog: rdc321x: Convert to platform remove callback returning void
  watchdog: renesas: Convert to platform remove callback returning void
  watchdog: riowd: Convert to platform remove callback returning void
  watchdog: rn5t618: Convert to platform remove callback returning void
  watchdog: rti: Convert to platform remove callback returning void
  watchdog: s3c2410: Convert to platform remove callback returning void
  watchdog: sa1100: Convert to platform remove callback returning void
  watchdog: sch311x: Convert to platform remove callback returning void
  watchdog: shwdt: Convert to platform remove callback returning void
  watchdog: st_lpc: Convert to platform remove callback returning void
  watchdog: stmp3xxx_rtc: Convert to platform remove callback returning void
  watchdog: wm8350: Convert to platform remove callback returning void

 drivers/watchdog/acquirewdt.c       | 6 ++----
 drivers/watchdog/advantechwdt.c     | 6 ++----
 drivers/watchdog/ar7_wdt.c          | 5 ++---
 drivers/watchdog/at91rm9200_wdt.c   | 6 ++----
 drivers/watchdog/ath79_wdt.c        | 5 ++---
 drivers/watchdog/bcm2835_wdt.c      | 6 ++----
 drivers/watchdog/bcm47xx_wdt.c      | 6 ++----
 drivers/watchdog/bcm_kona_wdt.c     | 6 ++----
 drivers/watchdog/cpwd.c             | 6 ++----
 drivers/watchdog/dw_wdt.c           | 6 ++----
 drivers/watchdog/gef_wdt.c          | 6 ++----
 drivers/watchdog/geodewdt.c         | 5 ++---
 drivers/watchdog/ib700wdt.c         | 5 ++---
 drivers/watchdog/ie6xx_wdt.c        | 6 ++----
 drivers/watchdog/lpc18xx_wdt.c      | 6 ++----
 drivers/watchdog/mtx-1_wdt.c        | 5 ++---
 drivers/watchdog/nic7018_wdt.c      | 6 ++----
 drivers/watchdog/nv_tco.c           | 6 ++----
 drivers/watchdog/omap_wdt.c         | 6 ++----
 drivers/watchdog/orion_wdt.c        | 5 ++---
 drivers/watchdog/rc32434_wdt.c      | 5 ++---
 drivers/watchdog/rdc321x_wdt.c      | 6 ++----
 drivers/watchdog/renesas_wdt.c      | 6 ++----
 drivers/watchdog/riowd.c            | 6 ++----
 drivers/watchdog/rn5t618_wdt.c      | 6 ++----
 drivers/watchdog/rti_wdt.c          | 6 ++----
 drivers/watchdog/s3c2410_wdt.c      | 9 ++++-----
 drivers/watchdog/sa1100_wdt.c       | 6 ++----
 drivers/watchdog/sch311x_wdt.c      | 5 ++---
 drivers/watchdog/shwdt.c            | 6 ++----
 drivers/watchdog/st_lpc_wdt.c       | 6 ++----
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 5 ++---
 drivers/watchdog/wm8350_wdt.c       | 5 ++---
 33 files changed, 68 insertions(+), 123 deletions(-)

base-commit: 2eb29d59ddf02e39774abfb60b2030b0b7e27c1f
-- 
2.39.1

