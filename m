Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6497C5BF2
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 20:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbjJKSts (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 14:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbjJKSt0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:26 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72CDF4
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4060b623e64so871925e9.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050161; x=1697654961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFhGX2ksyR6bl6kyiCZl+HBvDwsMQ5EUV+jwQV26TQk=;
        b=pdoqzPhoTsaLZAIoVC/MMW+mPkoF+rE0gMX2UH+KInrhmrL8xPUYOs49r7bzn/tYXP
         oAIlGp6NwHaIAX+mJ5ZWnFGYihI7U1Vq0S6+OOopLSdamfKzwM3zS8uL++SIgnrmdb6C
         EtTCULrPZcaa20qTnsEcxA69lyJ9Ga9Ic6tLnNZqUCgHhY/ZzoRuUjkJc/ONQd3v32KD
         2PHdu1gGDNbtqecB1deYej0NXcGKlt0DYgirlzSNTtT7VUwVB5BLUFsoqyeDlwoBO10C
         Qfn8soqyVVT5vOfSUQp0axg3GhjDeE18EgLlmjsz7OuG0+NComQap1awG10hVwCxw3Lx
         B93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050161; x=1697654961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFhGX2ksyR6bl6kyiCZl+HBvDwsMQ5EUV+jwQV26TQk=;
        b=pbGonEj2IXbR86+aSF5EQ9Cqqnbep4UbdRsk2VGNJOtP7U24YrwsJbTfsXO19Bl8sx
         fDz1UXzl2jTn/pAVorPmkx9UQrMx3cZqxxaccdxYENO//Fg6iH6IBIYggPtI+ZSMSXDY
         zhECJCLKO0XSim/lCqQTVdxueTVzitJJnq8RRU93a2Z6hZeKD3lbmCsZtWv8b3MWl6RX
         4BA07ORBNIJad+L4vpfNuZeB2MSLiJbuvd/Dr120tZ9eX0afOKI1MBh5daGB7MAhV9F3
         X7w/5gNZXugpGqB6un3V9u+fj4C0zrIsdViBig2ehB08ZWNj6lfvBbGArKtuPg6IkW57
         I5KQ==
X-Gm-Message-State: AOJu0Yz8qLcz/ABmE4Sk8lMu7hHq0Wc6+TdDzTbHDiCweNIWt/r3j78h
        sbVwaBFsGykqP64iZNR1UI+kzw==
X-Google-Smtp-Source: AGHT+IF9W+7AW/XlTQ7WDrQGflbC5JtDdmSRP62EIkSF11L7fYaLrR7J1qys5NGk48FiNmOh3TFgig==
X-Received: by 2002:a7b:c84e:0:b0:3fe:1fd9:bedf with SMTP id c14-20020a7bc84e000000b003fe1fd9bedfmr16045843wml.11.1697050161221;
        Wed, 11 Oct 2023 11:49:21 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:20 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date:   Wed, 11 Oct 2023 19:48:10 +0100
Message-ID: <20231011184823.443959-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1de91a51234d..7cddce761c46 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -29,6 +29,7 @@ description: |
 properties:
   compatible:
     enum:
+      - google,gs101-wakeup-eint
       - samsung,s3c2410-wakeup-eint
       - samsung,s3c2412-wakeup-eint
       - samsung,s3c64xx-wakeup-eint
@@ -99,6 +100,7 @@ allOf:
             enum:
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
+              - google,gs101-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.42.0.655.g421f12c284-goog

