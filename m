Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEFF281658
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 17:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387984AbgJBPQb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 11:16:31 -0400
Received: from www.zeus03.de ([194.117.254.33]:39270 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBPQb (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 11:16:31 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Fri, 02 Oct 2020 11:16:30 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=Olxx3PyhNYX/HqOAzoRWcY776/1
        3q4TYXHAL8j0FOWs=; b=s7rbaEQb3jFiAuxNRzgSMCJJfDRbi0va+MTV1Jgcygz
        5WK2KdGCTJJ/Yn2iZVcLi/PBVo1e3IGlKS7Ywos2ubTQJWG3geq7R/Of2SPz95w5
        UnPSSRIZAerf6+0ffYgOL4Av5IcNCmPJhSv6szDvI/7k0q32W7MHScdim6/6D43Q
        =
Received: (qmail 1420084 invoked from network); 2 Oct 2020 17:09:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2020 17:09:48 +0200
X-UD-Smtp-Session: l3s3148p1@otgJhrGwvMQgAwDPXwkAADD+YGrDqBUE
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] watchdog: renesas_wdt: don't sleep in atomic context
Date:   Fri,  2 Oct 2020 17:09:44 +0200
Message-Id: <20201002150944.9696-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In the restart handler, we hit the following OOPS because rwdt_start()
schedules because of usleep_range():

[   16.071855] BUG: scheduling while atomic: init/1184/0x00000002
...
[   16.159955] [<c05b6b3c>] (schedule) from [<c05b9884>] (schedule_hrtimeout_range_clock+0x108/0x15c)
[   16.168918]  r5:00000003 r4:bd855014
[   16.172498] [<c05b977c>] (schedule_hrtimeout_range_clock) from [<c05b9904>] (schedule_hrtimeout_range+0x2c/0x34)
[   16.182679]  r7:ea0edd48 r6:ea0ec000 r5:0000fa00 r4:00000000
[   16.188343] [<c05b98d8>] (schedule_hrtimeout_range) from [<c05b92dc>] (usleep_range+0x84/0xb8)
[   16.196973] [<c05b9258>] (usleep_range) from [<c049d4a8>] (rwdt_start+0x58/0xa8)

Convert usleep_range() to udelay() to avoid the bug. The downside is
busy looping when the watchdog is started or stopped (64us or 96us in my
case). However, this happens rarely enough, so it seems acceptable.

Fixes: b836005b4f95 ("watchdog: renesas_wdt: Add a few cycles delay")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

We could also add a new flag in the watchdog core "IS_RESTARTING" or
similar and check that in the driver. Depending on the flag, we use
udelay() or usleep_range(). Not sure, if this is feasible or
over-engineered, though. Looking forward for comments.

 drivers/watchdog/renesas_wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 00662a8e039c..2b0da9b76375 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -76,8 +76,7 @@ static void rwdt_wait_cycles(struct rwdt_priv *priv, unsigned int cycles)
 	unsigned int delay;
 
 	delay = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);
-
-	usleep_range(delay, 2 * delay);
+	udelay(delay);
 }
 
 static int rwdt_start(struct watchdog_device *wdev)
-- 
2.28.0

