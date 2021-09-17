Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE99440F43E
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 10:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbhIQIiR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 04:38:17 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.69]:25653 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232548AbhIQIiQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 04:38:16 -0400
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 9F/4E-19003-6A354416; Fri, 17 Sep 2021 08:36:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRWlGSWpSXmKPExsWi1/P8kO7SYJd
  Eg29HdS1urNvHbvFk4Rkmi8cv/zE7MHusXLOG1WPn9wZ2j8+b5AKYo1gz85LyKxJYM5784yyY
  IFQx9fZa1gbG7fxdjFwcQgIrGSXeb7vNCuFsZpR4uKWHuYuRk4NNQEfiWOckRhBbRCBRYt+hx
  awgNrOAq8S8/T+YQGxhASuJB5u72SBq7CWWH3nBAmHrSfy4+BJsDouAqsTG7olgNbwCjhJ7jj
  8DizMKyEr0nTjCBjFTXGLTs+9g8yUEBCSW7DnPDGGLSrx8/A8ozgFka0gsvewFEZaQ2Le7lw3
  CNpDYunQfC4QtLzF7xg2oOKdE97/HUON1JBbs/gRla0ssW/iaGeIcQYmTM5+wTGAUm4XkillI
  WmYhaZmFpGUBI8sqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sLXSNDU73EKt0kvdRS3fLU4hJdQ
  73E8mK94src5JwUvbzUkk2MwFhMKTh2fQfj1dcf9A4xSnIwKYnyZvu4JArxJeWnVGYkFmfEF5
  XmpBYfYpTh4FCS4F0fCJQTLEpNT61Iy8wBpgWYtAQHj5IIrxZImre4IDG3ODMdInWK0Zhjwsu
  5i5g5Dh6dt4hZiCUvPy9VSpw3NgioVACkNKM0D24QLF1dYpSVEuZlZGBgEOIpSC3KzSxBlX/F
  KM7BqCTMWwiykCczrwRu3yugU5iATjmy3wHklJJEhJRUA9Oprsd396cbyJyWvOzvWaDEVyOVd
  6V4zyrOW0Zn8kQXH1J4GRNxMqdBesKR19vmZn9TO36s7MHTqwefND9edi92etV+1rctDdLnu9
  IeLuRmC015aDSTW7w/PN8p/c/aL9c2XfKXSO53nfhGMe7DBF/GOxcfGExiWyNwqKrnScM2o7z
  bK7iOtObbM3vO8rv/6OOz/skzZ8f7lZbt4miv/L6n9RPT8nkfPDRubqi6E9I8/f93pSUW89cn
  Jn7588H2yDLrZadiUzRn7GoxuD9tfnWken7pnZzVxaVhP+uPTek9sqTMsVzQeO7f01LWTzclF
  z10Pl2oyzqnm0Hq5VSTmVuP6uSV2v5Mdjybf2fC8u9ySizFGYmGWsxFxYkA75KVvdIDAAA=
X-Env-Sender: Walter.Stoll@duagon.com
X-Msg-Ref: server-23.tower-288.messagelabs.com!1631867813!118419!1
X-Originating-IP: [46.140.231.194]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10640 invoked from network); 17 Sep 2021 08:36:53 -0000
Received: from 46-140-231-194.static.upc.ch (HELO chdua14.duagon.ads) (46.140.231.194)
  by server-23.tower-288.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 17 Sep 2021 08:36:53 -0000
Received: from chdua14.duagon.ads (172.16.90.14) by chdua14.duagon.ads
 (172.16.90.14) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Fri, 17 Sep
 2021 10:36:52 +0200
Received: from chdua14.duagon.ads ([fe80::4058:63e9:621d:cb5]) by
 chdua14.duagon.ads ([fe80::4058:63e9:621d:cb5%12]) with mapi id
 15.00.1497.023; Fri, 17 Sep 2021 10:36:52 +0200
From:   Walter Stoll <Walter.Stoll@duagon.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: [BUG] omap_wdt.c: Watchdog not serviced by kernel
Thread-Topic: [BUG] omap_wdt.c: Watchdog not serviced by kernel
Thread-Index: AdernoGctK13SqQlSEa13OgUPnHvQA==
Date:   Fri, 17 Sep 2021 08:36:52 +0000
Message-ID: <cb068bbba92347b2ab3190fda5d85ebf@chdua14.duagon.ads>
Accept-Language: en-US, de-CH
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-codetwo-clientsignature-inserted: true
x-codetwoprocessed: true
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.17.0.41]
x-loop: 1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Effect observed
---------------

We use the watchdog timer on a AM335x controller. When U-Boot runs, we enable
the watchdog and want the kernel to service the watchdog until userspace takes
it over.

We compile the watchdog directly into the kernel and add the parameter
"omap_wdt.early_enable=1" to the kernel command line. We furthermore set
"CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y" in the kernel configuration.

Our expectation is, that the watchdog is serviced by the kernel as long as
userspace does not touch the device /dev/watchdog. However, this is not the
case. The watchdog always expires. It is obviously not serviced by the kernel.

We observed the effect with kernel version v5.4.138-rt62. However, we think
that the most recent kernel exhibits the same behavior because the structure of
the sources in question (see below) did not change. This also holds for the non
realtime kernel.


Root cause
----------

The CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED configuration option is not implemented
in omap_wdt.c.


Fix proposal
------------

Interestingly we found only one single driver that implements this featrue,
namely the driver from STM, see 
https://elixir.bootlin.com/linux/v5.4.138/source/drivers/watchdog/stm32_iwdg.c#L274

This makes us wonder if there might be a good reason not to implement it???

However we think this feature should be available. Our use case is to make
software updates more robust. If an updated kernel hangs for whatever reason,
then U-Boot gets the chance to boot the old one provided there is a reboot.
 
Based on the STM implementation, we created a patch (see below) which resolves
the issue. The watchdog is now correctly handled by the kernel until userspace
first accesses it. 

diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index 9b91882fe3c4..94e2e1b494d2 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -271,6 +271,11 @@ static int omap_wdt_probe(struct platform_device *pdev)
 	if (!early_enable)
 		omap_wdt_disable(wdev);
 
+	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
+		/* Make sure the watchdog is serviced */
+		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
+	}
+
 	ret = watchdog_register_device(&wdev->wdog);
 	if (ret) {
 		pm_runtime_disable(wdev->dev);
