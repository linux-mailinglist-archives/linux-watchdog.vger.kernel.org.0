Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4576D272B
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Mar 2023 19:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjCaRzm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Mar 2023 13:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjCaRzj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Mar 2023 13:55:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5196D4498
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 10:55:37 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l37so13365208wms.2
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6X9QsV9/LyrqNbg7T/d+xDRVkLo4KEmI/Lt+kJ3J8UQ=;
        b=WQgrqRggpUC2NAvpGwIZ+aVzYzjpU65hI38zU68+ESLBi3LeZLy7MqzISwJWs2tKeH
         v+Kynr2DBRR4dl/s27O7yozU9FIuoFe+6T4hP866340Pg7qVoisM0D/Rfpaw7/ZzCe/8
         QLD5+UhFLyv0tVy89VSnBvTyXIBj/UmTK4moZzWcWZWVjWwuYCgrwLHgi2fXKYv8TiA9
         cjHGi8O4lHk3LYSsUdXmUKptE5DgglSWPW5VE+fC4lcD/ReIrEAIjg4F+WVF5UkBx4Ia
         Rsx6z4UZf6pabewb7baz/BuH305id47jPgY8kqyjBrJibHyTHx1i8I0FhaVQPjPXyF/Z
         hUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6X9QsV9/LyrqNbg7T/d+xDRVkLo4KEmI/Lt+kJ3J8UQ=;
        b=DyWzWKOPSRtngkd+0Bie01zuFO2V07Z6yifMrWZniBsWPoHtV+HW16jgBgJdlGHVw2
         xo8iV6jgwX8H1jQpMsDzSrHKVmdWyV7L++Csv9EjQH6xDQyq9UnmhwrI7q3BzYtsotnK
         E+u5+ObfPaU4isGWQLahYiBUk3Dw8HtPTuH5Ou+KI3HCfIvLZZL6/pP0kSL9h5jCjwnP
         tiX0Bt3Vwffbk19UphmGeasLwYNxPOu4e0jVczaSFmMonVok1tD0ldbepPl8LVDyihqp
         i5qFjORX9k79z4Wwd0P3HcuYPHQUdM7lLPAi55frB5FUZYUPKbrj6NAh/hzBYwhdbj1d
         mTCg==
X-Gm-Message-State: AO0yUKV+t8IDAEFqmAKYhTElXPYKhqK+oXGv6ljt0GZdKBwz8oY4waVm
        meZJhWJCRSA9PlQDnLqaITQeow==
X-Google-Smtp-Source: AK7set8LXk8MGcZxkHFo/cUpFNkBaTHtM3PNM2BZD8vGkKaYKAXxnw5lu6FxBcIN6ciVOkC2542xoQ==
X-Received: by 2002:a1c:6a13:0:b0:3ea:e834:d0d1 with SMTP id f19-20020a1c6a13000000b003eae834d0d1mr22112353wmc.36.1680285335909;
        Fri, 31 Mar 2023 10:55:35 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:35 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 31 Mar 2023 19:54:46 +0200
Subject: [PATCH v4 02/11] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-2-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xlWHZhxtm0yXUQxDn68Sgf/MoHrbwggc8aGclOBYQIw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6T99FfMtpFkuU48Et3y/qOSZvfZnpPnVu0aq5L
 pHHO68iJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcekwAKCRArRkmdfjHURTeHEA
 Cj+We5q8HnBwf3AGOj3djXUpNInuJoYFw6juyY4xlR4yKWMZdkoTG8mViEkRgMTdIyaUu+aD4SCpd/
 2b5azbeBwLyBZlIUa/n91u4j8mq8SoTvOpfKzohQfbFw71l/H5djaxf/ewkaeqNYz4MJhXquv1ZxML
 Yhs9Oz8SCM4uGtg3Ah0UasSMnbzLacOC3iI/yYb5Pv4pjsEQVwOaWAgQt9znDf056YnZrVHf5I5gPv
 ynQ4YQsCqYRoHq/buFGCbwOhJMVmuAhAtluiwSDlAx7eyhBQkWOcU+xsVcy2aTVvONB4QfPLFUljkF
 kGSNSUSTopoHBNIhPe4FdSZDpDxVl8eeb/rhaPONeGqFPFG/4qkvh5hbNE5LQpQP1Q3EVbeckH6wo/
 qbx1Vfne4DdktBTt9jHEx20Nkq7fyqB90M+3Ee51WRNq86b7gYibDr8/fDd2MWnym3HYmzkPSr1ICo
 PVxtecCmcuQBhjCcknuhtcQ2k3P/aYy2aSvuxoKiQZLR2SgM+L0n4Q8bnCeIvGgI1An8/dxNawgR3a
 RmJ6SAeHjy1nXdrCIUIqBhlanKHfHNuuUNno8UQ2ZZ/3tEeESrQBy5/r7X9P2c8ARNFeMFBweodh1O
 2gpmV/NwRMv4/vMUWDyQjwpabIwm0W+vvxG4GU+K1Lav2GB7mMhjFmDmayBQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This SoC is able to drive the following output current:
- 2 mA
- 4 mA
- 6 mA
- 8 mA
- 10 mA
- 12 mA
- 14 mA
- 16 mA

Then drive-strength property is set with enum to reflect its HW capability.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 4ebc7f1caf55..df8e9b32ac2c 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -99,6 +99,9 @@ patternProperties:
               2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
               3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
 
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
           input-enable: true
 
           input-disable: true

-- 
2.25.1

