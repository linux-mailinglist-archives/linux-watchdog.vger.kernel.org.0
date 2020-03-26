Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B172194241
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Mar 2020 16:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgCZPCG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 26 Mar 2020 11:02:06 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46414 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgCZPCG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 26 Mar 2020 11:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1585234924; x=1587826924;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2Lsi0B9PC9xzPGCjLHInYEh0CJgnpmqkv2nS4RmsyXo=;
        b=eznboSLSt6P9+0IlJfby1GN8SnglyDilkOYErQTlaBxWgmCz/gK/gug6wJ9Pr1c5
        4QqNStoiW3SVcOEwB7ccbLvaWQZKBSEwWl9cEe5NjD/+iDQUfPVEn7+8QEhC8Cx0
        Dj+vE4hBFb/CVzkyi0sx8hpg07ry/ZG5k/Y6pSdPm+Q=;
X-AuditID: c39127d2-599ff70000001db9-a5-5e7cc3ecf81b
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 74.1C.07609.CE3CC7E5; Thu, 26 Mar 2020 16:02:04 +0100 (CET)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020032616020417-89375 ;
          Thu, 26 Mar 2020 16:02:04 +0100 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] watchdog: da9063: Use pre configured timeout when watchdog is running
Date:   Thu, 26 Mar 2020 16:02:02 +0100
Message-Id: <20200326150203.371673-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200326150203.371673-1-s.riedmueller@phytec.de>
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.03.2020 16:02:04,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.03.2020 16:02:04
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWyRoCBS/fN4Zo4g5vtshaXd81hs7ixbh+7
        xZOFZ5gs9rZeZLZ4/PIfswOrx4pP+h4r16xh9dj5vYHd4/MmuQCWKC6blNSczLLUIn27BK6M
        PT++MxdMEq14eqODvYHxmWAXIyeHhICJxLKGFuYuRi4OIYGtjBJPGhczQjjnGCX+NV9kAali
        EzCSWDCtkQkkISLQxiix5+gsRpAEs4CDxOO5D8FsYYEoiQ1PVzKD2CwCqhLbZi8HauDg4BWw
        ldj6QB3ElBCQlzh8KAukglPATmLzw11g44WAKvYvbmcHsXkFBCVOznzCArJKQuAKo8Tx2z0s
        EJcKSZxefJYZYq22xLKFr5knMArMQtIzC0lqASPTKkah3Mzk7NSizGy9gozKktRkvZTUTYzA
        QD08Uf3SDsa+OR6HGJk4GA8xSnAwK4nwPo2siRPiTUmsrEotyo8vKs1JLT7EKM3BoiTOu4G3
        JExIID2xJDU7NbUgtQgmy8TBKdXA2KVx0N9Rgq+gy1y47/nM5VYT9hjfsJ9Y4Lr/nvbLKdXn
        +ALDzsQ6NHdvNmwpZQm4tl6x0MTkAkexbZnIrGqXN9IHzNn9Sz5mmb7PSV6tb57r1ZjkYzJV
        fO4L7YBXv6zmTvmscVhzS7Hul/KZv1lOHZW8EnLokejxrJSn5lVcTI3T/CdXl/xTYinOSDTU
        Yi4qTgQA2GarKUICAAA=
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the watchdog is already running during probe use its pre-configured
timeout instead of a default timeout to make sure the watchdog is pinged
in time until userspace takes over.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/watchdog/da9063=5Fwdt.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/da9063=5Fwdt.c b/drivers/watchdog/da9063=5Fwd=
t.c
index 3d65e92a4e3f..34d0c4f03814 100644
--- a/drivers/watchdog/da9063=5Fwdt.c
+++ b/drivers/watchdog/da9063=5Fwdt.c
@@ -46,15 +46,16 @@ static unsigned int da9063=5Fwdt=5Ftimeout=5Fto=5Fsel(u=
nsigned int secs)
 }
=20
 /*
- * Return 0 if watchdog is disabled, else non zero.
+ * Read the currently active timeout.
+ * Zero means the watchdog is disabled.
  */
-static unsigned int da9063=5Fwdt=5Fis=5Frunning(struct da9063 *da9063)
+static unsigned int da9063=5Fwdt=5Fread=5Ftimeout(struct da9063 *da9063)
 {
 	unsigned int val;
=20
 	regmap=5Fread(da9063->regmap, DA9063=5FREG=5FCONTROL=5FD, &val);
=20
-	return val & DA9063=5FTWDSCALE=5FMASK;
+	return wdt=5Ftimeout[val & DA9063=5FTWDSCALE=5FMASK];
 }
=20
 static int da9063=5Fwdt=5Fdisable=5Ftimer(struct da9063 *da9063)
@@ -191,6 +192,7 @@ static int da9063=5Fwdt=5Fprobe(struct platform=5Fdevic=
e *pdev)
 	struct device *dev =3D &pdev->dev;
 	struct da9063 *da9063;
 	struct watchdog=5Fdevice *wdd;
+	int timeout;
=20
 	if (!dev->parent)
 		return -EINVAL;
@@ -214,15 +216,20 @@ static int da9063=5Fwdt=5Fprobe(struct platform=5Fdev=
ice *pdev)
 	watchdog=5Fset=5Frestart=5Fpriority(wdd, 128);
 	watchdog=5Fset=5Fdrvdata(wdd, da9063);
=20
-	/* Set default timeout, maybe override it with DT value, scale it */
-	wdd->timeout =3D DA9063=5FWDG=5FTIMEOUT;
-	watchdog=5Finit=5Ftimeout(wdd, 0, dev);
-	da9063=5Fwdt=5Fset=5Ftimeout(wdd, wdd->timeout);
-
-	/* Change the timeout to the default value if the watchdog is running */
-	if (da9063=5Fwdt=5Fis=5Frunning(da9063)) {
-		da9063=5Fwdt=5Fupdate=5Ftimeout(da9063, wdd->timeout);
+	/*
+	 * Use pre-configured timeout if watchdog is already running.
+	 * Otherwise set default timeout, maybe override it with DT value,
+	 * scale it
+	 */
+	timeout =3D da9063=5Fwdt=5Fread=5Ftimeout(da9063);
+	if (timeout) {
+		wdd->timeout =3D timeout;
 		set=5Fbit(WDOG=5FHW=5FRUNNING, &wdd->status);
+		dev=5Finfo(da9063->dev, "watchdog is running (%u s)", timeout);
+	} else {
+		wdd->timeout =3D DA9063=5FWDG=5FTIMEOUT;
+		watchdog=5Finit=5Ftimeout(wdd, 0, dev);
+		da9063=5Fwdt=5Fset=5Ftimeout(wdd, wdd->timeout);
 	}
=20
 	return devm=5Fwatchdog=5Fregister=5Fdevice(dev, wdd);
--=20
2.23.0

