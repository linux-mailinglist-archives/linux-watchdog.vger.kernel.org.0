Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B83223DB
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 17:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbfERPYI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 11:24:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37601 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfERPYG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 11:24:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id e15so10019702wrs.4;
        Sat, 18 May 2019 08:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bb8Bn0y+CHkNYqfSnrMuHBOIqxCSSqYL5uC9ndXvfLI=;
        b=YJvJzE8B607TcqWfmR2HLQphkJm9SE3zbJRtpyjGKpWqRUoWvyYyXBNALxBeck8CZU
         wFpmPWFl7CXhTi3OP3/J3vFChLsmRGk5rKV93tGHhHHmwYmdbt+w7LQjwkp6SChh8ZOz
         KIhgvg+fN8iebcIEtx9myUJbkp8Pm0joy8NEuttW4o8IIebGLtBMmZd12VxDq68e8WRD
         cIR3SS+rC3yGYj0U9QZc00panRva8ZmQYzz3qt1Bqc12z/BV127bjkxtcZv1qturh1ab
         qclWPpzdWgLPz7a2B6sKdczS1011N+mSYyj6PmcVxngVVoTJY18rHzNLAs/Yg945AiUe
         v13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bb8Bn0y+CHkNYqfSnrMuHBOIqxCSSqYL5uC9ndXvfLI=;
        b=ssZsmhqAUAV4GGJ0w63k51z7qFpBC7jYoJTh2jA5smyauP5OWjGuPvhPxwms5Z5YNP
         9ps6nXzyA2zSgu//NnoKh+PvpqC4slAN/Xu2lzQfypkI5RAA0xmwrHWMz0qXgXvBBZGU
         VdgtbSfKlMPfRvvSr1kDBtSE02/4wyM4ayUitN+kJm/w0B+kGed2oEeKkHlN+v98QcyC
         j12HShF/Tluon9VnLeXnMlNwMp+a2yAwhFnIS+cKn2J7Nxw3mcdHq21wQ9KNs7FS+OyZ
         1CuGoY5QUmrrgsaPvPqBk8J/lKtZAwcbFzVy2BUrUui8XN9m8XjUuj6arm2Tqp+LdXUr
         YLyQ==
X-Gm-Message-State: APjAAAVD26lTYc46Z086nFHB1G70mCWE7O+xKr3j4nUSeVo4qo4m5W8b
        9KUxngMGxQB9TiWKnz4Vx34=
X-Google-Smtp-Source: APXvYqwraU8AxaqS3mZw38+RWJj7AnEEFKolLI0/MvACckD7cZowCZ5K2daKWy0xFhWR+ZnQkVcxoA==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr19950394wrv.254.1558193043978;
        Sat, 18 May 2019 08:24:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id j190sm12934836wmb.19.2019.05.18.08.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 08:24:03 -0700 (PDT)
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
Subject: [PATCH v3 2/4] arm64: dts: allwinner: h6: add watchdog node
Date:   Sat, 18 May 2019 17:23:53 +0200
Message-Id: <20190518152355.11134-3-peron.clem@gmail.com>
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

Allwinner H6 has a watchog node which seems broken
on some boards.

Test has been performed on several boards.

Chen-Yu Tsai boards:
Pine H64 - H6448BA 7782 => OK
OrangePi Lite 2 - H8068BA 61C2 => KO

Martin Ayotte boards:
Pine H64 - H8069BA 6892 => OK
OrangePi 3 - HA047BA 69W2 => KO
OrangePi One Plus - H7310BA 6842 => KO
OrangePi Lite2 - H6448BA 6662 => KO

Clément Péron board:
Beelink GS1 - H7309BA 6842 => KO

As it seems not fixable for now, declare the node
but leave it disable with a comment.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 16c5c3d0fd81..60b47f23b2f5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -208,6 +208,16 @@
 			reg = <0x03006000 0x400>;
 		};
 
+		watchdog: watchdog@30090a0 {
+			compatible = "allwinner,sun50i-h6-wdt",
+				     "allwinner,sun50i-a64-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x030090a0 0x20>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			/* Broken on some H6 boards */
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h6-pinctrl";
 			reg = <0x0300b000 0x400>;
-- 
2.17.1

