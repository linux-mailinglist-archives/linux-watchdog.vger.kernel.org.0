Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3646E3053
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Apr 2023 11:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjDOJ6x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 15 Apr 2023 05:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjDOJ6n (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 15 Apr 2023 05:58:43 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41FF977C
        for <linux-watchdog@vger.kernel.org>; Sat, 15 Apr 2023 02:58:26 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fy21so8733151ejb.9
        for <linux-watchdog@vger.kernel.org>; Sat, 15 Apr 2023 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552706; x=1684144706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr2pBCD6umNhczQxq97ewzN+14iVAoxszUR3df4m1JI=;
        b=KBrssLMtLKmsLeebg43o7A5lMW1PVjr0FL9EGnzfptlfeJU2+O2WNhBQ0HFo977Iua
         rcld+cXUs9Y3HxWGpMiWcxuAfuHnC6x2cl+2qmiauB6x3msu3sypy5NK/yx27mTj9y9H
         Ewx0zS9sHKphX1IM5mkG+xkB6sHk7sfp4o4noyPWiYZEJSHxddoi/P8z/eEN6vWGUkfS
         YvSlcUyBbUSaYJGQsDy8QWLzuLGdkAmSAIUuNvqPRl4XN5crob1qw9uZzXUe5YMUnJhX
         g80zIJJQURIGeGysIlmkHk5jlgHtryhPW/OjPjPmOckvxXqsnLQS//OqqROjirbCPdRq
         tmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552706; x=1684144706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr2pBCD6umNhczQxq97ewzN+14iVAoxszUR3df4m1JI=;
        b=AqTxC+3F8kl4Gjpeg1e+MeUduvLrODNv8Ct/4L9oiaDdlOayrGvHOkaZRnHzyqYeiD
         1o1T3gciGfiTvoGtyFcv5sjyTPDY1L1apPMf3lfxBLd2Tm7Mv7nR8yTIAAX6N5ju6r+R
         2bsQkt+1bOXf3MlnALgn4dciw3ztGoKbhdjzH60IDgkZ7nZ/aBFBqQSMv0vX+HJ96jz6
         bZRISbpq3ws0nMIqBdNJcB8pbEPW5uoRJaB5dx4pYKnk/Q4Q+0w/5aBNga4GN2JUZP1j
         vulG6/snkXP7c5VmJpb4/Vw0tkMcvjNpmfDzSLn++8xPQaSSAfZhvAPvAIms6N+gYjjV
         0YIg==
X-Gm-Message-State: AAQBX9dyvXoouMV34Z7PLwTFiBztFVEZZjp198QqFCC6D7IY8pA/IZpY
        Ula2f0pW7KwJf98wsdQSwgJ9wg==
X-Google-Smtp-Source: AKy350bZWvNaGJptFPLSmIHH7cRbLl7V6f22Bt1WbL4mPTQOR4EbC2AYcFac6G7sc67vcTz0OtrFlQ==
X-Received: by 2002:a17:906:b788:b0:94c:548f:f81d with SMTP id dt8-20020a170906b78800b0094c548ff81dmr1404066ejb.71.1681552705946;
        Sat, 15 Apr 2023 02:58:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Julius Werner <jwerner@chromium.org>,
        Evan Benn <evanbenn@chromium.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sander Vanheule <sander@svanheule.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fu Wei <fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Justin Chen <justinpopo6@gmail.com>,
        =?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jamie Iles <jamie@jamieiles.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] dt-bindings: watchdog: realtek,otto-wdt: simplify requiring interrupt-names
Date:   Sat, 15 Apr 2023 11:51:12 +0200
Message-Id: <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
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

Required properties should be listed in "required:" block.  Since
interrupts are already there, the dependency of interrupt-names on the
interrupts can be simplified.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/realtek,otto-wdt.yaml        | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
index 099245fe7b10..1f5390a67cdb 100644
--- a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
@@ -67,12 +67,10 @@ required:
   - reg
   - clocks
   - interrupts
+  - interrupt-names
 
 unevaluatedProperties: false
 
-dependencies:
-  interrupts: [ interrupt-names ]
-
 examples:
   - |
     watchdog: watchdog@3150 {
-- 
2.34.1

