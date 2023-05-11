Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3E56FF739
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 May 2023 18:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238615AbjEKQaI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 May 2023 12:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238839AbjEKQaE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 May 2023 12:30:04 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA0EDB
        for <linux-watchdog@vger.kernel.org>; Thu, 11 May 2023 09:30:03 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so16028319a12.2
        for <linux-watchdog@vger.kernel.org>; Thu, 11 May 2023 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822602; x=1686414602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=GKut44jv/m2gz2NLfdfriKWeIeoGw61GlsuhGlK5kr0xoxOlCWKuZHLjW2eAGOU7Ym
         3y/EhK6PlkXPPo/ZwiWU3f/MFQOF2oQ0pf8xLwhhF0n0DXMSYWklP66L8PDmvetZNP82
         sWrRlsjDWFf7KTmMwv+EnORflUX5jcL3Y4Q8+PaBd4IY42m8yiC7QeDqQFRf/lpHHHxn
         9rph6JUzwAZKZ9UE8dY1vpHXASpQPchFrNmPa9/QGMy9oi2jAkr8reo7rLG9EvyjFPzE
         QZwWuM962U4F/Uv8CrH1auj8xmzcrnvT82EpCBjVkLsFb+Zln7klHqlYCUdxbWY9HPnU
         SzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822602; x=1686414602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=QfJDy0LGRU14VNdovXB1Q7zO+keEkQbbteGX8MenzbGOStrcDxioZWAPmTqOXCX5Ql
         ghiJ92yA2QwZkXovJfeiigB9N+HUJ3ktOV8KyQBgFN9gbYilC2yUeCvePuDrJ6tNiDry
         bixl0TonixSLQwN24KjZJW59jX4/htdzpniXPDuxr5oNDdoZ0yWV3Sj4NY61/5ohVQRt
         uPa2YWJqKNaHLNYa2xfojSldSsi1M+2L9mB7YYG5K7pCVlvKtlqDSdUzTadhaBQ417VE
         F7lrt6HvtQ5+e5kvmW51xwDc2Srms3PNaby7SMWOWGqjkX/FiNHt2cbi6exDZ8fr+Z52
         6JPg==
X-Gm-Message-State: AC+VfDzUPhr1xltPHeyXTGorKNqVWz6/2ZAtAzfpW5IklB9xZqjTsEsh
        V7n58v1hZ22pSUAy/nHX50vChg==
X-Google-Smtp-Source: ACHHUZ5dS5b97ca1fLNMTMneaSjiV+OrWXMVhFnzL+ZkRjzgf/aaSno8BMVOseLzddzE6Hjo8oxMwA==
X-Received: by 2002:a17:907:3f28:b0:889:5686:486a with SMTP id hq40-20020a1709073f2800b008895686486amr21552826ejc.30.1683822601894;
        Thu, 11 May 2023 09:30:01 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:01 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Thu, 11 May 2023 18:29:23 +0200
Subject: [PATCH v7 03/11] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-3-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9yZG6Lt2sYetnfjl+HHfU8vcDGstMCEZ7QfVbikE4Lw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgEtFRKjs1rbvTwHl1SQzZKB0oJiYLU0/UNRIr/
 1PbYnX6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBAAKCRArRkmdfjHURYpLD/
 9fNLpb1Gb3TFT5St5ZutWnqiYhlYMmFqgTcyEEYrKwbZdbcZAAgeF+PHn3SJSgisGWxd3W/EdzNHS/
 Vp5uUQ7CY4mni6u7Rk8Fexb6k0c//sTuk/yBsZK8N28jB2RZiLZQ3ia3monpsSoIVBsxGZC/lUDDij
 CtkPdSwrcBgBUZFLrDEyNVvRmdGKg+sAtKSzHYFOUCxIIqYc6cYXZxehc8vRbbz7uQO7nIH4tPoDLC
 4ShZ09O9mRqqXV23ZgoVQc/UQy/Z9wDKkZ3wItaU8A3h0jqgro2KsXTiz8LZMCLsrIAr9wV+sa1yFv
 c/e2b5EZ8/3NgoLO+j8N4UktB4t2Mgjef84tOtXRvjN5sGQnSxV3l26yK5HwFJ8MMGdeAV+Auzl3qX
 BXjcBPuUb0MQY2vHiLSjhm2meNF5dbT06ZGSkf5rQDgYXIJ3NDGl7X00iN5ie4Zx9VeR6u6bc8Om2+
 0j8lGUzpVZGtzuI13KfCMbe21ObjbNppaAu2KhtcvlkLNEIaLIRvOG59lDUA7qUwtRMyCt5zggW7jn
 n3mDtEE0Yi1HT1JnDUF43i5VTSgtNqK0SUsuUr3WwHgr7BUG0qgzzEW21quckQm3MDPiRiVhcvYuOR
 WEWxcieDJ18u1xFk0Q5z4w98SaLCB56XVX6zAP6y4hzwcyfEU7W8X4g3AxIw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add watchdog support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 1f6b48359115..bb45aab2e6a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -162,6 +162,12 @@ syscfg_pctl: syscfg-pctl@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8365-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;

-- 
2.25.1

