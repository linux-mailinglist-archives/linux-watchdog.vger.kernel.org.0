Return-Path: <linux-watchdog+bounces-2931-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36872A35C71
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2025 12:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A799A16CFB4
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2025 11:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185EF25B66C;
	Fri, 14 Feb 2025 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtFhgTSG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF522D793;
	Fri, 14 Feb 2025 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532266; cv=none; b=rguc62IHVvwg03p1POh3v+prJRrq+mA7Ulu80jx6twZFEY1DqNNzxk7d2xY0+LpYAlZbd1v1i/O6gJUPNKDuYJY2JjRT6u+oIIOODf11f/ok6wEkjiwQ4nGO50bNybpc5EaxqBYESr8pjFN57Y8dNRVs+oX0Vabj4j1WMW7FfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532266; c=relaxed/simple;
	bh=xoPfeGaMeAnbYc4D9oVEv8b6qS8ajimo6pf9kVPokbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J9qVRGT23VkP9ww1Zvog4Gr9/HU7pS6ZNmpOjlOX8/BOwCKuTY23+RKGxId+OBpwP9qpMLZSYqmLy6NwYC1WGTrkfApc1oVs6U3naw6yK2YRimdi6FJfw6+LhW78KKMIPD28mMD3d0D68bioOqcvMdsdo35y4mJlF7+zNxCRTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtFhgTSG; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so294638666b.1;
        Fri, 14 Feb 2025 03:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739532262; x=1740137062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u3ojM9oHoVngZ+zSXriBOwUU5fx5CwXrZHQTSmA34Q=;
        b=FtFhgTSGKVRSASbsFFTM65JbyA7UGxvgxhv8WDs8D1ZssG72ZoPAI4dhytPjJ06TDM
         0oCsLqUIzlCqxNcqHo1viF8Ht/nxoiHmeb9skhkE+2Nso/1MI0G2LPAAD/EkmuCvpBh5
         HuSkk/Xl0m3dSYZ0OBak74avp89eLblCrYSDBlh5IC10NuZm80lnmQXhmExAt51dTQMi
         uzID/PtLmkDXBbi75Bs9sFbXC5YITVwuEhRYl34ZYhNP5nEdp4I4jahMXVMCBZ4IL96c
         bzIqPG2hLNsug62vYrD8irmYxfVz3OV3cPQyPutk3K1HBVU47hf/iLZDcD4Bcm/0tmnT
         e5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532262; x=1740137062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6u3ojM9oHoVngZ+zSXriBOwUU5fx5CwXrZHQTSmA34Q=;
        b=Lt2kx4yFt3/DBKQTQJ9jmNzcIbthxCCIFamYodQpV7wKaDnj9gLXi9vM7oQWWgaV6P
         BaJiYzOD4qpCTzStCZn2OzP8boEXXr+g1nmzXyq/W53wUP+x2GWYRc2R5SDN/XLOtmoi
         eDgEslCu2L4PGV4nnClA4GN8tJaAm2coJCsTUqQTW2/IW/bUJwHuflJkU19NHdSzhgUt
         Tcg0QAcr3d+nKzsWLrq8X3yvbrO61Gmm6AQgeb+ez3m6HlH+P5P/YNSsj2GGX0H85+YI
         JHHkXiVZcVI7qFJEoTx3YePCfM1hzZB8THobuxYag5LMqwJ8/M7qNUW7QxJSkTD8RSce
         68iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuHHl0pj67/J9YJ4m8NaaJ9+Rlap6RG+sP2oiGGxkj73Q3feUceMeNNR1AYkzzYIkwjiJplKVJ5DsFM8s=@vger.kernel.org, AJvYcCWNhtUT5ss+NC7a3O/gJww9vi8eLvZblwWwdJwNPv8XzGsEA87gUHpHmNTpnVT7menRQUj2MGwZWaG373SBQfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jzCX2KLJQzDfyqYxkDCHDq2CkUTa18BL9axk+ebA5JDYL3Fg
	X8vfmQbNuMAAxfeCNCDLNe9C3XZNEZIPjQbuIOgH3ljnto2oz8I4
X-Gm-Gg: ASbGnctsYRZcWtHb3M3OP9PK0PScHMqNmTfl4BwXvIGCb0nCDqihmiwdIXbGioZv0wT
	QyLZrlcHeT/i3QZ8h1GpJ2PdKg9/xl6CzsibzHzjt22JuxqyLdIFF9g449bYer23jJ7xZiQ60N2
	BB7lq3ncpxXRyGClbipz7s+TZNj0E4fvb9uj0JUgCk5DuTF89Lmr8IxUWWn3CswDZHrGr4rh5G1
	bxfEoQdOQS3wEURCufa7XbAbEtOH4d6WPomJ6yT+S9AaernH9KQfrihuvmblqE9tRoUjKd4EOBm
	F9jpQrLFf5wvulW7rLqVrVKPDl4lLCwYQ3OReWnpIPMusjFHikg3
X-Google-Smtp-Source: AGHT+IFpCUYSVYlZScFUUmsS8KG3/PYr/ve7XBNh3XUSHixfrU5ppZNMRkZVtyg8SPqunh8IFSJGsg==
X-Received: by 2002:a17:906:3283:b0:aba:a81c:f972 with SMTP id a640c23a62f3a-abaa81cfcbamr61349666b.17.1739532261556;
        Fri, 14 Feb 2025 03:24:21 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm329434266b.68.2025.02.14.03.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:24:21 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Regis Dargent <regis.dargent@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Fri, 14 Feb 2025 12:22:54 +0100
Message-Id: <20250214112255.97099-2-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214112255.97099-1-regis.dargent@gmail.com>
References: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
 <20250214112255.97099-1-regis.dargent@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the watchdog is already running during probe, let it run on, read its
configured timeout, and set its status so that it is correctly handled by the
kernel.

Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
---
 drivers/watchdog/sunxi_wdt.c | 48 +++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..0094bcd063c5 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		timeout++;
 
 	sunxi_wdt->wdt_dev.timeout = timeout;
+	sunxi_wdt->wdt_dev.max_hw_heartbeat_ms = 0;
 
 	reg = readl(wdt_base + regs->wdt_mode);
 	reg &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
@@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
+static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base = sunxi_wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+	int i;
+	u32 reg;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	reg >>= regs->wdt_timeout_shift;
+	reg &= WDT_TIMEOUT_MASK;
+
+	/* Start at 0 which actually means 0.5s */
+	for (i = 0; ((i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg)); i++)
+		;
+	if (i == 0) {
+		wdt_dev->timeout = 1;
+		wdt_dev->max_hw_heartbeat_ms = 500;
+	} else {
+		wdt_dev->timeout = i;
+		wdt_dev->max_hw_heartbeat_ms = 0;
+	}
+
+	return 0;
+}
+
 static int sunxi_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
@@ -192,11 +219,22 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	u32 reg;
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return !!(reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_KEEPALIVEPING |
-			  WDIOF_MAGICCLOSE,
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_SETTIMEOUT,
 };
 
 static const struct watchdog_ops sunxi_wdt_ops = {
@@ -275,8 +313,12 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
-
+	if (sunxi_wdt_enabled(sunxi_wdt)) {
+		sunxi_wdt_read_timeout(&sunxi_wdt->wdt_dev);
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	} else {
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	}
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
 	if (unlikely(err))
-- 
2.25.1


