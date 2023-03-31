Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43BD76D2753
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Mar 2023 19:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbjCaR4U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Mar 2023 13:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjCaR4G (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Mar 2023 13:56:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC6F23681
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 10:55:45 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id p34so13363840wms.3
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 10:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=;
        b=BKyf4eSl5Ij8A5Gk9OSRlQSn2pRoCFWyIYl/CqoGNZgbm3sTj4Tv8ezZYERUqYV4H1
         E1tGOiKM2FrLCEMFlUDF+++sbqxg6jwnfy7ioW0/ojVLifPGBvdW5KgQLCzYuiEwXwX0
         OSzdSY/7ZXbyoUv8KFlPcEk8X8pX01Hn/Gz1FFf/q4L47pZUJI3IJBPtkig8cOlDWBkU
         BWn6+tFIo+bwR8hfGYIpG6Y9zN3JHnAZp/CG24sYy++/NfHClaO+ydkH8IQ3vghuQfQ1
         7ssCO7pPDXB4WISTBpVwKX8tjFzYwOXsEcSRptT+0BQMh2wy36HPaEMmH1H44IUU+/xm
         H25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUmOIxvTfzN/vGXSwBwDqutiowJ/QbUaHMK8ehs6bJ0=;
        b=tADDKzTjMmYs3c9GihdwRAsfqQ6DLSklaVN0TB1+jIxTG7rgi3fKW6CgJVtHP/USjN
         Lx9rFd2TSlt9OGTv9c7KU7pJq6ghaFfbWt/hP72opXXoyXG6sH+AP173SzA+SQiIK97c
         jdDrrx7byZbqMgF6DfMfRlqB8EPMUCRZfWtqZolvy+PXqR6SrqiR56iGde3q8CYPunVW
         qpWjo1eKGADQgmCJDM2PsNxGnMpWI/z1TxoA4G+4n4ep4yDTqolvFHhcHEaFzlpMls0j
         PP8TO+sLF3Yg2MHBUXHeY7eJzVv/geHLL5qXmmVu3n0H0cQ/9/SVj9kygiZ3NErMULX+
         b+SQ==
X-Gm-Message-State: AAQBX9e/ANqZHQ/HnW+9HCQNscdlvjniDI1BENjHdMlz3CBQGJTjLcaA
        4mMRtizxkPkzV2ps6l5soiz0Nw==
X-Google-Smtp-Source: AKy350aDtT9OhmWwKzPH1TmxBtMFR1n4CYep02Ck+wMXTMA4wIXwTafKEFqAvJeirbWtYd2GUvRhJQ==
X-Received: by 2002:a7b:ce83:0:b0:3f0:4428:9445 with SMTP id q3-20020a7bce83000000b003f044289445mr2085101wmj.14.1680285344904;
        Fri, 31 Mar 2023 10:55:44 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:44 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 31 Mar 2023 19:54:54 +0200
Subject: [PATCH v4 10/11] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-10-5cffe66a38c0@baylibre.com>
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
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=thd5AdegnYYpCr5cvUhR9vmXYqLF1bam1m97/2vSMvw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6Ukn9Y4BN12qGraLtke2CiqXMYiKZyMbME2Gl/
 1edfSjuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURSc/D/
 wNDoxeQEaf93XmF9jGY8jY1y7xJyADP3nrf5Z2y2Lt8wFIMZpE+JGGU146cxaQavq53zD0qB2u2eTs
 Eu0JHbahVSK0SaUUnev0u/HQzkVs+FFk7zIiKxYMe8AHp+SpZEval+8zoCJAvw9nc/hA39qSqASTDp
 V8NExTLbMJSOEftHExDxGl2LdyJ1a8kDVKO9hCmLEIY+XmyJn8a7bTYw2rKoKB1BWI/xRyQDpwZ0dj
 vGrvZgO2HvWGtZt8CDuh+uMdRNdrH7WXdA/Clr9Qttl7FEeoEM08DKqMp1nRDCOdSMFLDeNUQtqLwd
 KxnnbD3YrCz8mcMtACdKSoUR/10eIdrqPGNt2nlvE1Wyn4OUkyT0ndFSvbdkXhjI/t9R9WYNZKie/E
 LQ2qlXA9Tzbp7CO+fgktZvXfRH2Z0USTVM61r2upgfKsMCVp5lun3LvxfkAxqRVoxXnj3KhykCzQnq
 4bQOoKnsHPBBz6Dx5V+GtIv0rq0Gjo2+XUrnSdn36u7qPkkU5GJBKyMSsMlaxiIyqYp65pPGZvTw7/
 qSlpRtdxNNXMft9G9QHAl+XV/R0mpMYKiTYoWdJz+tNqGCoCpEg0xAnBmGgtCyMevnP/t8x0NoNXD8
 DR/iIp3h193YRUPY0Emb7nks6pTaHoMWVHB0SnbG8jlEOkr7Wp/5RMT/ersA==
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

In order to have cpufreq support, this patch adds proc-supply and
sram-supply for each CPU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 431078f8670e..d723838ed49b 100644
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
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";

-- 
2.25.1

