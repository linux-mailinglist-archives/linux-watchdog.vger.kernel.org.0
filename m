Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094072934E0
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Oct 2020 08:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgJTGVo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Oct 2020 02:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404070AbgJTGVh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Oct 2020 02:21:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26393C061755
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Oct 2020 23:21:37 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kUl1T-00064i-6m; Tue, 20 Oct 2020 08:21:27 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kUl1R-00030o-NA; Tue, 20 Oct 2020 08:21:25 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 0/2] watchdog: f71808e_wdt: migrate to new kernel API
Date:   Tue, 20 Oct 2020 08:21:10 +0200
Message-Id: <20201020062112.6762-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series migrates the driver to use first the driver model, then
the new kernel watchdog API.

I tested it on a f81866.

v1 had a wrong title (f71808e_wdt: migrate to kernel). It's available here:
https://lore.kernel.org/linux-watchdog/20200611191750.28096-1-a.fatoum@pengutronix.de/

v1 -> v2:
    - reworked to platform device/driver pair (Guenther)
    - squashed identifier renaming into the patches that touch
      the respective lines anyway
    - fixed checkpatch.pl nitpicks (Guenther)
    - fixed locally used variable declared without static (0-day)
    - fixed unneded line break due to old line limit (Guenther)
    - renamed struct fintek_wdog_data to struct fintek_wdt

Ahmad Fatoum (2):
  watchdog: f71808e_wdt: refactor to platform device/driver pair
  watchdog: f71808e_wdt: migrate to new kernel watchdog API

 drivers/watchdog/Kconfig       |   1 +
 drivers/watchdog/f71808e_wdt.c | 815 ++++++++++++---------------------
 2 files changed, 292 insertions(+), 524 deletions(-)

-- 
2.28.0

