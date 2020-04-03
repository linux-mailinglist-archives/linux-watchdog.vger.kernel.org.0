Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD5919D739
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Apr 2020 15:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390855AbgDCNHc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 09:07:32 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:65362 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390705AbgDCNHc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 09:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1585919249; x=1588511249;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7PCPdXoL92mweYgm+x4Q95mtPQBQ+j+0qqnoFh5R7x4=;
        b=N52sW98QargAj4vl2lnNzgePvPcL0gArlb/fH0XKisEZ1Baaj6CK86xmpa0NS2dj
        TfAWx4Qg5LoNaBvEr7ARloGyakfT4GW3YSRWvSs7qOFuvROOlYvLfH1CRQTXBCN3
        75x0CbLvF2DGc6AYO0xIEi00hITVAG4AFTgE0Im0LIw=;
X-AuditID: c39127d2-599ff70000001db9-dc-5e873511cfe8
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A2.88.07609.115378E5; Fri,  3 Apr 2020 15:07:29 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020040315072902-138369 ;
          Fri, 3 Apr 2020 15:07:29 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] watchdog: da9063: Make use of pre-configured timeout during probe
Date:   Fri, 3 Apr 2020 15:07:27 +0200
Message-Id: <20200403130728.39260-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403130728.39260-1-s.riedmueller@phytec.de>
References: <20200403130728.39260-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 03.04.2020 15:07:29,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 03.04.2020 15:07:29
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWyRoCBS1fQtD3O4PAbYYvLu+awWdxYt4/d
        4snCM0wWe1svMls8fvmP2YHVY8UnfY+Va9aweuz83sDu8XmTXABLFJdNSmpOZllqkb5dAlfG
        pMvHWAqeilT8evacpYFxtWAXIweHhICJxPeH9l2MXBxCAtsYJbqbO5m7GDmBnHOMEsuWuYHY
        bAJGEgumNTKBFIkItDFK7Dk6ixEkwSzgIPF47kMwW1ggUmJr7x8wm0VAReLa5bmsIDavgI3E
        zE/7GCGWyUscPpQFEuYUsJU48X8OO8QuG4n25ZfZIMoFJU7OfMICsktC4AqjxOPHx8CKJASE
        JE4vPssMsVdbYtnC18wTGAVmIemZhSS1gJFpFaNQbmZydmpRZrZeQUZlSWqyXkrqJkZgmB6e
        qH5pB2PfHI9DjEwcjIcYJTiYlUR4HWe0xgnxpiRWVqUW5ccXleakFh9ilOZgURLn3cBbEiYk
        kJ5YkpqdmlqQWgSTZeLglGpgXHAyNebe34v1y96+qt9U+2n676V9T1nYJv7Pfjb3Eq+KnVGY
        jNwU//uKD25ucLT4vkBEbfcfrrzJixY3G62UOWhU1ekuk/vTZ5XdNgWPD4s+bZvaf2Pv541L
        dVbsWrLH5cCxybN29QfN9Y+e5rIgOmUlV8ScpliNyLBPi1ZdnKXK/3VzQPUdWU8lluKMREMt
        5qLiRABH7JvjQQIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog might already be running during boot with a timeout set by
e.g. the bootloader. Make use of this pre-configured timeout instead of
falling back to the default timeout if no device tree value is given.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
Changes in v2:
 - Reworked patch to use the pre-configured timeout onyl as a fallback
   instead of the default value.
 - Removed info message.
---
 drivers/watchdog/da9063=5Fwdt.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/da9063=5Fwdt.c b/drivers/watchdog/da9063=5Fwd=
t.c
index 3d65e92a4e3f..423584252606 100644
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
+	unsigned int timeout;
=20
 	if (!dev->parent)
 		return -EINVAL;
@@ -214,13 +216,19 @@ static int da9063=5Fwdt=5Fprobe(struct platform=5Fdev=
ice *pdev)
 	watchdog=5Fset=5Frestart=5Fpriority(wdd, 128);
 	watchdog=5Fset=5Fdrvdata(wdd, da9063);
=20
-	/* Set default timeout, maybe override it with DT value, scale it */
 	wdd->timeout =3D DA9063=5FWDG=5FTIMEOUT;
+
+	/* Use pre-configured timeout if watchdog is already running. */
+	timeout =3D da9063=5Fwdt=5Fread=5Ftimeout(da9063);
+	if (timeout)
+		wdd->timeout =3D timeout;
+
+	/* Set timeout, maybe override it with DT value, scale it */
 	watchdog=5Finit=5Ftimeout(wdd, 0, dev);
 	da9063=5Fwdt=5Fset=5Ftimeout(wdd, wdd->timeout);
=20
-	/* Change the timeout to the default value if the watchdog is running */
-	if (da9063=5Fwdt=5Fis=5Frunning(da9063)) {
+	/* Update timeout if the watchdog is already running. */
+	if (timeout) {
 		da9063=5Fwdt=5Fupdate=5Ftimeout(da9063, wdd->timeout);
 		set=5Fbit(WDOG=5FHW=5FRUNNING, &wdd->status);
 	}
--=20
2.23.0

