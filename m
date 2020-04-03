Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC5919D737
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Apr 2020 15:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgDCNHa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 09:07:30 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:65370 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbgDCNHa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 09:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1585919249; x=1588511249;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lJci58XPLAs6Gaqe7C4KQCaN7ChYybm9aJTatTD89/A=;
        b=Q8z5Y0U8BXNp0xVZEafTnl5Bi4I1eFhunmLO8ffrT2HryyaDOOAojd1EMFnEhzUN
        KT3bG5gWUdwDoSjXgSsRRPj10fGYB26bAofibCs5s5KOc66U7IRpc18TeQsiPKQV
        W07/7zBIUifJQ01muxgvH7DqXqlcJrqJz7/j9/7hK3g=;
X-AuditID: c39127d2-583ff70000001db9-db-5e873511793f
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 42.88.07609.115378E5; Fri,  3 Apr 2020 15:07:29 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020040315072879-138368 ;
          Fri, 3 Apr 2020 15:07:28 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] watchdog: da9062: Initialize timeout during probe
Date:   Fri, 3 Apr 2020 15:07:26 +0200
Message-Id: <20200403130728.39260-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 03.04.2020 15:07:28,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 03.04.2020 15:07:29
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWyRoCBS1fQtD3O4OUFNovLu+awWdxYt4/d
        4snCM0wWe1svMls8fvmP2YHVY8UnfY+Va9aweuz83sDu8XmTXABLFJdNSmpOZllqkb5dAldG
        77WtTAV3xCpu/v/B2sD4U6iLkZNDQsBEYu7ym0xdjFwcQgLbGCVuNR1nhXDOMUq8PPCBFaSK
        TcBIYsG0RrAqEYE2Rok9R2cxgiSYBRwkHs99CGYLC3hKvFwxnxnEZhFQkbg36TIbiM0rYCMx
        88BLoGYOoHXyEocPZUGEBSVOznzCAjJTQuAKo8TH32vZIU4Skji9+CwzxHxtiWULXzNPYOSb
        haRnFpLUAkamVYxCuZnJ2alFmdl6BRmVJanJeimpmxiBoXd4ovqlHYx9czwOMTJxMB5ilOBg
        VhLhdZzRGifEm5JYWZValB9fVJqTWnyIUZqDRUmcdwNvSZiQQHpiSWp2ampBahFMlomDU6qB
        cd9prgUWp76IrJ4jtOvbvwfuZz5uyLRQNvWUsM5xyj96SWzSjFWJCY8jIquDhV2VvB4sCw9e
        +/v3HP2DCm0lrger9M57zH0k8fPaH/EFZkXWW+O8+Ou276+eE8pxmT0xrPaxsuRk1Y6GgvUu
        Ezuy3Cqb5CvtMkWrk7o3ftHsm7R07uUn/JMslViKMxINtZiLihMBt5iq1CsCAAA=
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

During probe try to set the timeout from device tree and fall back to
either the pre-configured timeout set by e.g. the bootloader in case the
watchdog is already running or the default value.

If the watchdog is already running make sure to update the timeout and
tell the framework about the running state to make sure the watchdog is
handled correctly until user space takes over. Updating the timeout also
removes the need for an additional manual ping so we can remove that as
well.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
Changes in v2:
 - Reworked the patch to use the pre-configured timeout instead of the defa=
ult
   value as a fallback in case no DT value is present.
 - To achieve the previous point watchdog=5Finit=5Ftimeout was added to get=
 the
   DT value if present.
 - Added a timeout update if the watchdog is running to set the desired
   timeout and in this instance removed the manual ping at the end.
 - Removed info message.
---
 drivers/watchdog/da9062=5Fwdt.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/da9062=5Fwdt.c b/drivers/watchdog/da9062=5Fwd=
t.c
index 0ad15d55071c..10b37dd65bed 100644
--- a/drivers/watchdog/da9062=5Fwdt.c
+++ b/drivers/watchdog/da9062=5Fwdt.c
@@ -35,6 +35,15 @@ struct da9062=5Fwatchdog {
 	bool use=5Fsw=5Fpm;
 };
=20
+static unsigned int da9062=5Fwdt=5Fread=5Ftimeout(struct da9062=5Fwatchdog=
 *wdt)
+{
+	unsigned int val;
+
+	regmap=5Fread(wdt->hw->regmap, DA9062AA=5FCONTROL=5FD, &val);
+
+	return wdt=5Ftimeout[val & DA9062AA=5FTWDSCALE=5FMASK];
+}
+
 static unsigned int da9062=5Fwdt=5Ftimeout=5Fto=5Fsel(unsigned int secs)
 {
 	unsigned int i;
@@ -183,7 +192,7 @@ MODULE=5FDEVICE=5FTABLE(of, da9062=5Fcompatible=5Fid=5F=
table);
 static int da9062=5Fwdt=5Fprobe(struct platform=5Fdevice *pdev)
 {
 	struct device *dev =3D &pdev->dev;
-	int ret;
+	unsigned int timeout;
 	struct da9062 *chip;
 	struct da9062=5Fwatchdog *wdt;
=20
@@ -213,11 +222,19 @@ static int da9062=5Fwdt=5Fprobe(struct platform=5Fdev=
ice *pdev)
 	watchdog=5Fset=5Fdrvdata(&wdt->wdtdev, wdt);
 	dev=5Fset=5Fdrvdata(dev, &wdt->wdtdev);
=20
-	ret =3D devm=5Fwatchdog=5Fregister=5Fdevice(dev, &wdt->wdtdev);
-	if (ret < 0)
-		return ret;
+	timeout =3D da9062=5Fwdt=5Fread=5Ftimeout(wdt);
+	if (timeout)
+		wdt->wdtdev.timeout =3D timeout;
+
+	/* Set timeout from DT value if available */
+	watchdog=5Finit=5Ftimeout(&wdt->wdtdev, 0, dev);
+
+	if (timeout) {
+		da9062=5Fwdt=5Fset=5Ftimeout(&wdt->wdtdev, wdt->wdtdev.timeout);
+		set=5Fbit(WDOG=5FHW=5FRUNNING, &wdt->wdtdev.status);
+	}
=20
-	return da9062=5Fwdt=5Fping(&wdt->wdtdev);
+	return devm=5Fwatchdog=5Fregister=5Fdevice(dev, &wdt->wdtdev);
 }
=20
 static int =5F=5Fmaybe=5Funused da9062=5Fwdt=5Fsuspend(struct device *dev)
--=20
2.23.0

