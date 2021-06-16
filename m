Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3563AA30B
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jun 2021 20:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhFPSTf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Jun 2021 14:19:35 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42319 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbhFPSTa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Jun 2021 14:19:30 -0400
Received: from orion.localdomain ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHWvH-1m76km2mhN-00DaL5; Wed, 16 Jun 2021 20:17:09 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 2/2] watchdog: iTCO_wdt: use dev_err() instead of pr_err()
Date:   Wed, 16 Jun 2021 20:17:08 +0200
Message-Id: <20210616181708.19530-2-info@metux.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616181708.19530-1-info@metux.net>
References: <20210616181708.19530-1-info@metux.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5RbvSNfifSje2Vpid+3J8Yac0lHpcsK9V0ipEflzcKGJusFaKnf
 nhsXQv+LLpgYtClxipFW/ntLCf5j7c7Z439PYjY53eWZ2TS8FHhsfuBEQcxPlx6DxXgugiR
 l9q78ib3HjzhArVFyXjPBa0iCMEmKefLZSYq/2ciY95rXtHyKT5+DrhiZ7Y5iXWvGi8uX1c
 pPVXzYclxSp+6tAFQgfeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tycg97Pl6AU=:dYdhtl8Zf8SP0Y53omOvuU
 0UJibXEZVPTf0fTor3hDelBMKzkmmfYG8X2TIrIMskQe92H/Ie1oDirE1A+rTwYEZqQUGfgKA
 80zPjY+B4Ec9fK7Z48HZhGKfCI+FKl4E+rvlUU8KuaqWQBXFwGNNHDYyiNSU+axa2eP9WpO/E
 iS0FnxzWiB/HDJsJN87SP0xvwJ8wHRS/QX6OXVlcTO/CPr2yAB3dD0/FkgwuQVGMnvB0R2ufh
 Qf9uofXtfsbkQdc01zH9qQr0fFXhyFVU8S9qA9cCfGToEul54KePKv6SLBbR7TnKZmAqAtSin
 vPhRTxuVGe97PXOJUYMmTyK8F8NHVkTZfD7mYFWvktnvbPim0TVHSZ+kQKDZMU4f0J0S14CZN
 v1+tJt1FK9JaRWc3m1fNUCniPUL1iX2zq3JmJBZLS/Fx8Kd/TLpzW0LUKwJhSBQZLZw23Bofd
 WrNkQeg0paKj3IRjmEZydFdh8Yif2cac74gCPfVpg1mPSZ5R2BSllOxePDQqZy1Rgt5beGaLr
 d69YK4wdzgtYE/5ue4qcGI=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use dev_err() instead of pr_err(), so device name is also shown in the log.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/watchdog/iTCO_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 6ba2b2f60737..35ff8d3fd9fc 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -479,13 +479,13 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 		if (!devm_request_region(dev, p->smi_res->start,
 					 resource_size(p->smi_res),
 					 pdev->name)) {
-			pr_err("I/O address 0x%04llx already in use, device disabled\n",
+			dev_err(dev, "I/O address 0x%04llx already in use, device disabled\n",
 			       (u64)SMI_EN(p));
 			return -EBUSY;
 		}
 	} else if (iTCO_vendorsupport ||
 		   turn_SMI_watchdog_clear_off >= p->iTCO_version) {
-		pr_err("SMI I/O resource is missing\n");
+		dev_err(dev, "SMI I/O resource is missing\n");
 		return -ENODEV;
 	}
 
-- 
2.20.1

