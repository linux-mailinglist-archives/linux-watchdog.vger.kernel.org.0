Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D19223DF
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 17:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729818AbfERPYF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 11:24:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37602 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728516AbfERPYE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 11:24:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id e15so10019651wrs.4;
        Sat, 18 May 2019 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6gOCeLFlJw1dbCMa6k0n84FnR1OVT/6zTLU7bYn2yk=;
        b=XgY/eJXLj1U2132csrx6KglVrYCvff28aN1+g1Occ2ZhW9TUkuhbqChLdOuLeTjuoj
         RIFEQqS6ZVcmH3JS8r/3Ny5AcHQZPbh96O+Bgf+RXGUSm6a7kjI16evOGU5KR3mMvD+y
         Dsx4yep6WTnlLQJ5Ev5132op9hB6gq0tbue5ExXkEee0Mp0XuDJqc1x9p1sgSMvpUEg+
         oCV3Lv8NAWQKJgg9iumgiZjzhHFZDw95EVywq3d5fdwQm2y3fMmZsCcBVN7ZejXToCvB
         kCA/kLk7Znf3HVosmIjEcm7Nuta58LoQ2dovkqHTILUq2cIHDFW/akI5geBgcBqd9CE9
         wB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6gOCeLFlJw1dbCMa6k0n84FnR1OVT/6zTLU7bYn2yk=;
        b=gVE3bPFyNOSwKJXGQ53DTmRGYmS+a17P8hoA7nv+26TVtVcA3vJA/8gtuk2S3Dc5DV
         F77uE1b6KK/yDVtjoSUsORT0zmTxsIAgVagTlVcJYTCA7Krja6HjZo8jPOo5iM4Oir1Y
         wjAXRrbQ1SZZ1LMHsM01TZgaQ7d45HXfW6Z7aw4cI4pAMkt+98DsgRz+B/bq80YM38w6
         UxcvVJOBmUKe43bcxK0fELiebRS0PoS/RMieJBzM1elljOV0frYD4blrd+geh6B8JdJN
         GIuI8In1NyfY+ZukzEb7O7x0Z1oLaWokvCJ/KbI4DZ0uiIxOCbqYtwpGZD+y8to0xPHv
         /HQg==
X-Gm-Message-State: APjAAAVzBsXbtGANQd9GIkrDBMTp//ah46AOdgjxxOtiUJHfIOLp0bfV
        Th/R1dykGhsDhw6n+/aHAXU=
X-Google-Smtp-Source: APXvYqz/ULh40TKoUjUVBvhF134MGZ7TX6TjgxM56mLpsK9FeRGKkgdLnG3CsM0JpzQjKGjv1Myncg==
X-Received: by 2002:adf:dc09:: with SMTP id t9mr11437844wri.69.1558193042815;
        Sat, 18 May 2019 08:24:02 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id j190sm12934836wmb.19.2019.05.18.08.24.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 08:24:02 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date:   Sat, 18 May 2019 17:23:52 +0200
Message-Id: <20190518152355.11134-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518152355.11134-1-peron.clem@gmail.com>
References: <20190518152355.11134-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Allwinner H6 has a similar watchdog as the A64 which is already
a compatible of the A31.

This commit sort the lines and add the H6 compatible.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/watchdog/sunxi-wdt.txt         | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
index 46055254e8dd..f4810f8ad1c5 100644
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
@@ -3,10 +3,12 @@ Allwinner SoCs Watchdog timer
 Required properties:
 
 - compatible : should be one of
-	"allwinner,sun4i-a10-wdt"
-	"allwinner,sun6i-a31-wdt"
-	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
-	"allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
+	- "allwinner,sun4i-a10-wdt"
+	- "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
+	- "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
+	  "allwinner,sun6i-a31-wdt"
+	- "allwinner,sun6i-a31-wdt"
+	- "allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
-- 
2.17.1

