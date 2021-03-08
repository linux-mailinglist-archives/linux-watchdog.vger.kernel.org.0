Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99025330C34
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 12:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhCHLW1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 06:22:27 -0500
Received: from smtp.asem.it ([151.1.184.197]:58542 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231963AbhCHLWJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 06:22:09 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000850608.MSG 
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Mar 2021 12:21:56 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 8 Mar
 2021 12:21:55 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 8 Mar 2021 12:21:55 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1 2/2] watchdog: wdat: add start_enable global parameter
Date:   Mon, 8 Mar 2021 12:21:51 +0100
Message-ID: <20210308112151.716315-3-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308112151.716315-1-f.suligoi@asem.it>
References: <20210308112151.716315-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F1A.604608D3.00BB,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The "start_enable" global parameter, managed in watchdog_core.c,
forces the driver to start the watchdog countdown in the same moment of the
module insertion.
The driver also updates the watchdog status, setting the WDOG_HW_RUNNING
flag, to enable the watchdog ping feature managed by the watchdog_core
itself.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/watchdog/wdat_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index cec7917790e5..7304a335227f 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -437,6 +437,8 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 	}
 
 	wdat_wdt_boot_status(wdat);
+	if (watchdog_global_param_start_enabled())
+		wdat_wdt_start(&wdat->wdd);
 	wdat_wdt_set_running(wdat);
 
 	ret = wdat_wdt_enable_reboot(wdat);
-- 
2.25.1

