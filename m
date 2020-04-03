Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20AF719D73B
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Apr 2020 15:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403865AbgDCNHe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 09:07:34 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:65370 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgDCNHd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 09:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1585919249; x=1588511249;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wbIR5CNO6oJzqk4vJrLuH0uLlsYO4RkeTDpQrai1S9k=;
        b=AALIoyYLecCMygoglVwR8w7eX7Hz3EH85+HNP0DxRs+e0X4xneemIlw/ubFeUvvH
        6Qyx7Sd8PDGRvkIcc4E3GhqyRXQcMDL+Y0TDaanKo98w4CKuZLjmS4SYFgbI66Rl
        lVE1SFyx0JJNl90hrv7vG7jtZFSPK9CQ82WDyUy21tw=;
X-AuditID: c39127d2-583ff70000001db9-dd-5e87351184d5
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 03.88.07609.115378E5; Fri,  3 Apr 2020 15:07:29 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020040315072926-138370 ;
          Fri, 3 Apr 2020 15:07:29 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] watchdog: da9062: No need to ping manually before setting timeout
Date:   Fri, 3 Apr 2020 15:07:28 +0200
Message-Id: <20200403130728.39260-3-s.riedmueller@phytec.de>
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWyRoCBS1fQtD3OoP+aosXlXXPYLG6s28du
        8WThGSaLva0XmS0ev/zH7MDqseKTvsfKNWtYPXZ+b2D3+LxJLoAlissmJTUnsyy1SN8ugSuj
        6edfpoIXXBUNk6azNzD+5ehi5OSQEDCRuPljIzOILSSwjVFiwcPoLkYuIPsco8Supw/AEmwC
        RhILpjUygSREBNoYJfYcncUIkmAWcJB4PPchkM3BISwQKbHlqztImEVARaKpeSkbiM0rYCNx
        e+UBsBIJAXmJw4eyQMKcArYSJ/7PYYfYayPRvvwyVLmgxMmZT1hAVkkIXGGUePz4GDvEoUIS
        pxefZYZYqy2xbOFr5gmMArOQ9MxCklrAyLSKUSg3Mzk7tSgzW68go7IkNVkvJXUTIzBMD09U
        v7SDsW+OxyFGJg7GQ4wSHMxKIryOM1rjhHhTEiurUovy44tKc1KLDzFKc7AoifNu4C0JExJI
        TyxJzU5NLUgtgskycXBKNTBq/pUtusUSXL3+V8pJlgl8J1nWBfVxa1nwxb9ezsXMNNciTTZE
        n+u9TGf53JN5UX+9Cm4f7ir9rXV8UX5Cf+jylu9ccVYlQbMX/ipM+H3crWc3b3f0k1unagx2
        qwSxmBfqc+qvqHgkcXZTaYBTwOYOLaE3BWWT071P/s6b5fRiycsZk2fl3lFiKc5INNRiLipO
        BACci/2VQQIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is actually no need to ping the watchdog before disabling it
during timeout change. Disabling the watchdog already takes care of
resetting the counter.

This fixes an issue during boot when the userspace watchdog handler takes
over and the watchdog is already running. Opening the watchdog in this case
leads to the first ping and directly after that without the required
heartbeat delay a second ping issued by the set=5Ftimeout call. Due to the
missing delay this resulted in a reset.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
Changes in v2:
 - Added Reviewed-by tags.
---
 drivers/watchdog/da9062=5Fwdt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/watchdog/da9062=5Fwdt.c b/drivers/watchdog/da9062=5Fwd=
t.c
index 10b37dd65bed..706fb09c2f24 100644
--- a/drivers/watchdog/da9062=5Fwdt.c
+++ b/drivers/watchdog/da9062=5Fwdt.c
@@ -67,11 +67,6 @@ static int da9062=5Fwdt=5Fupdate=5Ftimeout=5Fregister(st=
ruct da9062=5Fwatchdog *wdt,
 					      unsigned int regval)
 {
 	struct da9062 *chip =3D wdt->hw;
-	int ret;
-
-	ret =3D da9062=5Freset=5Fwatchdog=5Ftimer(wdt);
-	if (ret)
-		return ret;
=20
 	regmap=5Fupdate=5Fbits(chip->regmap,
 				  DA9062AA=5FCONTROL=5FD,
--=20
2.23.0

