Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D2A254C4
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 18:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbfEUQDn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 12:03:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46122 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728767AbfEUQDn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 12:03:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id r7so19216761wrr.13;
        Tue, 21 May 2019 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2HlGSUgjzAvNOVGdN7gVs7WcE2QF1w4iYjEKQyq+ki4=;
        b=nk+gBBhUgCbSkRmcV+nB7trvkMcW4vUROz49tmifqzka5udFk7R3G/03Vv+jPLHmZv
         1K8PlRVRwsSlXHRxHvgxCcChuBFKOFtLJddDD7d+w6nwDldotEIcZD3KA0SA7BFxSPnL
         PESoxYCpQ6sjqQtadTWZeTWMue0r2KlwSWoHYMhKeFivHCnK6MZEXNFPbVKXaGnNLyxT
         4hSW6zZNB47vCKCNCuBjPFpRxlMfuEUhgRZP/mS8nD1slaHsY2V0REI27EmCOypcwMrt
         7YWA6V89OWtERGMdc67BKM5mwxWM8p4taHMYj5lIphXcwRK7Edk/qFetKSqZdKqxSLq0
         a9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2HlGSUgjzAvNOVGdN7gVs7WcE2QF1w4iYjEKQyq+ki4=;
        b=bRalwcBiyJ6PUT8DsJavqJMSZRuuTsaQ9J20b5UelDNiGTChXIH70/7WoYn95xKsiL
         x7+Odb+TekpRGwQfA79bmtQ7kgUoJS3dZhmkOpfyQopXErnASTW6SV5LFRn7n561UZj+
         gf35QNoEaUqkpK3pQev19czV8UgAmiJEvktBfTEmWd8pa1N0BEinMJkTNizEfeZAyX7T
         JLPbKWTS9AkxJzVo/iXogNFfWh+b3H8sEjN3I80uahc97zd7BgyHbBOuwI5V4Cnjv3yO
         N6+vsmOXBenwWQiFuB+Kzu9I3wFeQLUkGmVyyWHjrmwyZ9cXSnrEnk9uUI1+Uh6J6Rfh
         x/pg==
X-Gm-Message-State: APjAAAX3CbGVgcRqih8R66DIFd2Oa6WO1n3EXQoTHzUq4xOe1PS8b1ou
        Zu0mOdz5Eq54ccNevkjc4/iDYNVUor1xDA==
X-Google-Smtp-Source: APXvYqz7pfnHqKxAsdVAsab620Fxs7RFfDYzuAYjex3e8EHMv4AKzoox2BUVgMZupSjlethDygyWuA==
X-Received: by 2002:adf:bc94:: with SMTP id g20mr31810762wrh.206.1558454621208;
        Tue, 21 May 2019 09:03:41 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id g11sm6853811wrq.89.2019.05.21.09.03.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:03:40 -0700 (PDT)
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
Subject: [PATCH v4 3/5] dt-bindings: watchdog: add Allwinner H6 r_watchdog
Date:   Tue, 21 May 2019 18:03:28 +0200
Message-Id: <20190521160330.28402-4-peron.clem@gmail.com>
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

Allwinner H6 has a second watchdog on the r-blocks which is
compatible with the A31.

This commit add the H6 compatible for the r_watchdog.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
index e65198d82a2b..c5bef3dd43d0 100644
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
@@ -6,6 +6,7 @@ Required properties:
 	"allwinner,sun4i-a10-wdt"
 	"allwinner,sun6i-a31-wdt"
 	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
+	"allwinner,sun50i-h6-r-wdt","allwinner,sun6i-a31-wdt"
 	"allwinner,sun50i-h6-wdt","allwinner,sun6i-a31-wdt"
 	"allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
 - reg : Specifies base physical address and size of the registers.
-- 
2.17.1

