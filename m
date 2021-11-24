Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F4345B709
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 10:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhKXJDX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 04:03:23 -0500
Received: from cpanel.siel.si ([46.19.9.99]:53072 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhKXJDW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 04:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=gaygclyJZpzbxv+h2cP2IMtq9E7VELCJFUngccvwCL8=; b=RoBqk2NKAn76/9Tqhgkz8ZHAkp
        U4PN+qla/fQ8wq+twFGSJKc6stW5bns8NOUL231v8BALQCJDdU8DnHIUkSeJmq37qEAKlo58rfWG6
        cSZcCwnU0L0xXCR7mOTRo5uL0QGGe05WvlURfM6Cgp8laovI2+OeWHsKwQK3eoaHQAc+MH/nFBzzX
        XXDrcuYJo8d+HKM6FRKOSlYXcdK24TtSA2VNKVLEhhP7SvbNfjd9vGA9LpyFEVRscUoy/VcZ0svED
        /xDOh7AMLArZpeUM9rGmgLMQiinwCJKORdDW4j/RufuIVWSUvQ+9Tbly14QkMZUcoc1b1NsNLdZws
        vaY3rBJQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40314 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <andrej.picej@norik.com>)
        id 1mpnIp-006BLM-Ot; Wed, 24 Nov 2021 09:06:59 +0100
From:   Andrej Picej <andrej.picej@norik.com>
To:     support.opensource@diasemi.com, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Cc:     andrej.picej@norik.com, y.bas@phytec.de
Subject: [PATCH] watchdog: da9063: use atomic safe i2c transfer in reset handler
Date:   Wed, 24 Nov 2021 09:06:54 +0100
Message-Id: <20211124080654.2601135-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Yunus Bas <y.bas@phytec.de>

This patch is based on commit 057b52b4b3d5 ("watchdog: da9062: make restart
handler atomic safe"), which uses the atomic transfer capability of the
i2c framework.

Signed-off-by: Yunus Bas <y.bas@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 drivers/watchdog/da9063_wdt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index d79ce64e26a9..9adad1862bbd 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
+#include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/mfd/da9063/registers.h>
 #include <linux/mfd/da9063/core.h>
@@ -169,14 +170,19 @@ static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			      void *data)
 {
 	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
+	struct i2c_client *client = to_i2c_client(da9063->dev);
 	int ret;
 
-	ret = regmap_write(da9063->regmap, DA9063_REG_CONTROL_F,
-			   DA9063_SHUTDOWN);
-	if (ret)
+	/* Don't use regmap because it is not atomic safe */
+	ret = i2c_smbus_write_byte_data(client, DA9063_REG_CONTROL_F,
+					DA9063_SHUTDOWN);
+	if (ret < 0)
 		dev_alert(da9063->dev, "Failed to shutdown (err = %d)\n",
 			  ret);
 
+	/* wait for reset to assert... */
+	mdelay(500);
+
 	return ret;
 }
 
-- 
2.25.1

