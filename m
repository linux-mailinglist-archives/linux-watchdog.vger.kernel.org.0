Return-Path: <linux-watchdog+bounces-1079-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557D8D5AF2
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 May 2024 08:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED061F24C88
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 May 2024 06:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9940F8120F;
	Fri, 31 May 2024 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TaeDAe++"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910C80631
	for <linux-watchdog@vger.kernel.org>; Fri, 31 May 2024 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138673; cv=none; b=WAlfTFW/iKTqpTVKBgQxeKKEnHCr3RBXfT/QXFXUAqikyuPdgLMqOPskNEpsaG1IdhP67dRsst4VFfnhY3ROk62jgOulUC1+JbQVnmEduautgQmJE+Vn3DTOMGdaStbjS3CxgUL35BDf8IVuIU5l+NEngENiElrYbUu6K03QoEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138673; c=relaxed/simple;
	bh=TJ37oY0V5Jeq9pwzVqB5NXbszEJmtjwoCWFdS6GxE4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IISaE3Ex06/2C0NhRwdxkAY+shjDFnEzrpvQohGuUrI9xUJeX+Onhl83UFpnBwBqrhIGUwet1yXjmOYr8Y7k5mAMs2LIpOfWAPLiQsbxePmKxtPNILzBgMPP8EHyDE8gvwDcgUI3wgXwik9f+8IzExkMIT6oit4SZrwwt4PV5z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TaeDAe++; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6303e13ffeso179214666b.3
        for <linux-watchdog@vger.kernel.org>; Thu, 30 May 2024 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138669; x=1717743469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3zKbshCSYA/cMA+U0AV3V6eLZi4juLiiPopO0uScF4=;
        b=TaeDAe++0m4Ns6B9zifIbUdv+4nb22aFjinH885cmLjGfdVytsdez+mGx4huERlpWE
         VotWKT7DlrfDsf44L4YmgSqawU7o2MqHv3yLfQXFmFS/l/77Bv35JY7w6bEls4z4FhM6
         /Y8HmqSs5I7ZzyIzw2HgDSxvCwqj9BXTHCc3UK+IvlNLGRreiUaC9dua8ZNEfNscsjdD
         bq30uZ27saV3xD6xF6s6Npsa6eVr7L1cBG3piKAkNPAt/I1uI2vmxEtSZodCQiw4WPH3
         eHN4bRX+ZmR4bbWR7woMiQxxqJFhda75ownrRGdhfPDXfCTOnld8jv4tPi2DPxuverv8
         5roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138669; x=1717743469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3zKbshCSYA/cMA+U0AV3V6eLZi4juLiiPopO0uScF4=;
        b=kpYTVOPIVhbzWRtErxnX8LYvk+QppHyVfL6PxMoQc3sbosJO+NG8XIzz1YbaSa5Adw
         NmUstyI6H2D+ue1Bmf29Us8JYwyfkiEuIiWiy4D/jG60buHbDWBaESgPOadtIPHj0aOj
         Yb45ICW7T2vNtQJ9KrkmcjCg2nyvwrNa+LB22bMTA72qkrBukN61nYdNx4AHtChcR1fh
         lr+WUlrBvFbpYvzbyO50q3UO1JR4zHpOcwaOfMhLXkRaTwufJtKZr5StbkyFG/jMOlMN
         w6LOs8D8xEmHhwq+vNnTelBWusycAB5d0G0QZ8+FsM765VGo7UKdZH79tULryybetnrh
         YjiA==
X-Forwarded-Encrypted: i=1; AJvYcCUUDfAavKf7b6mYNuQ4L8KsCKEuuw46Q7L1AZgoEFWNrsdoJP8MRhV0ixpXbofXdWzSYkY+0XPA6VCYVU8QiYUn4drXzJ/2mrdB/r/JMj0=
X-Gm-Message-State: AOJu0Yx/yuX40QrrTrRBDs6j4mxTO4QDvkjTzZxPqMnmHCfoPPMlhqir
	SGjXjL5/keww5aMZ4KbHfBnwqpG/lBdQkRgiQNH24Dp2NFMft6xg1vaUBq5RGuY=
X-Google-Smtp-Source: AGHT+IHKh7xpZYum2rGFe8T9b7OxPvNEJ0hlv1rVuy7vQA537DHUDNfq1OsJivp8xoV77YksfQsONQ==
X-Received: by 2002:a17:906:c34d:b0:a59:cdf4:f939 with SMTP id a640c23a62f3a-a681f87e9e5mr60156866b.3.1717138668988;
        Thu, 30 May 2024 23:57:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:57:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com
Subject: [PATCH v9 1/9] watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
Date: Fri, 31 May 2024 09:57:15 +0300
Message-Id: <20240531065723.1085423-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v9:
- collected Guenter's Rb tags

Changes in v8:
- none

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
index 85eea38dbdf4..ecd025dd0fef 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -932,7 +932,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


