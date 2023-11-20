Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734C37F1F15
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Nov 2023 22:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbjKTVWD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Nov 2023 16:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjKTVVm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:42 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAD6138
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:37 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b27b498c3so1245965e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515296; x=1701120096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SZvpwVvhHSYn6AVsfP8mg+sxtJjbt/EepCXw4mUJk4=;
        b=ri7ccVumztQ15WbdcOoix30xdhJ1cXwpBNRxl6gOxsDptHbVDWQ03b6gGo9ZMhj7Vd
         eSdynerOs/gvpYE9/0Hi4cDaBhTa3Xxr805huWcsUNqWjewF2+xVjFGpvlLyROL6upWO
         t3YidFYImjuIWvhYpVr0jMuainVQOlFjtcEUWgb1JZOlmmpEpyt01PA7dEpJAjk9NJg4
         HuI3rchuDtaaulhdJ/vznVXGvU37J4kGvvVDfIQXvT+MWRTdaztfQF5XOxtOq8JjRDRs
         qUt00u7hrxtJqI/OM33fiJoHRwTwj48wKb7bO/q80xEzmIMJZzqFg2ZktoGd6vEc3jyo
         5NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515296; x=1701120096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SZvpwVvhHSYn6AVsfP8mg+sxtJjbt/EepCXw4mUJk4=;
        b=bf+deR6o4LOPa7FujWd/hjiRTTP0yJVj9rl1pNCUpTdzKW1gcSR2JcT9TSKs+9+bPm
         jb9eONdSR/Fr7DDl/L/Y30P4nW+FjDFUzJXW4RlW7ZbJ/+ph0LwFic2DrcLFm5fL4Oy2
         El5CTBj/AuTK9hX6Rizt27aE4fxQfKQGY1tn2e/H+uxUCz3FxbKC1Ec28Dt4ojew1GtR
         bZPQquqfnwPrpevtp651z08eJCPSZYOmLjWMpH8xRfrEKAEQnznoO/jGjvX4efqK6iG8
         pcwSazTYS/dgiOIf9fN4kdJmd/6XxW43fdyqVFxaerxG8uPCdtefeElS/HlZ4/P973Xv
         FGTw==
X-Gm-Message-State: AOJu0YyTopphXlkJOZsPxHv8A0X94+KbGQaO6nR8cNplvgnrBB2+wD7g
        LWEqJPqacnSKen1es4/4plFoAA==
X-Google-Smtp-Source: AGHT+IHWybnx0ZdcwvMDBNOdpFDZ42C4c7PfCA39mS3Y8UEKdxKa8P+vhEV2G8kWfZN270RqzE6obg==
X-Received: by 2002:a05:600c:190c:b0:408:4160:150a with SMTP id j12-20020a05600c190c00b004084160150amr6535303wmq.33.1700515296392;
        Mon, 20 Nov 2023 13:21:36 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:35 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v4 19/19] MAINTAINERS: add entry for Google Tensor SoC
Date:   Mon, 20 Nov 2023 21:20:37 +0000
Message-ID: <20231120212037.911774-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add maintainers entry for the Google tensor SoC based
platforms.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e55173ae5e39..f5c84da7008e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9013,6 +9013,16 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/exynos/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0.rc1.413.gea7ed67945-goog

