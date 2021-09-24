Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B174175B8
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Sep 2021 15:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346035AbhIXNbo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 Sep 2021 09:31:44 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37526
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345067AbhIXNbk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 Sep 2021 09:31:40 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 13F0840816
        for <linux-watchdog@vger.kernel.org>; Fri, 24 Sep 2021 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490205;
        bh=F70yOyVZZjxlDll0pjQntOrMr5BdXyTooQkEjSqxu5A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=bvCkdON6OON/xBy62aiuJxacxTkgplY0rBmUrOanIX1Xu1K/gkwKXs5eR1vJ08HfM
         bdN3fTBvvcDh/5qIsLXB4adTs0j6lu/vNkHa4N5OErS13df68u62Wy3NacpMu8+SpH
         00HDu5CIQWIUEjAd23EaTKAuhhJ7quSzEE5AgU3PqnWlp486ycMUclgIRksbDHCIhN
         Fymy+df5zABlva8XS8F+xVZT0WEs8zbmh2NUC36h9aprb5Qdw40onknHz0bPXfuSSb
         BGu84Pzo8U5pcylatiIg1q8Vjj4f6rJLOgVxqA9FDIbbNYMTprXYhSRRsfLmdT+/q5
         wYq1yXGoQjxDQ==
Received: by mail-wr1-f71.google.com with SMTP id f11-20020adfc98b000000b0015fedc2a8d4so8154604wrh.0
        for <linux-watchdog@vger.kernel.org>; Fri, 24 Sep 2021 06:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F70yOyVZZjxlDll0pjQntOrMr5BdXyTooQkEjSqxu5A=;
        b=wgJCnh1FubULQTBY1STZo66Zh2RPKnzu1ZvTgEUlM26JnRib8ISEHFt4oJBUTYRZTs
         RE4b1aKvVSVFKP65eOlaYdNfF4YcX3P1kA1KmLb7oiyVdaWr2xZR03Dt+IFglkftZ+E0
         C8hUOHqfsLYeyf5yzfIESmyL6w2egy3x3UerXYnFgVtx1KzcscIsoLHmsQo9UxrekS+D
         WTsbfP2z0VvQ5VLpoMmvDRut5f/h4m0N7b0ZkGH4U4VVhULH7F18O5U21vJQtjN0coyL
         JD1aFEdH4H5qNWMbH34Xo3O/IuykJndTp30Qc52kInyHRyuqJc4DSdz4FoWWV//G4Tr0
         RgVA==
X-Gm-Message-State: AOAM531IZ9s7AsGpe40PyeFhR1aYkrDn481SNu+bTgmNchWjHMC5ORtj
        oLsmN6jylBBSM1baR8Jv1qm47dG3Cb7SiUmPLilVYh2ZpAzezbEMOIDtY9ddmJ6fvEv37xTd7T6
        OELrc+9xUiRdIdOqQcWy3HkZf1pQKCZQxacQ+xEaaBqXf
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr11248671wrt.209.1632490204793;
        Fri, 24 Sep 2021 06:30:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkbc8Da6V2TsZslzItTVmktEElS+30iL6GeasX73+gONH6uwFQeCmkiLeu5/Bg32tsZMpPnw==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr11248655wrt.209.1632490204659;
        Fri, 24 Sep 2021 06:30:04 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id i2sm8034262wrq.78.2021.09.24.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:30:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: s3c2410: describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:29:30 +0200
Message-Id: <20210924132930.111443-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/watchdog/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b81fe4f7d434..75591ba261e2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -496,16 +496,18 @@ config S3C2410_WATCHDOG
 	select WATCHDOG_CORE
 	select MFD_SYSCON if ARCH_EXYNOS
 	help
-	  Watchdog timer block in the Samsung SoCs. This will reboot
-	  the system when the timer expires with the watchdog enabled.
+	  Watchdog timer block in the Samsung S3C24xx, S3C64xx, S5Pv210 and
+	  Exynos SoCs. This will reboot the system when the timer expires with
+	  the watchdog enabled.
 
 	  The driver is limited by the speed of the system's PCLK
 	  signal, so with reasonably fast systems (PCLK around 50-66MHz)
 	  then watchdog intervals of over approximately 20seconds are
 	  unavailable.
 
+	  Choose Y/M here only if you build for such Samsung SoC.
 	  The driver can be built as a module by choosing M, and will
-	  be called s3c2410_wdt
+	  be called s3c2410_wdt.
 
 config SA1100_WATCHDOG
 	tristate "SA1100/PXA2xx watchdog"
-- 
2.30.2

