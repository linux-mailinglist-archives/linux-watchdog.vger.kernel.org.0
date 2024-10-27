Return-Path: <linux-watchdog+bounces-2338-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E832F9B1D49
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 11:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC029281C5E
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 10:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51AB757F3;
	Sun, 27 Oct 2024 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZBX1YAGK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713ED7DA79;
	Sun, 27 Oct 2024 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730026438; cv=none; b=HOyGDIEZanmMqAgbsJu5scrKj9cLD9oGyrx0q7wiDCKzb9JfHjt/JavtyKnriyrQgLr0ml8lD8iAKnLmRZ/V0RTL5Bfu5lwdIUdZ0oolDJxDYoDYnVGHO+/G6dkCko2Gnj5DZuaeN1JJPaRWAIHlxHJqR7y5ifragHI9NInuyLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730026438; c=relaxed/simple;
	bh=f4dOObQJykz6hvHZafEdzpPvQyJOtqxrOnt2kMjhu+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DjIy6pYbG6vaxpn2KSfTKCjDy/U4OByVa12gkIvOfdBUeUDEcCJNMqmzOqXJz4+/IHEbR8BYegRIG6Pgnjg9Ry+0eruPPokngos/ZqBJHG9mqmBbvYbpN3DGDaN/p30GdUTNdFtbY4pmh010eu1dojSE74MHeNDDEFznDesvwDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ZBX1YAGK; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730026407; x=1730631207; i=wahrenst@gmx.net;
	bh=amR7q2oyVDCPTD+JFf82ITSsa06XHfywxM0dpjUf838=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZBX1YAGKM2Q/ODHSMEsAPVCDNJKQoTGDrkCrMBmmxNoEpGSo9yVS62oaOLZo1CzP
	 R4A3NMBYSNKFNSfP7ScX7Uhwic1XSDBHWMVBYJhrVFbXsKPlMOlO6e2fRJSc5V/An
	 p4PAATukfbWlLPzIDbjH5XCwqB7qki2ykfdAfdcmDIa7mVZ/nFO+HNN43uJXgO+ik
	 fNr34Rjl3dKUQmYmaBbIMT1ZgsWFc8kqtCc4D9BQ7Mu5a4zoY5EqHHV/BtVnbeARh
	 Ezls6bTTIM4CoBejkt0BuYdFDUDEwXJY50TWkCQPAkxqL3+sZdskUfu3jjo+X2+l7
	 2BR7TpudzDK+Y1M8eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUqL-1tAGU433Tr-00Fy6z; Sun, 27
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
Subject: [PATCH 2/2] watchdog: imx7ulp_wdt: Add TOVAL range check
Date: Sun, 27 Oct 2024 11:53:23 +0100
Message-Id: <20241027105323.93699-3-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:ixQ/x90mo5PXTNYv1EsxxaUkhBxYLnesal3lNThiz4oNmP4n7fx
 5QKMtzxeA9Pt/dQjRqqtPkMj6oFihuqlT4eqwLUY4cIQUvi3nNkrTVidnHvScU7UrW9ajTk
 AKr/P/rMT8MpbipfOXACjic48sCCjJygKbGBO77Q2qOrm74IG0bwjyShZ2ZKzlLUnXiu/pu
 4bnWGW7HsupuDzudeU10w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pS39l6IyZ+0=;YaLHbpVjVmMlZS4hLYsRGTYNuMC
 oh1uaH0n7KWLYHXQwFxe58i6SwePAWsvzD1aRDpKyHa/C0QeSKBSzDuA8GA4D0GMod7fDRyhs
 N5jY0yusM52G0xSaljoxt1oJEaNztN/lO15yOt/sVmoblyfswdA6gmeRjnyYgIxCIqwsM/JhN
 MGIIapPHs+pCsntIYdXj3hY2lqB0079/oc1N+j9lnc0JEBUp2nW5a6HsmKjfIwTCEqo+OW+bX
 M6ygEWveXIm3EkX5VYzuH1MZAIHOrGrEFsZDoSn+yJB92PimNIkAm2LfcKRKuS208khHNUokf
 J0iGcjX/ZFmNt607Nuv+atmPd0o+QYc34rNkSwfrqx5kjtv9PRLu1Ze99uZDoDdYBGCwXVuGW
 hSyamM90b2anO/CiYctB10tuaEDhry7qfcpxSjY/DoFUzML7FlPkp7CQM4kk3K0cuMnVTjRdz
 iixarDdcDiUDcCjgYxaNKR0WLv1ToEHdEq2EBmdFZMo0e3vVeF+VQnd9AoPROuE1YrS2N8RAS
 K8elx+HT/hZ76nFVKzNe7009Kp1b7Uv0VudHLH+Id1Nodq64TzsM+UMw6I5UruWhuo0hu7DJv
 k64Mh91nXHkYyKf2Z7ROnJTRTC1w8sb9flrVPub73gVpUN+juJhXRWCVDYNLO/x8f9Zqt5oO7
 Dpdl+P2ItlI8IKSkFAlE54G7Pgeuw/ELdU+ocdexywQsUHOCUDKn0B1FJtsqqz5eQjwRW4Yiv
 dImIBpwarPvp0/uy/38acPAtB/kgwMprFuZPvuIn/9K2it9HoSUM5yIiPmdfVrOOiLpDtN1mo
 IGTbHeamI4OKEha2gm3NTeCQ==

The WDOG Timeout Value (TOVAL) is a 16 bit value, which is stored
at the beginning of a 32 bit register. So add a range check to
prevent writing in the reserved register area.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt=
.c
index 0f92d2217088..a7574f9c9150 100644
=2D-- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -48,6 +48,8 @@

 #define RETRY_MAX 5

+#define TOVAL_MAX	0xFFFF
+
 static bool nowayout =3D WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0000);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (defa=
ult=3D"
@@ -192,6 +194,9 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_dev=
ice *wdog,
 	int ret;
 	u32 loop =3D RETRY_MAX;

+	if (toval > TOVAL_MAX)
+		return -EINVAL;
+
 	do {
 		ret =3D _imx7ulp_wdt_set_timeout(wdt, toval);
 		val =3D readl(wdt->base + WDOG_TOVAL);
@@ -286,6 +291,9 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device =
*wdt,
 	int ret;
 	u32 loop =3D RETRY_MAX;

+	if (timeout_clks > TOVAL_MAX)
+		return -EINVAL;
+
 	if (wdt->hw->prescaler_enable)
 		val |=3D WDOG_CS_PRES;

=2D-
2.34.1


