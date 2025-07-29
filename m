Return-Path: <linux-watchdog+bounces-3913-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CB8B146F9
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 05:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9E717D833
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 03:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B763D2248B0;
	Tue, 29 Jul 2025 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JajFpT3A"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0A224240;
	Tue, 29 Jul 2025 03:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753761089; cv=none; b=nXF80Ni0Q8V3Xljmqexd70JOebzX5QKUwpvMSklvXKDpqnNGpY5HAGcmOJuOBSTLuMFZ0y4Upaqapgc5hyd3UiV/Ib94EZ4VdZ8lsppLao053yYzrNtC1KtZZtpGaNY4ytjTR8LFxvOJUwp9n/tKguH6Y2zi32VTBVKpALov7A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753761089; c=relaxed/simple;
	bh=QX3pJcNeLergKLmQUtnua8p/S99y32pnQR2GPvvDjcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rI8WkUpgVoOrUtWmcBr/EBDnnuPSbRS6n4WZGZNyq72BBgXpCsPvY984175GlNh0CJVFWwNJAIakz2/yeNdD4xNDoW4XCTrmvaevn2OzzpyRFxDHk7rZgDkuojOgKoRxHG4RjNPlZGpVr4hVJqCKA63CaEtcI9XteIvEiz9Yw4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JajFpT3A; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2403c13cac3so4780445ad.0;
        Mon, 28 Jul 2025 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753761087; x=1754365887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaH78BxSqInc7YWoloFx3Urvp7YqnyUZb3BPxUwn1CQ=;
        b=JajFpT3A4ytx8j6Jr5r2pXuLgU/OO5H65h2363BxxzXqrZx6FeGvhh/Jny9Xqwpe5z
         +MyEf9efcTCsg8Q8JWVAXCsGEEsW0otJmLRR91qfVhJsd9/rK+vtaxZzXWkbWn3x0qOR
         pjw0SCO/znZDjDKl2duKMxDRngtyPi6zP2K9gC+TcgdBhXJAVzzQfMmt7ZP0VSVRG7uJ
         qRE5j6du+oHR8sfd8B8OyauYFANsbOw144fdbyEymKcHIizA0zu2q+tjszcVcDLAoS4G
         WYfdwqqBlc7r2KO63t22qYLFcjHs0aZ/4bjqBez/g9rRKp2pymlu+pqe1y77CtlU8fCb
         TRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753761087; x=1754365887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaH78BxSqInc7YWoloFx3Urvp7YqnyUZb3BPxUwn1CQ=;
        b=MLqdif/caHIagRm9Spcr33GtY6uX5Gup0jzajx3R+eF46+5FW9Fg62fyMvKrTm8UJM
         xQ42K8IYMJl5pefeQjoCRuPodoTStelrr2rkPOyMJ8/N2L0r0ckP/LAXTEbcYvaXodYT
         uRAa2iA1SHnf4hCpL1kDQVY+wOtEyeDMDmYcG9OL9CAM1cDyRjxJv5Zlf188+DCvo0Fw
         gAUI67oEtownbWW5JgC+IMufD9fYiyECm+h3SmrmJzeam8jdgLPyH2NS3JsLrTUC2KUL
         ffBZH8Wd7Q+Jdb3sRkx7AapqLFFFpMgB5M2uvyH35eD33+MXDSn5HH/lwKr7fZaTuU1l
         r7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC+e43zSWTLgWdx7PSysFo7GFNjeZEClFj7IuiqiYouSfXPbOw6bdwkzckaM//GwMLoZxwvwzbFw8n30Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6C5f72oUkUUH75RZcIyNgv3Kn3c3jX4rziHzCnMAB0+qVB30
	QVjmgi60xNc6epN2RjSukYpLUFuZj3srPTfRv6YScvptziFBQGYET0Ev
X-Gm-Gg: ASbGncvWKv4yPZ3hX70yl6ebblrojp/g6d+vAnYqTG9drBF2B5Gv8nMQuODeM5wbALs
	6QkYVLHltn2mDyPO141tCuTP7J2wekeK/35qWVRUTkXQljskpNzsm1qnUroihfiizfKXrFS2Wzw
	ZTvHIh3adRWE+8FA/orfzanOKfhSsJpYdmEFYQOH8cTZ+/S2jGsU15gXK6i8uA4YPBVPGxb9Pzf
	H5cHbdeRd5oXI4vAZ9CsuY2rhC/Mb7RprsfEaIQaapBmc3BEY0GiV8Z+nPSbEbHLku1RQwJSthF
	FEe3vd3wgAZQLVIVOxPlf6ymfPqrCALyQ3R2xljP7ZwJvDivhaQS/MvPyt4lyPkiQqm9Z3z8Has
	LNny8NDjDMsWfWLu6+syYZF68ErOIY3SuLAZtEjfwIw6Pk1LZGuYHUg==
X-Google-Smtp-Source: AGHT+IELJXUiKm6KGXwaWiJUOPXk0c1EvlpOE0FOhZcoN6Z2MeI+X6ZgSi+Gg/tOSGKg3s7RZBPU3A==
X-Received: by 2002:a17:902:e84e:b0:23f:9718:85f5 with SMTP id d9443c01a7336-24063d62911mr24916295ad.15.1753761087280;
        Mon, 28 Jul 2025 20:51:27 -0700 (PDT)
Received: from CQSWSUNAO.transsion.com ([107.155.12.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24025f5a3cesm34549145ad.72.2025.07.28.20.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 20:51:26 -0700 (PDT)
From: Ao Sun <aosun718@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	geng.sun@transsion.com,
	Ao Sun <aosun718@gmail.com>
Subject: [PATCH] watchdog: mtk_wdt: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Date: Tue, 29 Jul 2025 11:51:17 +0800
Message-Id: <20250729035117.3170-1-aosun718@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the device resume process, an interrupt storm occurs after
interrupts are enabled, preventing the watchdog device from being
awakened and functioning.

To ensure that the watchdog is executed before interrupts are enabled,
Use NOIRQ_SYSTEM_SLEEP_PM_OPS().

Signed-off-by: Ao Sun <aosun718@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393f609d..5f2179dabd67 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -327,7 +327,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
 
 static const struct dev_pm_ops mtk_wdt_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
+	 SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
 				mtk_wdt_resume)
 };
 
-- 
2.34.1


