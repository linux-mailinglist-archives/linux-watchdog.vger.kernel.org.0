Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B46FF280A2
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 17:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730994AbfEWPLC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 11:11:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32932 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730951AbfEWPLB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 11:11:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id d9so6722323wrx.0;
        Thu, 23 May 2019 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wwz+xfCsHkHpcqUvXeTMqGEu53cQ0RDs4iESG7T3CQ=;
        b=oLDDUfny5GtdyO+VUAmKEqF0H9jggBBicRo3ExIGe7XhbAMOFPWQmKFj8k8jbGzVK3
         +vu/jtK1kcZxpAKsSlNtOXKE25fxw5yoSPHmVUkx3CHQDdllbYQwj4Mq0CMq5C/0/mDr
         86jjGYEWvwLnW4k2LzY4dAbGh2AN26BqQsXRAhPn5qTWog50oKgs4aItEc6cLFiyLRol
         uFuC0uMs1VsVLUFiciLx8JAxuFVE/kFeqAegOGsK9hUV82gwIlhk8+lOy0qiL5F/Msvz
         ohCfn2iEqXyYH1cZA/MjMMCBTjhE4gH3wZHG6FZBQZnh8TBWIpXPxxYBMEymrwOZ2dAN
         j8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wwz+xfCsHkHpcqUvXeTMqGEu53cQ0RDs4iESG7T3CQ=;
        b=Vq4w/Mc62D15ZJfAoZmbmw9P87P5bifDY+ZbEIC+qo16lkm44FaieDeutiqDl4+iJX
         FhFMMUlx1aWHHiXkFEVtLofqSJ8Cpd1wR8Ls8cm9XadTUWj9K59GOxGf1H4UgktKwFAZ
         JJW7LRiEthBWIO6sGC0EwuKzRIVtioyHe8ZUT1M0NkKC6kUBXeed/1bmlCvlxD+LI5AW
         E3TS26PBPM2+LT8oyCvlAf7Lv0yMg5drL2O/PHneplf3PMYdXZQu+2N4v4Gcx/hWj2LT
         Y4dFpn0EVkYXWmGis8LQsvSF9gjhfehKgCwqIaxE7albBnExQo8tPPYyg6sQ1RADQEhD
         xWgw==
X-Gm-Message-State: APjAAAXwcaV5L4A8+f70fJwAJuXyqqSroJPj5qrsLTN31ACYj1EUPHyX
        ZGx81N7/YX6Q0mx4Lpb9FPE=
X-Google-Smtp-Source: APXvYqwpqFOtLIWfs3xJWCqQCSaru3enfRBsUpAknbkIYOU0UUgbvZX0ZeO7EK5SZbkov/7ukjHJYQ==
X-Received: by 2002:adf:ce8e:: with SMTP id r14mr46914850wrn.289.1558624260438;
        Thu, 23 May 2019 08:11:00 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id q15sm11436324wrr.19.2019.05.23.08.10.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:10:59 -0700 (PDT)
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
Subject: [PATCH v5 4/4] arm64: defconfig: enable sunxi watchdog
Date:   Thu, 23 May 2019 17:10:50 +0200
Message-Id: <20190523151050.27302-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523151050.27302-1-peron.clem@gmail.com>
References: <20190523151050.27302-1-peron.clem@gmail.com>
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
2.20.1

