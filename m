Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD0C19423F
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Mar 2020 16:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgCZPCG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 26 Mar 2020 11:02:06 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46422 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgCZPCF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 26 Mar 2020 11:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1585234924; x=1587826924;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=z2mlDmUTVL8bamKSgP9kkGknh9FvkyYg3rvvPm37X4Q=;
        b=TPV+j3xYLPi/szZNWzSPvj3Qxqy6XFqbU9pzIWY+kiVsdQk7SPqydxOYrVrvc5pk
        6Bg/i+jxtn1wEgqbpEwOAKfvQDyje+Ndkr1dBM7jC+FjAZeXHpIxExFOj6i+UMuG
        gRBT2lreLWnhDVN98uBuNizfGUCe4I3Xy+6d9ldVM2E=;
X-AuditID: c39127d2-583ff70000001db9-a4-5e7cc3ecbc8d
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 14.1C.07609.CE3CC7E5; Thu, 26 Mar 2020 16:02:04 +0100 (CET)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020032616020393-89374 ;
          Thu, 26 Mar 2020 16:02:03 +0100 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] watchdog: da9062: Use pre-configured timeout until userspace takes over
Date:   Thu, 26 Mar 2020 16:02:01 +0100
Message-Id: <20200326150203.371673-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.03.2020 16:02:04,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.03.2020 16:02:04
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWyRoCBS/fN4Zo4g9VL+C0u75rDZnFj3T52
        iycLzzBZ7G29yGzx+OU/ZgdWjxWf9D1WrlnD6rHzewO7x+dNcgEsUVw2Kak5mWWpRfp2CVwZ
        H28ZFXTxVfzf0s3ewPiSu4uRk0NCwETi3oerjF2MXBxCAlsZJfrvNbJAOOcYJZ7/vcQGUsUm
        YCSxYFojE0hCRKCNUWLP0VmMIAlmAQeJx3MfgtnCAjES27ZMZgKxWQRUJZq+7GUGsXkFbCWu
        tLcD2RxA6+QlDh/KgggLSpyc+QRsmYTAFUaJ47d7WCBOEpI4vfgsM8R8bYllC18zT2Dkm4Wk
        ZxaS1AJGplWMQrmZydmpRZnZegUZlSWpyXopqZsYgYF3eKL6pR2MfXM8DjEycTAeYpTgYFYS
        4X0aWRMnxJuSWFmVWpQfX1Sak1p8iFGag0VJnHcDb0mYkEB6YklqdmpqQWoRTJaJg1OqgdHl
        /zNTM0dh0/goGenJVzQb+/SXnt9puCx0xcaQ7ui5NxL2v5m2MLjv5c9DzMphj9KmJzid2nPI
        7W/UuRczgk54ctSYFQJjjnF7ae5Rt39PQndMXffOqvV8uk9X4LZPl1db9z+z6pQ1Fvlgmzxv
        xoeIL+dexBZY8N9fdaDtzYa2LRMajOI+8CmxFGckGmoxFxUnAgDn9A2bKgIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the watchdog is already running during probe read back its
pre-configured timeout (set e.g. by the bootloader) and use it to ping
the watchdog until userspace takes over. Otherwise the default timeout
set before might not result in a fast enough ping.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/watchdog/da9062=5Fwdt.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/watchdog/da9062=5Fwdt.c b/drivers/watchdog/da9062=5Fwd=
t.c
index 0ad15d55071c..6d81b1276b87 100644
--- a/drivers/watchdog/da9062=5Fwdt.c
+++ b/drivers/watchdog/da9062=5Fwdt.c
@@ -35,6 +35,14 @@ struct da9062=5Fwatchdog {
 	bool use=5Fsw=5Fpm;
 };
=20
+static unsigned int da9062=5Fwdt=5Fread=5Ftimeout(struct da9062=5Fwatchdog=
 *wdt)
+{
+	int val;
+
+	regmap=5Fread(wdt->hw->regmap, DA9062AA=5FCONTROL=5FD, &val);
+	return wdt=5Ftimeout[val & DA9062AA=5FTWDSCALE=5FMASK];
+}
+
 static unsigned int da9062=5Fwdt=5Ftimeout=5Fto=5Fsel(unsigned int secs)
 {
 	unsigned int i;
@@ -184,6 +192,7 @@ static int da9062=5Fwdt=5Fprobe(struct platform=5Fdevic=
e *pdev)
 {
 	struct device *dev =3D &pdev->dev;
 	int ret;
+	int timeout;
 	struct da9062 *chip;
 	struct da9062=5Fwatchdog *wdt;
=20
@@ -213,6 +222,13 @@ static int da9062=5Fwdt=5Fprobe(struct platform=5Fdevi=
ce *pdev)
 	watchdog=5Fset=5Fdrvdata(&wdt->wdtdev, wdt);
 	dev=5Fset=5Fdrvdata(dev, &wdt->wdtdev);
=20
+	timeout =3D da9062=5Fwdt=5Fread=5Ftimeout(wdt);
+	if (timeout > 0) {
+		wdt->wdtdev.timeout =3D timeout;
+		set=5Fbit(WDOG=5FHW=5FRUNNING, &wdt->wdtdev.status);
+		dev=5Finfo(wdt->hw->dev, "watchdog is running (%u s)", timeout);
+	}
+
 	ret =3D devm=5Fwatchdog=5Fregister=5Fdevice(dev, &wdt->wdtdev);
 	if (ret < 0)
 		return ret;
--=20
2.23.0

