Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88C5D254C1
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 18:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbfEUQDt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 12:03:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46126 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbfEUQDq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 12:03:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id r7so19216949wrr.13;
        Tue, 21 May 2019 09:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGVC97kr/8/BngU9FjmbWaxR7LHVSKdzb8qIb3rfhLw=;
        b=HRRHLDE1UdIMVLXhwmTlkWpovX6rwrEXPgpyKoOZuazWMIopdAk4WZP0WUYOA3XTgv
         vQxe4ruWmBTcZJ4wCOqsdA/7mq37vXaU/eCoqqgnI/abpOR0Uu1ny4UDdtz6hV5lu3Cr
         awd1tgjLmydezd0eSTlv5xZlJOerP4Y7+98cXdJrzEVoL4TmL7kcZ9mKvq4oj6y28ahb
         uRIEZVH5wTF0UWExYRcZxojFsjmPrlS6zTGDFxDs1nxv2oeTGakE7+a47GIZ4Iu0KthH
         3jf65+ePC+f3evSjgiHaXfaR8C7FTuOTSSvkGe/WaAnHoV/RzggAAqhPMFE7dzcMGLLd
         KvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGVC97kr/8/BngU9FjmbWaxR7LHVSKdzb8qIb3rfhLw=;
        b=kzpF1o5CsMjrbFzS7qEGkt4GbSc/n/OZ2CXB/OR/99UrMbQoShTrIAopXQ7GcGfrHZ
         7dGHm+AxBmP1ni6CLKAiflIBKtbtGvFpDgU2N4qp72J7vOh+ZiKJ751LfwPe2/IaYxRW
         CW1HhzGF7gBXhyf4n6Mz5NfcfeYteRfkkjP76F2DaqmvV2qUYWF1zjm0Nfp5ENb5PRDU
         YLH2avfhzxoKFXooEKBu/ErYOyhBrofnKXyQCPE9eG0Z69qmLfwyM82ZTHxgbOLK9rZB
         dnuBkiSn3lZ9OWFDdjOLlNsQyL9psLf0wvQm2QZaNdBupEW9JoyfWF6ZDKP6Vt5C0+Cn
         ng3w==
X-Gm-Message-State: APjAAAUjl8aE+zJGa2WTQCApxi1ybmT+cU76zELftuS6FeXopA9lIV9k
        HmZQvIkZxrytSpVt+XI01rc=
X-Google-Smtp-Source: APXvYqwsJuVrNQzCHOQhxugVzCWj6HJBBTOVQD6czAHbkhVTt9RaLaBMKvGnLoVMuS7+6erE1Vtuuw==
X-Received: by 2002:adf:c149:: with SMTP id w9mr40235573wre.40.1558454623694;
        Tue, 21 May 2019 09:03:43 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id g11sm6853811wrq.89.2019.05.21.09.03.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:03:43 -0700 (PDT)
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
Subject: [PATCH v4 5/5] arm64: defconfig: enable sunxi watchdog
Date:   Tue, 21 May 2019 18:03:30 +0200
Message-Id: <20190521160330.28402-6-peron.clem@gmail.com>
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

The SUNXI_WATCHDOG option is required to make the
watchdog available on Allwinner H6.

Enable this option as a module.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4d583514258c..fc51dd4decb1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -420,6 +420,7 @@ CONFIG_UNIPHIER_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=m
 CONFIG_IMX2_WDT=y
 CONFIG_MESON_GXBB_WATCHDOG=m
 CONFIG_MESON_WATCHDOG=m
-- 
2.17.1

