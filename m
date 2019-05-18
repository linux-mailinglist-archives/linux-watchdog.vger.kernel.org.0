Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA7E223D7
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 17:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbfERPYI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 11:24:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43515 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729831AbfERPYG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 11:24:06 -0400
Received: by mail-wr1-f66.google.com with SMTP id r4so9981280wro.10;
        Sat, 18 May 2019 08:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZiigEEtBu6x6aspBUVXzYAMEPnSKruYtSBXZsc2Cfo=;
        b=fp6FsnCvhdmQVst6ckA2c2rg7045iUJr4rvl1qayE/jPGdoquSU1Gbx70H2ytCR+P2
         Xvqdb9B+yuinWa5awv7vnU9WAedThTVoIR7pZLob6Na2sd00iygkeddLgcyKs6Pu3iyh
         Q+Xatouxv+p8YVBZt4N1BmVryCH2Ape1EerMq4aNYDNKFOqmxorYIWZPFUrEL5UI5f1o
         xFvvd2UrcBKyZQuJF3rmqh0/cttkpPpDPfzknE0yryrXx11rBZ+vIPEEzZ2wXGNaJW2U
         R2F3rj3HULi0ShkhvpEGFg7Typ9n+8+8BFyl4RbK3KaR2yqhp0YXJ0NEYibrfdlNeCEj
         P6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZiigEEtBu6x6aspBUVXzYAMEPnSKruYtSBXZsc2Cfo=;
        b=naJPBhE2uf0r2fHpnhjApR8+EzSoyCLs28TuUL6eQcI7eiRB0jNsz9tPFlyLZjNjB3
         S4W8nkl6/c3bddjrHjqy/LT1XSX8mfW8RNK+AqCTEpId52K+u9memoJR9nxuYcQumg7m
         ypt51ytPVraBbflIQ9mUzfLqAk+G16Nr8JzC5PA3JUfrewb9ru+mmyB0+5XQinB1NLmT
         lLI4pxoh+ymhe0JGU3XY79gNxejqMltfOcc3ShBAKUDQN913dmcl7gUrrT97jBs31j15
         BCWVKuF1O8nwt0fWPPaoZZ1xxtkat3/S0ACY60wf4dANk+NhacPZGKwyVYaNO2r6cyoM
         v9pw==
X-Gm-Message-State: APjAAAVZQCavfuZr61BTWypK8YFcaOGdIRlsqlWtUEkxY1LzzzNlvk8e
        YU5moputXeJOO8nsgCWZe2s=
X-Google-Smtp-Source: APXvYqwfejzVXvjFIohye041B54ZnYKOAoMQ+35th588Mphloi/UooXp/vZZq86x4BSbD0Bq22C+UA==
X-Received: by 2002:a5d:5547:: with SMTP id g7mr11426707wrw.22.1558193045045;
        Sat, 18 May 2019 08:24:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id j190sm12934836wmb.19.2019.05.18.08.24.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 08:24:04 -0700 (PDT)
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
Subject: [PATCH v3 3/4] arm64: dts: allwinner: h6: add r_watchog node
Date:   Sat, 18 May 2019 17:23:54 +0200
Message-Id: <20190518152355.11134-4-peron.clem@gmail.com>
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

Allwinner H6 has a r_watchdog similar to A64.

Declare it in the device-tree.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 60b47f23b2f5..27647e496269 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -632,6 +632,14 @@
 			#reset-cells = <1>;
 		};
 
+		r_watchdog: watchdog@7020400 {
+			compatible = "allwinner,sun50i-h6-wdt",
+				     "allwinner,sun50i-a64-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x07020400 0x20>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		r_intc: interrupt-controller@7021000 {
 			compatible = "allwinner,sun50i-h6-r-intc",
 				     "allwinner,sun6i-a31-r-intc";
-- 
2.17.1

