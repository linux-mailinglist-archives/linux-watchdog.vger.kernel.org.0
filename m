Return-Path: <linux-watchdog+bounces-3007-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A260A4433B
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 15:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CEA73B53F8
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 14:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBE926E62C;
	Tue, 25 Feb 2025 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7HWpaer"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9426E62D;
	Tue, 25 Feb 2025 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494221; cv=none; b=L1P+URuMc5sv04xTRrf7UiONUUtCD92ajaTFITLyvwwqKZPBa+FzEnSdNf5IL7eklHtx6Pj+n5K52gIS1xS8khqxPqIanCUg81Bpu+fUd5TLzwvfkcgk9HlgSJPJEgw1F3LEzt+yIsUKF6aC+vMDazy6+hdCvp/qmuOEh0fPiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494221; c=relaxed/simple;
	bh=oxUNXWyrdbfw0HhvZKnTRghHV9qRgTedjCmOgTIoAls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vAnIKoM/eJ3i3gjWgWvmoHa/osaEqRDyBV8ab8dYqn6Go1/0fNPk2fjiH50YNCbX0Kv8aAFgoklC5bSQL7sgdUo8iYjU7fx7pRTK5q6C2gAV8WfmfqpwprvhEPfxHqX5roCeqXnbEF72sTCvPw7A3+UFxhFsjKUN//qRijizuoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7HWpaer; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439a2780b44so36049905e9.1;
        Tue, 25 Feb 2025 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494217; x=1741099017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/sg7omSvJw4OhSWVma2ygvtz/i44Mb1jIOoIOn0G+U=;
        b=F7HWpaerfbOUNm+vn2Xit4z/fS+YoXC8nmJKNKn+PrxvqhKLJ5oqDrolzSH4jsz/wk
         0VhnOFw2tYfgoZF7U37EdqidOg+Ug7bYyC0+b3eoCbhRwkniRdlvXFwt84TFeL5glEN6
         ldluRQshSDTr78+mFF0eC3GCHQaYZ1ygHguy18AC0OFOyxGRl853hwwAavJVPzx4E3pf
         Q//SmI8luU4gUXoHEM+PaSPXLp8NPK0ffKixKS+XMRAdjwjWjkibBar1NtxadCYmDHPz
         caiLTDmZXUM3g3RPdW926CgYqgegXdrYIVo0hsaVjf5rp1g7bKeWU8AL0vwCDoBR0MKy
         WVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494217; x=1741099017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/sg7omSvJw4OhSWVma2ygvtz/i44Mb1jIOoIOn0G+U=;
        b=mrfg/zXrzQ2T6EnMiQLCIXcWRkdLem3D8krrWDElYogDbA1+ad8RKZj6LvdIxu6UbU
         en9ZUEviGSSDW9lkb9Ls4EdDmY0YFAe/6KqAbyO7IL22LwVRLo5IvX+Wg8ae6t1dra3h
         FjGhaHK2F9liShXytpNuRLzZTLtZ0toMDQrP7z10d5peCbrhh1dyFKqxb/TpcTKd6jOG
         9EE/Drg/aaP05GAjjk9s4vI5dniig1rBLTf8ONQL5Vo+pLICBNXAdNyNd1qZxeweQAiM
         EmcGA57UcB5hfvqA/qPTI4rgeeDUpAopHYLmbzRkufi5J4JDMQZPS/b/i1IwtwUcP89W
         GX5g==
X-Forwarded-Encrypted: i=1; AJvYcCV/WJBOECWMrdjOaw+iNg3FbxdkVqMCsXr7q6U/pPplydUReSA+v1ZYWviJOm9Vkop2KCHqrNS6VsLNmLs=@vger.kernel.org, AJvYcCVtgwJRXDXRwbzGntpKquhaMvf1i4BoQ5Q35FwJ5yj/1CgtPhCFovB2Pc2rcPCF2vLjduLORJjf9mUXLdiVdqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ3DPRpFmd9W9y7GYYZtOGUawCBKvUMAZZ8pk5itQp52aFAMb8
	nX8MCfQYLJ58fRKp+qZlq+F2K0JcQQ/frWb7H9YNMfXws8bPr02y
X-Gm-Gg: ASbGncvyF51V6+2gLW0P+lW4fVIXwPDOFFVZn5dk7/nZCdj0PUJ1zecrL0mqD3c/ECv
	PpoIbO8eV1a1UgXmNhQ88+/uW72qYOwaarHgMzXnUrCceS314a/rWaB3XNHH8zl3yyw6IszxKEu
	r/AmDEDdMSafwLdVn4wGm/IIb3IIRmVsDhVzShVQQeLx+bNuEN7U9XT1a59hLA2lfLdn7gCMnNF
	IYP3w5JgwFaKeTUUJnaewvBtekLXF67vNpdwfAD3LBSNaQk8rC6BEaf5CsxG0DmNaqOyd/ra4Mu
	qd8nmAXc/DXu2+B37WpgOLV2xp3tezKTwcXMefcpuzEYvLKJY50O/eoBitb5Lks=
X-Google-Smtp-Source: AGHT+IFPeiOcFGyA9KgALMCP8R9zH2itjkDt9MTElBJ+IdcbxwJLf0w1wOrioUPVxCe8w88V34Lxxg==
X-Received: by 2002:a05:600c:3b1e:b0:439:9698:d703 with SMTP id 5b1f17b1804b1-439ae212960mr145877145e9.23.1740494217035;
        Tue, 25 Feb 2025 06:36:57 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8829cesm2474493f8f.49.2025.02.25.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:36:56 -0800 (PST)
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
Subject: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Tue, 25 Feb 2025 15:36:38 +0100
Message-Id: <20250225143638.1989755-2-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225143638.1989755-1-regis.dargent@gmail.com>
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
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

--

Changelog v1..v2:
- add sunxi_wdt_read_timeout function
- add signed-off-by tag

Changelog v2..v3:
- WDIOF_SETTIMEOUT was set twice, and other code cleanup
---
 drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..d509dbcb77ce 100644
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
+	for (i = 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg); i++)
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
@@ -192,6 +219,16 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+	u32 reg;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return !!(reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -275,8 +312,12 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
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


