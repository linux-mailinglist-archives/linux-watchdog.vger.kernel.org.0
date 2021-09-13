Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9165D408A72
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Sep 2021 13:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237978AbhIMLnT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Sep 2021 07:43:19 -0400
Received: from gecko.sbs.de ([194.138.37.40]:49200 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236395AbhIMLnS (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Sep 2021 07:43:18 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 18DBfiqp009507
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Sep 2021 13:41:44 +0200
Received: from [167.87.36.252] ([167.87.36.252])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 18DBfhOV005983;
        Mon, 13 Sep 2021 13:41:43 +0200
From:   Jan Kiszka <jan.kiszka@siemens.com>
Subject: [RFC][PATCH] watchdog: rti-wdt: Provide set_timeout handler to make
 existing userspace happy
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        "Su, Bao Cheng (RC-CN DF FA R&D)" <baocheng.su@siemens.com>
Message-ID: <4d82b8ce-bc34-e4b2-c5fe-9e883b0db59d@siemens.com>
Date:   Mon, 13 Sep 2021 13:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

Prominent userspace - systemd - cannot handle watchdogs without
WDIOF_SETTIMEOUT, even if it was configured to the same time as the
driver selected or was used by firmware to start the watchdog. To avoid
failing in this case, implement a handler that only fails if a deviating
set_timeout is requested.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

See also https://github.com/systemd/systemd/issues/20683

 drivers/watchdog/rti_wdt.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 359302f71f7e..365255b15a0d 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -173,13 +173,27 @@ static unsigned int rti_wdt_get_timeleft_ms(struct watchdog_device *wdd)
 	return timer_counter;
 }
 
+static int rti_wdt_set_timeout(struct watchdog_device *wdd,
+			       unsigned int timeout)
+{
+	/*
+	 * Updating the timeout after start is actually not supported, but
+	 * let's ignore requests for the already configured value. Helps
+	 * existing userspace such as systemd.
+	 */
+	if (timeout != heartbeat)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
 {
 	return rti_wdt_get_timeleft_ms(wdd) / 1000;
 }
 
 static const struct watchdog_info rti_wdt_info = {
-	.options = WDIOF_KEEPALIVEPING,
+	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
 	.identity = "K3 RTI Watchdog",
 };
 
@@ -187,6 +201,7 @@ static const struct watchdog_ops rti_wdt_ops = {
 	.owner		= THIS_MODULE,
 	.start		= rti_wdt_start,
 	.ping		= rti_wdt_ping,
+	.set_timeout	= rti_wdt_set_timeout,
 	.get_timeleft	= rti_wdt_get_timeleft,
 };
 
-- 
2.31.1
