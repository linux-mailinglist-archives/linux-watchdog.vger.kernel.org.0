Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFF3254BE
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 18:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfEUQDp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 12:03:45 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54247 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbfEUQDo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 12:03:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id 198so3551527wme.3;
        Tue, 21 May 2019 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXUpOzTXRkpXF5rHOHPBRJ/bn1tvIHFvWTlLeYQuAWI=;
        b=F2MQg2yI+JdMgmQAbMUQyS6rfaoDCM9OvmTaAz4A21RNul+JS/Pq5eV0KCHkNz22x0
         s1GHlAgY4qLHU/ErzOsGOSApC7CJdVebXqJoc0L5YxqZYOCAU0oLAli05bhnlot/NP33
         7gf8oKiQ5HxAarStxDMp46aMeibzxwgXqQ3QXEzvNNzOQFCv0Ly41gNO27Sn8nw3ZiR7
         qOCNg40+wgiSRb8lQTsEUBI6ieMIEj0r8ibTH+I4xnJ0GZLtoGr1zaetdFK8fuI+Ulso
         nN2pEf7TbguOEJeMEF1/HXbP7nLRpNVMKCcTOhDt+ECFvslyv/dE8MpX+s9Nj9s5HBBk
         aQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXUpOzTXRkpXF5rHOHPBRJ/bn1tvIHFvWTlLeYQuAWI=;
        b=KuyrevcDsRnKzwkUZgTBRdX6feUnTsGd2BiM3g/2pjgiW0QBxAVWiBwz7M+6f8p0At
         bB/zmPMiq4+EckwskVMRYzE0wNUcvwqT6osy/QTwA8AR8I9/nLHXuSr+4eFn8KpwZA8R
         NbyxZYDPye7Wo3w5Ai8X0QTUqVyRakjaeftr6S3Cyf+5Ceb2GG15IFw+JwJksnl34rv7
         DM5pPdPMRIMZ1QIgwtZdo8lI4CTlRMfMxgTrlDzotfeFHpjP/t0d4p+6X7WitJnAQana
         A0KDdxqlxGhAYgsJXtGj/gOqoJ2ppP0zcyAO0GezCk75mIayyRNf8N4VmgZxHClTzkH9
         teug==
X-Gm-Message-State: APjAAAUkJAgWHxSIhL9jI6OEvS6T6UjOViKqA5GRry4ETFei1hff7syZ
        DypSrvHxr5uLJXYhbjz/bNk=
X-Google-Smtp-Source: APXvYqy4CuLUUMUkQHqzH/rtwoT1Ng0BDlq8tNehJfpoMqikNeIiPCAC4aW/BnOT95vGQKRxH+LKDA==
X-Received: by 2002:a1c:9616:: with SMTP id y22mr3963336wmd.73.1558454622519;
        Tue, 21 May 2019 09:03:42 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id g11sm6853811wrq.89.2019.05.21.09.03.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:03:41 -0700 (PDT)
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
Subject: [PATCH v4 4/5] arm64: dts: allwinner: h6: add r_watchog node
Date:   Tue, 21 May 2019 18:03:29 +0200
Message-Id: <20190521160330.28402-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521160330.28402-1-peron.clem@gmail.com>
References: <20190521160330.28402-1-peron.clem@gmail.com>
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
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 13e70aebddbe..66897880c722 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -631,6 +631,13 @@
 			#reset-cells = <1>;
 		};
 
+		r_watchdog: watchdog@7020400 {
+			compatible = "allwinner,sun50i-h6-r-wdt",
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

