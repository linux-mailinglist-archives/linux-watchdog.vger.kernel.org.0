Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA89287927
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 14:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406563AbfHIMAM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 08:00:12 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:57448 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfHIMAM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 08:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1565351990; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9AAnIsSPjXXVlaeLYXNtBN2l+dVfCVXIzrOYQkHtBT4=;
        b=cnJeW70xSU2QVZSzg7b7OrmbGKAEm71VrdVVWSo2GCg0bXz5s+rzACcW5hz2XDNrUW2uRS
        IE3bhg9O1G0nnGZGyNm8O2Gl1uLLz+xtyuDgtgQ1v8zaLQYOMhhDx8qpVFAkV7xkAzeiso
        cxpsDwazavx4DqN1fCTiY+k+dqouEbw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/3] watchdog: jz4740: Drop dependency on MACH_JZ47xx
Date:   Fri,  9 Aug 2019 13:59:30 +0200
Message-Id: <20190809115930.6050-4-paul@crapouillou.net>
In-Reply-To: <20190809115930.6050-1-paul@crapouillou.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Depending on MACH_JZ47xx prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 78411609048b..90e689cbeed3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1644,7 +1644,7 @@ config INDYDOG
 
 config JZ4740_WDT
 	tristate "Ingenic jz4740 SoC hardware watchdog"
-	depends on MACH_JZ4740 || MACH_JZ4780
+	depends on MIPS
 	depends on COMMON_CLK
 	select WATCHDOG_CORE
 	select MFD_SYSCON
-- 
2.21.0.593.g511ec345e18

