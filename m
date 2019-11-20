Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D25A103760
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2019 11:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfKTKXH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 05:23:07 -0500
Received: from cnshjsmin03.app.nokia-sbell.com ([116.246.26.71]:16257 "EHLO
        cnshjsmin03.nokia-sbell.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726757AbfKTKXG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 05:23:06 -0500
X-Greylist: delayed 901 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Nov 2019 05:23:05 EST
X-AuditID: ac189297-c7bff7000000115a-f7-5dd5107e795c
Received: from CNSHPPEXCH1607.nsn-intra.net (Unknown_Domain [135.251.51.107])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin03.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id 78.F8.04442.E7015DD5; Wed, 20 Nov 2019 18:07:58 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1607.nsn-intra.net (135.251.51.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Nov 2019 18:07:57 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Wed, 20 Nov 2019 18:07:57 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
 timeout value
Thread-Topic: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWfimD0awmuxWORQi2dTd1MQDV31A==
Date:   Wed, 20 Nov 2019 10:07:57 +0000
Message-ID: <13477f08400047c1b32030b2680a4241@nokia-sbell.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsXS/ts4W7dO4GqswfOnTBaXd81hs7ixbh+7
        xZOFZ5gsHr/8x+zA4rFyzRpWj53fG9g9Pm+SC2CO4rJJSc3JLEst0rdL4Mp4vtu24BFXxaUW
        jQbGhxxdjJwcEgImEmeenGUBsYUEDjFJPD5X28XIBWT/ZZQ4dPMeM4SziVFi65ZHrCBVbALu
        Ek2b1rGBJEQEXjBKNM7fzA6SEBaIlfi69wsziC0ikCRx4+F/FghbT2LO9h9gzSwCqhIXVm0B
        s3kF7CR+P2oA62UUkJWY9ug+E4jNLCAucevJfCaI8wQkluw5zwxhi0q8fPwPqJcDyFaS6NsA
        Va4jsWD3JzYIW1ti2cLXzBDjBSVOznzCMoFReBaSqbOQtMxC0jILScsCRpZVjNLJecUZWcW5
        mXkGxnp5+dmZibrFSak5OXrJ+bmbGIHRsUZi0vQdjMcOeB9iFOBgVOLhtbh0OVaINbGsuDL3
        EKMEB7OSCO+e61dihXhTEiurUovy44tKc1KLDzFKc7AoifO2TF4YKySQnliSmp2aWpBaBJNl
        4uCUamDMCOdprnDhLngz5Yg3b8b5TXHrjJwkE+Qd1fTfh5qumjOH2czzyfbradwP0uoKNxjc
        j9JlecJzwPXjYum0459Llv+dttGmx8v1pU/hIXOFT5ZGXe2svxTevUhePH/9oeP9hh2qR0U0
        TV30lZevL0ll6Ana0GBzJERD0cSuNFWwIkXHtFp2nhJLcUaioRZzUXEiAOg1oIuKAgAA
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From 1d051b7c081083751dc0bab97d3ab9efbba0f4a7 Mon Sep 17 00:00:00 2001
From: Peng Wang <peng.1.wang@nokia-sbell.com>
Date: Wed, 20 Nov 2019 15:12:59 +0800
Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
 timeout value

watchdog_dev.c provides means to allow users to set bigger timeout value
than HW can support, make DesignWare watchdog align with this.

Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>
---
 drivers/watchdog/dw_wdt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index fef7c61..8911e5e 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -113,8 +113,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
 	 */
 	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
 	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
-
-	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
+    
+    /*
+     * In case users set bigger timeout value than HW can support,
+     * kernel(watchdog_dev.c) helps to feed watchdog before 
+     * wdd->timeout
+     */
+    if ( wdd->timeout * 1000 <= wdd->max_hw_heartbeat_ms ) {
+	    wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
+    }
 
 	return 0;
 }
-- 
1.8.3.1

