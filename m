Return-Path: <linux-watchdog+bounces-1306-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E1925D2D
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 13:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CA9E1F21A21
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 11:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D117613B280;
	Wed,  3 Jul 2024 11:16:18 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D0173334
	for <linux-watchdog@vger.kernel.org>; Wed,  3 Jul 2024 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005378; cv=none; b=lUyPRd0S0XhGexFu746Ah4rAxnJ+/v+PkqAQJFuUye3Y2Vi7ZDebmTvcs1fZukcytO06y+VOslM/pmYELOWrpPGd8nGqUzbmzT3VE+1zgE5trNBlHqm7yyF7xFIn1sGfg0i1oAn4zRAfnMYJ+twOVy2WlfDR+eAgqnw6H+tOyRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005378; c=relaxed/simple;
	bh=98vEYXienUsBIDUj7+2ac9RWnPFaDY3wdY/QxR6iQ24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qYUHZ4hV7eahRGcswDZNhiUBzpJHkazlJnCvYOuK5pwrSmZtXaWyUFVJLbtE1X3cXkP7g4UcbRsBrSfEUAtQJ51UTDgf+/4xYzZxttJhUljkt8DKmNlYiY2XfAUTsGI9F2Mln96DySPeQoeYQH0YwsaNBsAGaNqym/lQCtR3zo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sOxy1-0005X5-BA; Wed, 03 Jul 2024 13:16:05 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sOxy0-006pz9-9T; Wed, 03 Jul 2024 13:16:04 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sOxy0-004bER-0W;
	Wed, 03 Jul 2024 13:16:04 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] watchdog: imx7ulp_wdt: keep already running watchdog enabled
Date: Wed,  3 Jul 2024 13:16:03 +0200
Message-Id: <20240703111603.1096424-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org

When the bootloader enabled the watchdog before Kernel started then
keep it enabled during initialization. Otherwise the time between
the watchdog probing and the userspace taking over the watchdog
won't be covered by the watchdog. When keeping the watchdog enabled
inform the Kernel about this by setting the WDOG_HW_RUNNING so that
the periodic watchdog feeder is started when desired.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/watchdog/imx7ulp_wdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index b21d7a74a42df..94914a22daff7 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -290,6 +290,11 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout
 	if (wdt->ext_reset)
 		val |= WDOG_CS_INT_EN;
 
+	if (readl(wdt->base + WDOG_CS) & WDOG_CS_EN) {
+		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+		val |= WDOG_CS_EN;
+	}
+
 	do {
 		ret = _imx7ulp_wdt_init(wdt, timeout, val);
 		toval = readl(wdt->base + WDOG_TOVAL);
-- 
2.39.2


