Return-Path: <linux-watchdog+bounces-2337-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73B9B1D48
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 11:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47EEF1F2175E
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 10:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449BE1422AB;
	Sun, 27 Oct 2024 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="BmNigL3W"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBD757F3;
	Sun, 27 Oct 2024 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730026438; cv=none; b=BIo34UOlvkje127EGo7U9/3USv7fcp+u+KdXboK2PVteguf5ayof+eZ9W7HEh+LlN4rmuWR3IH9o/kEZ1OGoXx9IMgu56ptjnt2s/2yG8ydtIt5y1PDfDwCGWfsebDCxdvkGCMzabW3JxC6bwDslrRsLVCd0wULVN53IoYExBL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730026438; c=relaxed/simple;
	bh=dxcu+iunOvlZh/IlVyejT1uva4qP67Z+sL8XEs3bmS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iqtlDl8Qh12yqRWc/knKSGZ/ESaC2uVYdj8VjiAun1sJbhrBfKGrzaEOyOi0LreB3qGRhZtqLDHwnFGqcyryj76ek2ffvhW2JgSLa8DFUCT9njV6qM0mIrCw013M0e32s6GF8CYSgbFy8HP7DZXO3GJh3S38ubWQv6BXMLcxUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=BmNigL3W; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730026407; x=1730631207; i=wahrenst@gmx.net;
	bh=jjwNijrvKZT0Ys4wclgpDfV+voMAzDqhFR7Df0Ey+kU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BmNigL3WljbvSp30E/IesTCVHH0yVDLhAvzTm9xhHSIKmKJSWFKdS8sb/bNx5xJN
	 DQ0oLzc+Rzk1ilc3elHNlD5v4l+quSo1RzFTPYlCv3gsSWCopaZ4jSznV4cudqOKN
	 uKQfT0OgyPzjIu7zNqYDPC2ZqgfhKwIhvKqZyfBZGKRdsqXCwKI9/1O+A0q02jxP5
	 1LqQDvLqVm0GurzoO7YKaoRxF9lqAaTMIpLnDw0CqmbVULR6bUIt6frrzabSgpzlo
	 OQ/D8JKt3v3aFTznjc9c1H/CUTor2uF0tuSE8Slu/4tzbiz1IUEE/i20AvKZOyAAV
	 N+Nct5wsctdrHSGHQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1tYYcq14Ip-00Zvmb; Sun, 27
 Oct 2024 11:53:27 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Alice Guo <alice.guo@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/2] watchdog: imx7ulp_wdt: Clarify timing units
Date: Sun, 27 Oct 2024 11:53:22 +0100
Message-Id: <20241027105323.93699-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027105323.93699-1-wahrenst@gmx.net>
References: <20241027105323.93699-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PSXaYff7MhW/cCEWq4pGPqiHPaIKUJrD02Vd9fPxvSEvWykyfaF
 jeqmtiu4K8OyvbOGINbaaFWETDZHznNml9O+vu3z2z6+Px9RoZMoeqazLMXKwDdokcwKdpN
 hd9buWnnFBbsk6qObQeh+Y12byK9tds/NLGMHVMgCfVAZNu14OPbe6nWo/KPOLautFfsvQ8
 S8WDWLVjG6z3H87UFRmcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RL3RZAw2w/w=;SOIsteGMqRBtXO8l74/YUpLUDLM
 KmUperZps0hv5tYV6fDr7RA/K5nfeVLVVmyrVJTOhQNIF8+2Rzg/tJMzYEX5RaMLnMUKHN75i
 +SHmetpvW9D66KFbVY0OLk9o/kLxWZPdBfwPm31gHAIwlsuA/Ojsjj37nEJW6KybkSBJnA8E+
 kIccQ2xGBhoU+2cwR8AjAyux37ncOLbi05c/ZqZwaiusis2RhfPG8RsAvLzUnDNn3PhKLs3JZ
 47xM8+b1LOBpH5QegPTsrdCW2KVJ6dIBYAXbyhoVzpLhNxgJ+JWr0VIgCB1ZjswDVE5MZ2ZuH
 eYOBKNOOyUd3o2ov0JNRj/r8ZPBaW6+VyRv/IU6qCErxb5ZpeIeqG8QBJ8s3R5E2B8bFTPpNO
 iku/JX1F4hpwqs6z6DxyT6eW9Rfg9xCUSKB0BdNdbCfx3GG5W0QaFL1+eN0hcgm5W53/qcJzx
 gI7Iw9vBn3EpdhzgRz2QcRFkZFIBsEq4WhKe9eU8aMoBk9QRLjTlm9HDEnFnpV4gq8XPOQUJ+
 XvAghV50XpMBeK79xgCcAs0wzwlP3F90pqzetVlqeb4MYxGCrUxtKkAddcDVFlO04DEYgxAd5
 yfq/rxkI4Gh0Ys54vRmnZnVMZlLNQ1Eph3e6IClOkz/TToF6ut3KYVycv4dLUS0RlV24hUC8h
 ihVwrXOQnWeWItRsGNZyLLSAaMLRpwuWlwNe21qlbohiPK8+5f6dFgj7YoQFlj5l8bxkBMbEL
 XnsDz4OhSWhY031LKmGDVvt7vvtGDPgonBedVTP7IfLwIdPHmCI4Yko3Pntu2QBCz7rHrDdkY
 01IDFxh9f9bxAr4ABFhGXmQQ==

