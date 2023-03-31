Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9282D6D2743
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Mar 2023 19:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbjCaR4C (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Mar 2023 13:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbjCaRzn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Mar 2023 13:55:43 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB09311EBD
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 10:55:41 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso14417576wmo.0
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=;
        b=1WiWu83YTDyzTUyd/W70MoO7qX35QRUxIBM/DuF/wjsQs/ITxt8Yl7XFlGAqOrm1ok
         ZWOxvDjyhXuiwqu3szeEKR+a0CuWrXppOELyzzwxkeGLeUubf/t05OsicTxWhcCxpTil
         hccAwdEl8OspkbPjNqY9HAhJnfDs0ajpSHmGWKG93/QJeeTxHDsT7XkJiyUp4Z4HWTYk
         FTRVFTkQyQvtqk0zErEm5BubuoakiODUrO0xJK+fWFswY7HtJuln3Cv0Tj8UPdGuqhsd
         xDTVEh+IEeiTijnGmQVbyNSn0t94oiER9Kb988JLpJ7ZNkFCap8dNxAN7bjfEnB15YDI
         HmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=;
        b=nDRKo6LWezDwBQpn+NiW+nQhK8fhMsS2HGeIMbkVaWQUzCsRJLKzKTGRlzYVINjI2p
         agVPZWj9RR0t571MZbPB4lOntUnnIQ5ZH5lCW/BhXnC9iy+eQLcK+hUeG7Fql9k5Lqqv
         caUcohMRF6W3Mv1m6ASj4ALCHQ/Ae2HZTxGBoPlZbTJc0Wn7KGjhciTi+DEB5TE2gg1n
         6jjMThmUuWZH/Rn0uZKZBMzNjaa6fEgqXIvm1wMRtmJKcePtxnl4htu5BRY7ZeAYkCUM
         PhURlphNqBl1T6k/Shiq53spdAX037lj2/1o1C9Hm8furweRLQfY3PBCM7VYr1+qyi9a
         uB/g==
X-Gm-Message-State: AO0yUKWWet6XEAmhfTfx4vJEL82XIkY3LDJPQR+ZBUZHRSJ4s4xcqWWZ
        6jAJgxwq9WGDL2b2Y+E664Ebjw==
X-Google-Smtp-Source: AK7set/2D/l2ZFdo55JHgf8O4RcAGsB67PsU8O9ue5Szm1z5ZozwaDHbixBnEFGZHAzA784oyzt41Q==
X-Received: by 2002:a05:600c:2254:b0:3df:e41f:8396 with SMTP id a20-20020a05600c225400b003dfe41f8396mr20536017wmm.37.1680285340382;
        Fri, 31 Mar 2023 10:55:40 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:40 -0700 (PDT)
From:   amergnat@baylibre.com
Date:   Fri, 31 Mar 2023 19:54:50 +0200
Subject: [PATCH v4 06/11] arm64: dts: mediatek: set vmc regulator as always
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-6-5cffe66a38c0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=uQmwTOCvAzVnfNhZj39MxdhTEW1pXL/YxThy6HLL1ww=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6UFEGO3EPfGZzJN25PtdCGUGHY0eT4OfvboZf+
 +B9lQf2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURUhyD/
 4m79Sfb36DHmtlwAKTlZFD6nfbVFS+2Ggip4saKhmYeLvKgD2PrzNlQON/R0RcFL+xZjLNrBZ+Fn6P
 iEqh+lCO6BpRmWJvhgYMF0gGd6Lr2AzbjpBT8TIpAN1YLmWydvnGqsBOPt+3UoeNOWz88XISB2DsFk
 CAQyKrvpEM88hCaxWKQEL27qHKi5WEMmMtzQfgW1eNSBUnMPaMAPyEDIDj6x0+YZ8uByep4HFlv46Q
 jcpQvqFZ2a4Hv8SPyLeKZ5AOpeAzlmdx5dF/FwhQuLDxXMdivJVM7OD7SgFzSKqnFjyl+vP64Wn/AU
 +h2anbG6bCCVFm4ljSZKxvQt9TzLxxYTDAU/r0TXWtnIF5wYPPnpNnPbA4iK+fC9oouTPwvbnBvc1i
 pN8KR8eV5NrzR6OING65eLLr/wxPgFvL8blbzU0gPOGCgGEub2WP1VUcHuuB+XCJc0hCc3v1CrC4dW
 N0quJbr2lO7gZNHhdPBUu7+RAm/cJVfG3Mbh35EqPi+2zLCbO5OIXZFdRExPsSxFFzIlbkbZNA53zE
 TSuOYh2b3qXy9Xh66PFHOu6xP3MPZr7RXMDPfYxcYVQjRCfBRMOuqE9aF9aZMcKMMdeaM6JkoLckFv
 ayQf8qx/mVqfUAy+0jP07TVxljlDB1i33FLzRWYolSWPAIn8Pqcgh/WT0EQw==
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

From: Fabien Parent <fparent@baylibre.com>

MSDC1 IP block is powered by VMC. Make sure it is always on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index cd920d09c3fe..1c36d8f19525 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -137,6 +137,11 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by MSDC1 */
+&mt6357_vmc_reg {
+	regulator-always-on;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1

