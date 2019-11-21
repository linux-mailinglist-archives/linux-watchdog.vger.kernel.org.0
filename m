Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722FB104DC4
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 09:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKUIVf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 03:21:35 -0500
Received: from cnshjsmin05.nokia-sbell.com ([116.246.26.45]:14507 "EHLO
        cnshjsmin05.nokia-sbell.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbfKUIVf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 03:21:35 -0500
X-AuditID: ac18929d-483ff700000014de-16-5dd6490b9a27
Received: from CNSHPPEXCH1604.nsn-intra.net (Unknown_Domain [135.251.51.104])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin05.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id E9.B5.05342.B0946DD5; Thu, 21 Nov 2019 16:21:31 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1604.nsn-intra.net (135.251.51.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Nov 2019 16:21:30 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Thu, 21 Nov 2019 16:21:30 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <groeck7@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
 timeout value
Thread-Topic: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWgRKybru2HRl6jT8acRiZ9mycWxQ==
Date:   Thu, 21 Nov 2019 08:21:30 +0000
Message-ID: <4468f40ed5f5413ab27825bbcc611d65@nokia-sbell.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42Jp/22cocvteS3W4Mwsdot9ndeZLC7vmsNm
        cWPdPnaLxy//MTuweOycdZfdY+WaNawenzfJBTBHcdmkpOZklqUW6dslcGXcXv6JueACV8XW
        12+ZGxjfcHQxcnJICJhIbP28k62LkYtDSOAQk8StnStYIZy/jBLdTzuZIZxNjBJLb3cwg7Sw
        CbhLNG1axwZiiwioSuzbsRKsiFlgN6PE3MY3LCAJYYFYia97vzBDFCVJ3Hj4nwXC1pP4vXwy
        I4jNAtR84fJesBpeATuJGW0vWEFsRgFZiWmP7jOB2MwC4hK3nsxngrhVQGLJnvPMELaoxMvH
        /4DqOYBsJYm+DVDlOhILdn9ig7C1JZYtfA01XlDi5MwnLBMYRWYhmToLScssJC2zkLQsYGRZ
        xSidnFeckVWcm5lnYKqXl5+dmahbnJSak6OXnJ+7iREYO2skJs3dwdjZGX+IUYCDUYmHN0Pj
        aqwQa2JZcWXuIUYJDmYlEd4916/ECvGmJFZWpRblxxeV5qQWH2KU5mBREudtmbwwVkggPbEk
        NTs1tSC1CCbLxMEp1cDoF5x13jrv8ENrPbWM+KmflnDeyzLrd60U3WV98r/nX+tTs9iXJF76
        YzEl6Nv7s5Mma94LePRuzjqnFMnrTSt/5CvtPLtzvsyLtFP3G1VzM4OCTu8+dWjmM1cjTt9G
        hXevVB721eeZKJ4uL1y17rVnqUTFXCUW+Qqm0KPst6JCXbLllYp1MzqUWIozEg21mIuKEwG1
        HR5YmQIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From d21d084122d08816454a1e338f0946a9da1f81e3 Mon Sep 17 00:00:00 2001
From: Peng Wang <peng.1.wang@nokia-sbell.com>
Date: Wed, 20 Nov 2019 15:12:59 +0800
Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
 timeout value

watchdog_dev.c provides means to allow users to set bigger timeout value
than HW can support, make DesignWare watchdog align with this.

Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>
---
 drivers/watchdog/dw_wdt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index fef7c61..f1a431c 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -114,7 +114,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
 	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
 	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 
-	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
+	/*
+	 * In case users set bigger timeout value than HW can support,
+	 * kernel(watchdog_dev.c) helps to feed watchdog before 
+	 * wdd->timeout
+	 */
+	if ( top_s * 1000 <= wdd->max_hw_heartbeat_ms )
+		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
+	else
+		wdd->timeout = top_s;
 
 	return 0;
 }
-- 
1.8.3.1

