Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564E73C38E0
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jul 2021 01:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhGJX4d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 10 Jul 2021 19:56:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233461AbhGJXzh (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 10 Jul 2021 19:55:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49E20613F4;
        Sat, 10 Jul 2021 23:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625961116;
        bh=0QifNCpY/xvzZisF71nCx5PqR2PY7wNTgoNv7Nf5sCs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nn7J7nY5To1yItLy8rwl/ixTyVWs7VTReRZGUroks4z7Tn/p+TcY9pu2XQcQf/w3U
         kTb46EsLVvj+i5D/m/bu2CD/oaLlf11bkgyox5KMQATLFOT1Hp2IYkRJWoaD0gD77I
         cE3CnP6dXWs07qm5kzQgAUlqENw5Hf0cfkV6EjS35XYd8dxCw5knXPQGn3E5K0TIy3
         RUdRhZAn5BSnAwixY1K4BBUP8pLAHX5JZC7wGI7DyiU8y7Dpa2x5bALpqN+4lyED6F
         p6t8XDzWfuaDLNqu3c5unkpjLgXo6YDwPF5omnKmjUwFoNp4nbM5slHfPeeu3HzIWU
         pw9gwlxQQ2PvA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Sasha Levin <sashal@kernel.org>, linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/22] watchdog: iTCO_wdt: Account for rebooting on second timeout
Date:   Sat, 10 Jul 2021 19:51:30 -0400
Message-Id: <20210710235143.3222129-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710235143.3222129-1-sashal@kernel.org>
References: <20210710235143.3222129-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

[ Upstream commit cb011044e34c293e139570ce5c01aed66a34345c ]

This was already attempted to fix via 1fccb73011ea: If the BIOS did not
enable TCO SMIs, the timer definitely needs to trigger twice in order to
cause a reboot. If TCO SMIs are on, as well as SMIs in general, we can
continue to assume that the BIOS will perform a reboot on the first
timeout.

QEMU with its ICH9 and related BIOS falls into the former category,
currently taking twice the configured timeout in order to reboot the
machine. For iTCO version that fall under turn_SMI_watchdog_clear_off,
this is also true and was currently only addressed for v1, irrespective
of the turn_SMI_watchdog_clear_off value.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/0b8bb307-d08b-41b5-696c-305cdac6789c@siemens.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/iTCO_wdt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 347f0389b089..059c9eddb546 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -75,6 +75,8 @@
 #define TCOBASE(p)	((p)->tco_res->start)
 /* SMI Control and Enable Register */
 #define SMI_EN(p)	((p)->smi_res->start)
+#define TCO_EN		(1 << 13)
+#define GBL_SMI_EN	(1 << 0)
 
 #define TCO_RLD(p)	(TCOBASE(p) + 0x00) /* TCO Timer Reload/Curr. Value */
 #define TCOv1_TMR(p)	(TCOBASE(p) + 0x01) /* TCOv1 Timer Initial Value*/
@@ -330,8 +332,12 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
 
 	tmrval = seconds_to_ticks(p, t);
 
-	/* For TCO v1 the timer counts down twice before rebooting */
-	if (p->iTCO_version == 1)
+	/*
+	 * If TCO SMIs are off, the timer counts down twice before rebooting.
+	 * Otherwise, the BIOS generally reboots when the SMI triggers.
+	 */
+	if (p->smi_res &&
+	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
 		tmrval /= 2;
 
 	/* from the specs: */
@@ -493,7 +499,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 		 * Disables TCO logic generating an SMI#
 		 */
 		val32 = inl(SMI_EN(p));
-		val32 &= 0xffffdfff;	/* Turn off SMI clearing watchdog */
+		val32 &= ~TCO_EN;	/* Turn off SMI clearing watchdog */
 		outl(val32, SMI_EN(p));
 	}
 
-- 
2.30.2

