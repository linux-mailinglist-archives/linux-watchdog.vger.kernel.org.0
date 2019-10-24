Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3050FE36B1
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Oct 2019 17:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503211AbfJXPa7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Oct 2019 11:30:59 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:43630 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503214AbfJXP27 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Oct 2019 11:28:59 -0400
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id HTUx2100K5USYZQ06TUxvK; Thu, 24 Oct 2019 17:28:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNf2n-00078T-LC; Thu, 24 Oct 2019 17:28:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNf2n-00081J-Jb; Thu, 24 Oct 2019 17:28:57 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jiri Kosina <trivial@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] watchdog: wdat_wdt: Spelling s/configrable/configurable/
Date:   Thu, 24 Oct 2019 17:28:56 +0200
Message-Id: <20191024152856.30788-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix misspelling of "configurable".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/watchdog/wdat_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index e7cf41aa26c3bbfc..b069349b52f55f92 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -202,7 +202,7 @@ static int wdat_wdt_enable_reboot(struct wdat_wdt *wdat)
 	 * WDAT specification says that the watchdog is required to reboot
 	 * the system when it fires. However, it also states that it is
 	 * recommeded to make it configurable through hardware register. We
-	 * enable reboot now if it is configrable, just in case.
+	 * enable reboot now if it is configurable, just in case.
 	 */
 	ret = wdat_wdt_run_action(wdat, ACPI_WDAT_SET_REBOOT, 0, NULL);
 	if (ret && ret != -EOPNOTSUPP) {
-- 
2.17.1

