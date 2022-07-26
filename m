Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7D7580B98
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jul 2022 08:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238001AbiGZGZp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jul 2022 02:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237999AbiGZGZZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Jul 2022 02:25:25 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB402AC7D
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 23:21:09 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c6so8352025plc.5
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 23:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hxj6DGJEQ9eVglc2HFvoWbvN2rjJ5YG5R2YUt0W282Y=;
        b=HPHbw9Lrg8q9567laPcDSY/SW4aD237sQpcOnBJSqECQPjBwHhLg6mf0gurPJlVsrB
         tnq/ObRJb6ohjohjtB7YyzN7Cf20Z/cakGZGcTESH/NXp/ehxuf+7HgD7bXjGSeLEBKA
         LUqunAZXMfGpiwyV4fLv1ZB9HqOujHcH2jRn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hxj6DGJEQ9eVglc2HFvoWbvN2rjJ5YG5R2YUt0W282Y=;
        b=csvLGy6Rl61ZGz18IXmvJjX/nfmnqH8AX9/SbDFKqfFvaBW0tIoohV5wWn70rDPwlz
         EkyGc3ax3bJ3OGttMO36JtDtevT1iMUXBcxwKKZmUoUlbqfFKeMfDM8jIhLBZ/oHfvHI
         SONVKXqmFNRWN6bzNKGdQWDh36DfBIYjMRxgBOTv5/H1IS0YBfiHP/c7DFNqPI3L0ds1
         tf46g/HriEuOl7LVvfFcn0udsGcjiXU3gf1Ivf9y0PKBzH+rWInl2Dx9W55m+NklR0Kr
         7ySgiV2tsu2eGdQUYuOZdO4AJhZ3GOJIMPvwGGez3r3xekP+V3QunYTlLw2t2NMPEKcb
         G76A==
X-Gm-Message-State: AJIora8gr3C7LdkZeiLeNutxO2Ub9WyduhIByaFOg5iaS6PAA9e+Y9U/
        cEgo8gKqDvjQyNC3fy5WyzcD9g==
X-Google-Smtp-Source: AGRyM1uE4OVpcWRiVc98XsCir285Y0UIRjf0zgaXuN4UfatJFerdJtqDgZPPv36oHAirLgGuyaN4Ig==
X-Received: by 2002:a17:903:cd:b0:16d:22c0:2efe with SMTP id x13-20020a17090300cd00b0016d22c02efemr15171222plc.61.1658816466607;
        Mon, 25 Jul 2022 23:21:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8fa:d08f:848b:ad7d])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902cec500b0016cbb46806asm2694632plg.278.2022.07.25.23.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 23:21:06 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: mtk_wdt: Move mt6589-wdt fallback compatible to end of list
Date:   Tue, 26 Jul 2022 14:20:57 +0800
Message-Id: <20220726062057.320342-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog facility in the MediaTek SoCs are all the same, but the
hardware block also contains a reset controller, which differs in the
number of resets used between different SoCs. This difference is
supported with of_device_get_match_data() supplying the number of reset
lines for the newer compatible strings. The original mt6589-wdt only
covers the watchdog facility.

of_device_is_compatible(), and by extension of_device_get_match_data(),
works by going through the given list of compatible strings sequentially,
and checks if any of the device node's compatible strings match.

To avoid early matching on the "mediatek,mt6589-wdt" fallback compatible,
which only provides watchdog functionality and no reset controller, move
the fallback entry to the end of the list, so that other, more specific
compatible strings have a chance at getting matched.

Fixes: c254e103082b ("watchdog: mtk_wdt: mt8183: Add reset controller")
Fixes: adc318a34066 ("watchdog: mt8192: add wdt support")
Fixes: 8c6b5ea6ac68 ("watchdog: mediatek: mt8195: add wdt support")
Fixes: 4dbabc4d9e8c ("watchdog: mediatek: mt8186: add wdt support")
Fixes: 711a5b25bac9 ("watchdog: mtk_wdt: mt7986: Add toprgu reset controller support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

This change complements the removal of the fallback compatible from the
bindings and DTSI files [1].

[1] https://lore.kernel.org/linux-mediatek/20220721014845.19044-1-allen-kh.cheng@mediatek.com/

 drivers/watchdog/mtk_wdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e97787536792..3d5a239b93ba 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -425,12 +425,13 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
+	/* Fallback compatible string must be last entry */
+	{ .compatible = "mediatek,mt6589-wdt" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.37.1.359.gd136c6c3e2-goog

