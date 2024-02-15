Return-Path: <linux-watchdog+bounces-658-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E0856557
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 15:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8B71295657
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 14:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D69131E35;
	Thu, 15 Feb 2024 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="liuXrxrZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A3131E21
	for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006134; cv=none; b=AzAKvw4WZq1IQ/BpTDc8hPC4nvMdvCvAUTEc+Ix0q9oc1rL3mp4nujYzLZ/P8gK4UqTydOXScXdLR0DsLl6UorgBdtLVN/E0me+OL2rpbW+pfyfjmBSKzrf7D/8Kyebn0VEAkjCy3YCfFUaBVAdYGW4vFPbju4lmEu29yA1HfqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006134; c=relaxed/simple;
	bh=Fchmw8nbRjmpEgAKFhZiNFS9q3+KuEr6rfwjI5iiBZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n0L8qbhUmctChx+My6AIQt9UR9BYn/j0nbWaOoLk7jYHsold3/BdpmLgthxMdZEItUqF6rXJmCaoAraZDRLSlfSzE/e+6K1niNeO8qfTL3OvbXhEAjNXpSOt4FFLWOnm42cuaJXjp/gXziKQubACvlmPJpWWDhSBHu7BKvZl1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=liuXrxrZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-411e5f21c0bso7914215e9.0
        for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 06:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006131; x=1708610931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbA8yw86zJThN045X0EtpFQpuxqOp8ZxTfaBxRUnlZA=;
        b=liuXrxrZbGTmFmdmO8OCtao8eGk7LPGk4SvNvIU+FaBDtT9LxhieVnL+kCalPxban1
         s1WIbgYoppQ6te8iRs/Z5WbtGskXiAbFlwZcB7eLYC8Sri/ax9l4yxOdlFi54S9d3D0k
         cR8xf0H8g6f0/KQTDYoWg+q0Jol5KZdFZWj2XoT2rr4oAPykgEI05NzM1tRLGEbDl3Kg
         LtOKuXAksdSAAFTKnLq3/9J/mGw7fbIWRxYalMXiqXUsiu03NZIQlryJJG1EbQzWblWn
         sqo99ljpoyAhNdk9b+BiQ34xwbMcRWd+WDnrU559pt0vxzyNZlPQ3UKBn82TMKG6Qwxf
         FWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006131; x=1708610931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbA8yw86zJThN045X0EtpFQpuxqOp8ZxTfaBxRUnlZA=;
        b=P5NSwZLtMAYoQWldw8bmfy5dNYsqV9k2odMChyFd1IWHhRarPrcZ8SUsfVigjbrWQC
         0dfLojAjqltlUwFedc+Wr/hXtizgY/NUFuEK4cC4MAmeUzYmnODcd9rHoTdsQ7asLgsQ
         bPHWb7lF2h/STRqziYJliIIfwkvaC3+fFNxIODWNlGzAUtqx4GcsVcvwcpjhwFbm19nR
         C/kmMv1UVDfyPVa+iFBoV8LT8GE61D+YEE4D7lwdPYc40x+Jz3Zy1NIXRv0t8sH57Sf5
         SOoC/Uv9UWnmEjzDR12/el9QmlUGRjKvYImdSqeFa7EwioWTPoTnVlpKfFAzQJSwVuHM
         MV2g==
X-Gm-Message-State: AOJu0YxbO6V1FAsQEiT1M4NX2QXtkarP0l2EwpwJueQuEKZYH3ESXiFT
	rHLAp6mo5hhiGF75cRPRw/mt8TPH8vVR2xU+0gORQgkYCZqJh/zjFkY4cGsWuBM=
X-Google-Smtp-Source: AGHT+IFTyqQpVU/Xoz3zL+teKHGSJqj243sHJATELpm2c6EfTLcTyw9sq8/JlXGwStZDpE18lQp5LQ==
X-Received: by 2002:a05:600c:3b9a:b0:411:50aa:1106 with SMTP id n26-20020a05600c3b9a00b0041150aa1106mr1598084wms.24.1708006131495;
        Thu, 15 Feb 2024 06:08:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:08:50 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v7 1/9] watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
Date: Thu, 15 Feb 2024 16:08:33 +0200
Message-Id: <20240215140841.2278657-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt driver is used only by ARCH_RZG2L and ARCH_R9A09G011
micro-architectures of Renesas. Thus, limit it's usage only to these.

Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none; this patch is introduced in v4

 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 4700b218340f..bdd1527bb916 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -921,7 +921,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


