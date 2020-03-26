Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC26194245
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Mar 2020 16:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgCZPCM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 26 Mar 2020 11:02:12 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46422 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgCZPCH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 26 Mar 2020 11:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1585234924; x=1587826924;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZtaKUFL4WFPqauqkay4ZKL991OIGk+dXJk8/oBMqrxM=;
        b=g2hoOhE/uF2KCdfKa2xcZv4hOkncq+ytoBl8JK7seW5JWgwrhwfEgnDo/tHacGu+
        GjMGxETN0Efe1/h/QtaLdYJs2ityWdE6S1uFrClSN+OEjcIBttPY79xRCqq23NXF
        yPRUNnMZhTk60FqR6ilFGTofofaoAXjvkmPY1KifumA=;
X-AuditID: c39127d2-583ff70000001db9-a6-5e7cc3ec7c4b
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D4.1C.07609.CE3CC7E5; Thu, 26 Mar 2020 16:02:04 +0100 (CET)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020032616020440-89376 ;
          Thu, 26 Mar 2020 16:02:04 +0100 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] watchdog: da9062: No need to ping manually before setting timeout
Date:   Thu, 26 Mar 2020 16:02:03 +0100
Message-Id: <20200326150203.371673-3-s.riedmueller@phytec.de>
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWyRoCBS/fN4Zo4g0fXNS0u75rDZnFj3T52
        iycLzzBZ7G29yGzx+OU/ZgdWjxWf9D1WrlnD6rHzewO7x+dNcgEsUVw2Kak5mWWpRfp2CVwZ
        N47cZiw4yllxsP0yWwPjB/YuRk4OCQETia0/pzN1MXJxCAlsZZR4//YYC4RzjlFi4vKHrCBV
        bAJGEgumNYJViQi0MUrsOTqLESTBLOAg8XjuQzBbWCBMYu+kVWA2i4CqxJ7OW0wgNq+ArcTH
        SW1AUzmA1slLHD6UBRLmFLCT2PxwFwuILQRUsn9xOztEuaDEyZlPwI6QELjCKHH8dg8LxKlC
        EqcXn2WG2KstsWzha+YJjAKzkPTMQpJawMi0ilEoNzM5O7UoM1uvIKOyJDVZLyV1EyMwVA9P
        VL+0g7FvjschRiYOxkOMEhzMSiK8TyNr4oR4UxIrq1KL8uOLSnNSiw8xSnOwKInzbuAtCRMS
        SE8sSc1OTS1ILYLJMnFwSjUwrn7TzZe1d41X96Swf29qHJmjGGpasmN2+B9n3Ca1eOo1d+md
        ZUoi81YYXL6/8FOM0iztbP63z+ZevMjnuUb7c13tJZ0lDpeOnSho1N3umCCtF/OdWyhehdPx
        tcSutu9hJu/vzlp3p4/XZfW1BzvfOrwxarjnunLL2enht/m52YOv/65fzeLopMRSnJFoqMVc
        VJwIANV+3R9DAgAA
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
---
 drivers/watchdog/da9062=5Fwdt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/watchdog/da9062=5Fwdt.c b/drivers/watchdog/da9062=5Fwd=
t.c
index 6d81b1276b87..c5bd075c8b14 100644
--- a/drivers/watchdog/da9062=5Fwdt.c
+++ b/drivers/watchdog/da9062=5Fwdt.c
@@ -66,11 +66,6 @@ static int da9062=5Fwdt=5Fupdate=5Ftimeout=5Fregister(st=
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

