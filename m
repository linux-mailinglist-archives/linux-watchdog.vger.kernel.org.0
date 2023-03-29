Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D336CD58F
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Mar 2023 10:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjC2Iz4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Mar 2023 04:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjC2Izb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Mar 2023 04:55:31 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65E349D1
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Mar 2023 01:55:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id l12so14828483wrm.10
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Mar 2023 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+9PHAPPCN5jb4x3hnhdMgy2to7itNwb0YpOnA8EnRk=;
        b=hsPp30ME6q6c0MvSAujzX4JfIL02UlDUE//BjcWBELhaoBKaVvXmUG+4jAmp8BIqNY
         BXMH4tJk9Uo5brNbTOqMhRAJcRGyMgEYsUbppYzb74G526Qis+K/KcPWpxK9t5cJu0Yw
         /z+SPaDezktz7SbV+6te4xRnRFVlMSXbVtumsmKeEridINs8BjR+uwFdNj1QJK+SOCxQ
         psRj0YOQlix3tF0TgalgHOTyHAskks/5fOG+AMptMno9EdOlrhtUXuNaPkkyPjiGDL5j
         6cqR2c9Kwz326S+XK5zejkV4bAaHR7x7tCvf54v2tiPMK2CbARdphzmdT2Co6vuiniYx
         GK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+9PHAPPCN5jb4x3hnhdMgy2to7itNwb0YpOnA8EnRk=;
        b=I/dbagRl1cGWhHBrpuEPGVgY8YBaDt9dSctRDYiw5pe7aOuq15lOSMLGy/hkTnoO9V
         XeAj9zYmSbhzid9mBfg8DjyUmZJ6jgxT3Ust69Tal+1A/yyCs5b5iS2lj7K7ePeNU9Y+
         CII/ufOQL1qM9m1Ml4/YxFHeMxAXQFw8VYKE0sLoAMVF18rhvBA75wJtvL2CE9s4Tr6d
         KlWpOrWnhHphvTddQMj1YoZN0Vg0XQ67ePOYylZLI0TLhXdRGXFeXR+6YNXCItofzQBA
         Fp4M1WoyVArBPJ+TJuWH6YFRKhifv0Qd/6l9VVBDHk5TGopMqoHX7Mwq18SoImvFNqwr
         QLAQ==
X-Gm-Message-State: AAQBX9c21yFNdjuZ+E3ndx7PB6SAexVeLrLo4S9DBpCI8b00dphiF7/Y
        uNu47IAhpuU3f6MO82ur4UHKsg==
X-Google-Smtp-Source: AKy350aVRAuk9UHGzbz3JrKgJsTi7Y2812R2vccKV/PxFG0+Tjj8/xtw3NOjO2V87CGaB7DohkLHSw==
X-Received: by 2002:adf:e90c:0:b0:2cf:eeae:88c3 with SMTP id f12-20020adfe90c000000b002cfeeae88c3mr15422099wrm.32.1680080110071;
        Wed, 29 Mar 2023 01:55:10 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:09 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Wed, 29 Mar 2023 10:54:36 +0200
Subject: [PATCH v3 15/17] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-15-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
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
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Z2Oft9Ecb3H2vKhjmkmQxcbqKZ2Y712Mk7ceRLy9+1Q=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcHv+n9+SgMIsZtBX98ZGYamPG8zt91y3/5fJp
 Vd7lMw2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURc36D/
 wMDS2x7THMMHHgg3ChRl85Kk6ZKzh2Fut6DuJr3RECqAihMlzkEXYwVzQhyxmhmRvm1KFHs6vcXPNI
 MJTFEQmLNZfs0PkyqTfkGfLQACnQar4EiZl1ekgYyIrkYl1hDOtsHyKFkuhqH4CgDspoBHQko4lJX8
 2IVRkhb58uKtC6GlZ9K1DcfhakQLhIs/XOCJe+V4INWO1tgI0y0ITaWNfiNSQmegenKv9bUUF/AJWx
 vwKSC6MeDjJ3b0i+AXT0sB/SygL8WkZHs4Va3g7Xmm7+br1cO+foR+rVZEAf8OX1w2LuevuH/5QSXl
 YX/ffPVhSvGPe4rzhen4GmM+V15d4rHOFr834rUq9VXUWSxo8MhBjQ5JhiLxj7ZuGWROPjfYecNgBt
 cwpsjHklfHbrGlPm8qufiLeNqOHlym5jwT7ziHEYo4ozw9Tr8wbCQo8SwNH9gRMCEilo4BFm+RFkn+
 zAP8hwGBi4jmXfDbEcMtNS3imwpst/o77WrEeLyGSrE3QoNAuvtmmOzSfjCPuJeJpOwczhO75vOBnh
 kHIlGuR1XhRG0vBzSR1Y82Pn2MAX70iUI228wIBA7BPfe3cCfVUWATnvCcjPZUK3qYWjQmuckm+JnR
 AlkVwWXv3FrUp7Wm52QErOvycncL9OQ9SCcGJCA0lDiIb68v+Zmvy1cmLO8Q==
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

In order to have cpufreq support, this patch adds proc-supply and sram-supply
for each CPU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 1820daad6da3..edf3a4b6a76e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,26 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&cpu0 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
 &ethernet {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet_pins>;

-- 
2.25.1

