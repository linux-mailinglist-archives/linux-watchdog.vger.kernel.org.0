Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D4C30F901
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Feb 2021 18:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbhBDRCh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Feb 2021 12:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238327AbhBDRCS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Feb 2021 12:02:18 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27401C06178C
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Feb 2021 09:01:38 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1l7i0Q-0002jT-Qu; Thu, 04 Feb 2021 18:01:22 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1l7i0P-0001Lm-U3; Thu, 04 Feb 2021 18:01:21 +0100
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 0/3] watchdog: f71808e_wdt: migrate to new kernel API
Date:   Thu,  4 Feb 2021 18:00:47 +0100
Message-Id: <cover.dedd9f1159389b0a438076ef5e5a46aded186463.1612457906.git-series.a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.0
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

Main feedback from Guenther on v2 was that I need to split it up to
enable review. I have done so by removing the extra refactoring for
now and focused on the functional changes described above. The diff
is now much better readable.

I tested it on a f81866.

v2 -> v3:
  https://lore.kernel.org/linux-watchdog/20201020062112.6762-1-a.fatoum@pengutronix.de/
  - factored out identifier renaming again for easier review
  - reordered commits
  - removed refactoring that can go in later. Focusing now on kernel watchdog
    API and platform device/driver migration
  - removed platform_device_id and changed code to match by name

v1 -> v2:
  https://lore.kernel.org/linux-watchdog/20200611191750.28096-1-a.fatoum@pengutronix.de/
  - reworked to platform device/driver pair (Guenther)
  - squashed identifier renaming into the patches that touch
    the respective lines anyway
  - fixed checkpatch.pl nitpicks (Guenther)
  - fixed locally used variable declared without static (0-day)
  - fixed unneded line break due to old line limit (Guenther)
  - renamed struct fintek_wdog_data to struct fintek_wdt

Ahmad Fatoum (3):
  watchdog: f71808e_wdt: rename variant-independent identifiers appropriately
  watchdog: f71808e_wdt: migrate to new kernel watchdog API
  watchdog: f71808e_wdt: refactor to platform device/driver pair

 drivers/watchdog/Kconfig       |   1 +-
 drivers/watchdog/f71808e_wdt.c | 450 +++++++---------------------------
 2 files changed, 100 insertions(+), 351 deletions(-)

base-commit: 1048ba83fb1c00cd24172e23e8263972f6b5d9ac
-- 
git-series 0.9.1
