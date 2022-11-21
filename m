Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9C32631FC2
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Nov 2022 12:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbiKULKB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Nov 2022 06:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiKULI2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Nov 2022 06:08:28 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F5B9A5E0
        for <linux-watchdog@vger.kernel.org>; Mon, 21 Nov 2022 03:06:57 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id r12so18315008lfp.1
        for <linux-watchdog@vger.kernel.org>; Mon, 21 Nov 2022 03:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyWwGeNhRFmvWfv+vCOYlIM/UFkEFOWpWKA/JfKWszY=;
        b=k1zR2LZGJzgjCfmMp4p4sU+lt9Y/jVgcaRyvmTurxH242gX8IQXQ/MjQg7EUV7qPIt
         Uocx5kN58tws2Qih7DmeyVqq2zI1PiY7WtbxX0Vqnp47COj5UTsxlGsTBd5Wl+uEIrIM
         znlDN9X06BKuJ8t3bWEeuK4hDuMdNeiwc7hmSsyJuwHor8VOB+IozAqcJtzsXFTFSqnp
         BAvpVY23qpQTdFU+5YR6MFtjqOF7YDE9y2+1WIPKLJz8k1FKV7oBPXJ1iT5SNYu8EFn4
         aIlRvpPlykkiIQhw6Gzo5jqzl0qGOlMgAgnCb/uRZuFaGL67r5tTmVBcXdviOBviPPgy
         Le7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyWwGeNhRFmvWfv+vCOYlIM/UFkEFOWpWKA/JfKWszY=;
        b=OLbMt3t/KdPsDb2/0mYQ/ResnBENvU0w+myUzAaV1nV2HR91ZqvU2vnKs4TPhzfCv+
         JBY6sdxwg6FgYNOOZotCv0aLtTQ3IwCgW1oms7SD4iCvheY0s4rCCwPfsyOjSNKkTqRE
         YeFdIajuFJFka6C8GIqk6t6WRs9wyAIX2B4xXGodRfOl700PJROSfN7hqTK5UUNeIGsO
         T6AjaEh650deJlnxOO3VT0ULD49c5kKsBKyxxJbRFramZQzGe5DWRs5BS/vaSCp5Iq2+
         IEQZc9cqyND29OExkj5G98rJxvEMprArVLKH4FZNPfYVtoRssOdT/peHwRPwvsmFou/F
         MbgA==
X-Gm-Message-State: ANoB5pmtvWO1MyHIb25zLKJKXa3j9lNv+XEYzhit/AwA55PHfv4BQW8t
        /s8x0y98sXXWY5vJeaAwFCT8A9JAI1AUMlis
X-Google-Smtp-Source: AA0mqf6U7Ox5Cg3AOmfzFZsyMueM2uMreFj1RmdNjod5QJ6XQGeJ0gdoX1HOEA4iywF9yX/nrfBnTw==
X-Received: by 2002:a2e:9786:0:b0:277:2e8a:bc59 with SMTP id y6-20020a2e9786000000b002772e8abc59mr5136640lji.344.1669028784202;
        Mon, 21 Nov 2022 03:06:24 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n1-20020a05651203e100b0049313f77755sm1991521lfq.213.2022.11.21.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:06:23 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-can@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/9] dt-bindings: memory-controllers: ti,gpmc-child: drop redundant part of title
Date:   Mon, 21 Nov 2022 12:06:08 +0100
Message-Id: <20221121110615.97962-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The Devicetree bindings document does not have to say in the title that
it is a "Devicetree binding", but instead just describe the hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/ti,gpmc-child.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 4a257fac577e..383d19e0ba26 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc-child.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: device tree bindings for children of the Texas Instruments GPMC
+title: Texas Instruments GPMC Bus Child Nodes
 
 maintainers:
   - Tony Lindgren <tony@atomide.com>
-- 
2.34.1

