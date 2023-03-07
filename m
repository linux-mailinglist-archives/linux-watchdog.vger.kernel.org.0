Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA156AD905
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Mar 2023 09:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjCGIR5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Mar 2023 03:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjCGIRp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Mar 2023 03:17:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0194FF1B
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Mar 2023 00:17:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZSVj-0003g3-CG; Tue, 07 Mar 2023 09:17:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMr-002Q8B-OH; Tue, 07 Mar 2023 08:04:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMr-002uFp-5O; Tue, 07 Mar 2023 08:04:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] watchdog: Simplify using devm_watchdog_register_device()
Date:   Tue,  7 Mar 2023 08:04:01 +0100
Message-Id: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=93Ls/dWVOMTvH0rjQdEBPPh9NEk4CwZLfUxFu5IxkSY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBuHVy+lzfWn/6Rtmx5NxP6vDOGEYvDEn66BE6 E5yEjIjW9KJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAbh1QAKCRDB/BR4rcrs CbxcB/9RH5+eASNyR6fFHS0Z7bgXp7alEPVtBcN+YxOnTHzsqGBasFO6akJW1KM/pGpP7xDJ+hW KP7r9vG3jWh/DpiXqCnpb0FMyUlYuhU5rVxpGfr4RiWB8IbK/KHL34FZqLknIp3WsNROuXENg2A fT0rXXMjL+58UkTuShy46G6+GUW1veab7YZdq31TRB5EbiJOi31spMHqvZTB87dIisTTiAtI0lo E0pFK1bUXTkrsxZMCFC/wQwSa6MFA0//XazbMCS2tG9uTYop4qLPHnZQ+GlEnoG6ujqww42Kmsd Mysf4IQJ3YKm+nUj4cOMiWEKto2vZzr4ksS5TRNiYXo9enYJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

On Mon, Mar 06, 2023 at 12:17:39PM -0800, Guenter Roeck wrote:
> Oops, all those need &pdev->dev as first argument. Please resend with that fixed.

TILA: Don't assume your patch is trivial enough that you can skip the compile
test step. :-\ Sorry.

Here comes a v2 that properly passes a struct device to
devm_watchdog_register_device() and thus compiles fine.

Best regards
Uwe

Uwe Kleine-König (3):
  watchdog: bcm47xx: Simplify using devm_watchdog_register_device()
  watchdog: rn5t618: Simplify using devm_watchdog_register_device()
  watchdog: wm8350: Simplify using devm_watchdog_register_device()

 drivers/watchdog/bcm47xx_wdt.c | 12 +-----------
 drivers/watchdog/rn5t618_wdt.c | 12 +-----------
 drivers/watchdog/wm8350_wdt.c  |  9 +--------
 3 files changed, 3 insertions(+), 30 deletions(-)


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1

