Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973063E49A1
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Aug 2021 18:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhHIQVL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 Aug 2021 12:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbhHIQVH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 Aug 2021 12:21:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74D5C0613D3
        for <linux-watchdog@vger.kernel.org>; Mon,  9 Aug 2021 09:20:46 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1mD816-00021W-BH; Mon, 09 Aug 2021 18:20:44 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1mD814-0008KV-RF; Mon, 09 Aug 2021 18:20:42 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v5 0/7] watchdog: f71808e_wdt: migrate to new kernel API
Date:   Mon,  9 Aug 2021 18:20:30 +0200
Message-Id: <cover.3654d10d79751f1b01adc9403f9840543df4bcc4.1628525954.git-series.a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series migrates the driver to the new kernel watchdog API and
then to the driver model.

I tested it on a f81866.

v4 -> v5:
  - Collect Guenter's Reviewed-by's
  - remove superfluous max_timeout global in existing code (Guenter)
  - constify static array in existing code (Guenter)
  - fix wrong handling of start_withtimeout (Guenter)
  - add local variable dev = &pdev->dev

v3 -> v4:
  https://lore.kernel.org/linux-watchdog/cover.c711be1db54f4e07c0153266dd1a831e92e3d49d.1626948810.git-series.a.fatoum@pengutronix.de/
  - Prepend fix for wrong timeout report (Guenter)
  - Remove WDOG_HW_RUNNING setting in start as the watchdog can
    be stopped (Guenter)
  - Dynamically allocate watchdog driver data (Guenter)

v3 -> RESEND:
  https://lore.kernel.org/linux-watchdog/cover.dedd9f1159389b0a438076ef5e5a46aded186463.1612457906.git-series.a.fatoum@pengutronix.de/#t
  Didn't generate any feedback over 2 months. Resending for exposure.

v2 -> v3:
  https://lore.kernel.org/linux-watchdog/20201020062112.6762-1-a.fatoum@pengutronix.de/
  - factored out identifier renaming again for easier review
  - reordered commits
  - removed refactoring that can go in later. Focusing now on kernel watchdog
    API and platform device/driver migration
  - removed platform_device_id and changed code to match by name

v1 -> v2:
  https://lore.kernel.org/linux-watchdog/20200611191750.28096-1-a.fatoum@pengutronix.de/
  - reworked to platform device/driver pair (Guenter)
  - squashed identifier renaming into the patches that touch
    the respective lines anyway
  - fixed checkpatch.pl nitpicks (Guenter)
  - fixed locally used variable declared without static (0-day)
  - fixed unneded line break due to old line limit (Guenter)
  - renamed struct fintek_wdog_data to struct fintek_wdt

Ahmad Fatoum (7):
  watchdog: f71808e_wdt: fix inaccurate report in WDIOC_GETTIMEOUT
  watchdog: f71808e_wdt: remove superfluous global
  watchdog: f71808e_wdt: constify static array
  watchdog: f71808e_wdt: rename variant-independent identifiers appropriately
  watchdog: f71808e_wdt: migrate to new kernel watchdog API
  watchdog: f71808e_wdt: refactor to platform device/driver pair
  watchdog: f71808e_wdt: dynamically allocate watchdog driver data

 drivers/watchdog/Kconfig       |   1 +-
 drivers/watchdog/f71808e_wdt.c | 615 +++++++++++-----------------------
 2 files changed, 201 insertions(+), 415 deletions(-)

base-commit: 36a21d51725af2ce0700c6ebcb6b9594aac658a6
-- 
git-series 0.9.1