imx7ulp_wdt mixes a lot of timing units (frequency, clocks, seconds)
in a not obvious way. So improve readability of imx7ulp_wdt by
clarifying the relevant units.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/watchdog/imx7ulp_wdt.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt=
.c
index 0f13a3053357..0f92d2217088 100644
=2D-- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -19,7 +19,7 @@
 #define WDOG_CS_PRES		BIT(12)
 #define WDOG_CS_ULK		BIT(11)
 #define WDOG_CS_RCS		BIT(10)
-#define LPO_CLK			0x1
+#define LPO_CLK			0x1	/* 32 kHz */
 #define LPO_CLK_SHIFT		8
 #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
 #define WDOG_CS_EN		BIT(7)
@@ -39,8 +39,8 @@
 #define UNLOCK_SEQ1	0xD928
 #define UNLOCK		((UNLOCK_SEQ1 << 16) | UNLOCK_SEQ0)

-#define DEFAULT_TIMEOUT	60
-#define MAX_TIMEOUT	128
+#define DEFAULT_TIMEOUT	60	/* seconds */
+#define MAX_TIMEOUT	128	/* seconds */
 #define WDOG_CLOCK_RATE	1000
 #define WDOG_ULK_WAIT_TIMEOUT	1000
 #define WDOG_RCS_WAIT_TIMEOUT	10000
@@ -240,7 +240,8 @@ static const struct watchdog_info imx7ulp_wdt_info =3D=
 {
 		    WDIOF_MAGICCLOSE,
 };

-static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int=
 timeout, unsigned int cs)
+static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
+			     unsigned int timeout_clks, unsigned int cs)
 {
 	u32 val;
 	int ret;
@@ -263,7 +264,7 @@ static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device=
 *wdt, unsigned int timeou
 		goto init_out;

 	/* set an initial timeout value in TOVAL */
-	writel(timeout, wdt->base + WDOG_TOVAL);
+	writel(timeout_clks, wdt->base + WDOG_TOVAL);
 	writel(cs, wdt->base + WDOG_CS);
 	local_irq_enable();
 	ret =3D imx7ulp_wdt_wait_rcs(wdt);
@@ -275,7 +276,8 @@ static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device=
 *wdt, unsigned int timeou
 	return ret;
 }

-static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int =
timeout)
+static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
+			    unsigned int timeout_clks)
 {
 	/* enable 32bit command sequence and reconfigure */
 	u32 val =3D WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE |
@@ -296,11 +298,11 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_devic=
e *wdt, unsigned int timeout
 	}

 	do {
-		ret =3D _imx7ulp_wdt_init(wdt, timeout, val);
+		ret =3D _imx7ulp_wdt_init(wdt, timeout_clks, val);
 		toval =3D readl(wdt->base + WDOG_TOVAL);
 		cs =3D readl(wdt->base + WDOG_CS);
 		cs &=3D ~(WDOG_CS_FLG | WDOG_CS_ULK | WDOG_CS_RCS);
-	} while (--loop > 0 && (cs !=3D val || toval !=3D timeout || ret));
+	} while (--loop > 0 && (cs !=3D val || toval !=3D timeout_clks || ret));

 	if (loop =3D=3D 0)
 		return -EBUSY;
=2D-
2.34.1


