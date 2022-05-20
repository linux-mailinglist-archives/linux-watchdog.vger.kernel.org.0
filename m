Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E3552EBC9
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 14:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349080AbiETMRb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 08:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348999AbiETMRa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 08:17:30 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFB61611D6
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 05:17:28 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220520121727epoutp045e0c1a4aac65120df72f007da0612572~wz1mhiDK-2610826108epoutp04q
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 12:17:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220520121727epoutp045e0c1a4aac65120df72f007da0612572~wz1mhiDK-2610826108epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653049047;
        bh=tAFGqTSx20s3yITgHirpAaGGK+zvPTwM5jXuHsch764=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=udNqpOnUKcrH+5q8uFm4Cx8u3Gb/ofiET62K4xJlkw+6pkEYhS9HyJhNIgzEdEErb
         6i1laNfcqCu1mzyS/pU6m9Vx4XDpUgcXLx0AdG/HUl0BFkySKDGP89sBeCFs6h07XZ
         I67zZ2wyGnUxa6M4kg1kEjIEAGCrXbDs+Z7JBxJQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220520121726epcas2p100ba54c46f5ad399eb23a05fd23e36a4~wz1mEBixO2976029760epcas2p1M;
        Fri, 20 May 2022 12:17:26 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4L4Qhf6dRMz4x9Px; Fri, 20 May
        2022 12:17:22 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        8B.20.09694.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epcas2p25b1d7b12db6030b490f191c2ae3e9f9d~wz1iKAwop2748127481epcas2p2B;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220520121722epsmtrp1b960c63309263d0b305bf7ed0fe178fa~wz1iJOYNv0210602106epsmtrp1j;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-40-628786d23237
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CC.2A.08924.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epsmtip26044ec1e23d5d0c752438945a702e4e7~wz1h-zOlt0065000650epsmtip2b;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 2/4] watchdog: s3c2410_wdt: support exynosautov9 watchdog
Date:   Fri, 20 May 2022 21:17:48 +0900
Message-Id: <20220520121750.71473-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520121750.71473-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmqe6ltvYkg8N7DS0u79e2mH/kHKvF
        3tdb2S1mnN/HZHFj3T52iycLzzBZtO49wm7xvA8o9vjlP2YHTo9NqzrZPO5c28PmsXLNGlaP
        nd8b2D36tqxi9Pi8SS6ALSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8x
        N9VWycUnQNctMwfoKCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFp
        XrpeXmqJlaGBgZEpUGFCdsb3t5PYCy5LV3zZdpKtgXGheBcjJ4eEgInEkzunmboYuTiEBHYw
        SrQf/80M4XxilNjwehGU85lRYvL8RpYuRg6wloNriiDiuxglZq39CtX+kVHifd9iJpC5bAK6
        Eluev2IESYgIrGWUeP58IiuIwwzSsvn+H1aQKmEBT4n3DcfAbBYBVYnGe7/BbF4BO4mlHUfY
        IC6Ul9gwv5cZxOYUsJf4++AvVI2gxMmZT1hAbGagmuats8FulRBo5JD4cfElC0Szi8TFOyvZ
        IWxhiVfHt0DZUhIv+9ug7GKJpbM+MUE0NzBKXN72C2qzscSsZ+2MIE8zC2hKrN+lD/G/ssSR
        W1B7+SQ6Dv9lhwjzSnS0CUE0qksc2D4d6gJZie45n1khbA+JP/OfQ0NrEjBQWt4yTWBUmIXk
        nVlI3pmFsHgBI/MqRrHUguLc9NRiowITeBwn5+duYgQnUy2PHYyz337QO8TIxMF4iFGCg1lJ
        hJcxtyVJiDclsbIqtSg/vqg0J7X4EKMpMLAnMkuJJucD03leSbyhiaWBiZmZobmRqYG5kjiv
        V8qGRCGB9MSS1OzU1ILUIpg+Jg5OqQamfNfELJY15uIVumov+3V/vOHTYjrfdq7vgeZXpiCH
        oPaQ1jm/7B/Peb1Q6Nf1khkfK7SXVE+ZfE1AfcOkBJ03vlM2C7/7y+t2JEAsmfVX3IJUM7Nn
        syPui7D5CkdL1DiuvrW9068u6XXCNVWWi/rWSc7fJX1X70qf25ozd3519NVF7QkeAUoXFpxQ
        eePqdXn/+Um7dx1TzuWWfv9cLCnHxlo72+P33/I9/RM37+8zyX9t5XI74Pxnfc1e9l18CQfW
        XjOMt+lh6jBo1Fzy/CNb7j3NOIm/89r3pgnGsc1x5T9m+iz0O+vdWM1n/ryLmB6Wrvv058Xd
        5gwjyXdGbyoCLizeH/uqSmBdp31u9iYlluKMREMt5qLiRADawi4ALwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSvO6ltvYkg7M9ohaX92tbzD9yjtVi
        7+ut7BYzzu9jsrixbh+7xZOFZ5gsWvceYbd43gcUe/zyH7MDp8emVZ1sHneu7WHzWLlmDavH
        zu8N7B59W1YxenzeJBfAFsVlk5Kak1mWWqRvl8CV8f3tJPaCy9IVX7adZGtgXCjexcjBISFg
        InFwTVEXIxeHkMAORonz/+ewdDFyAsVlJZ6928EOYQtL3G85wgpR9J5Ronf6ckaQBJuArsSW
        568YQRIiAusZJX7tmskKkmAW2Mco0T43AsQWFvCUeN9wDCzOIqAq0XjvN5jNK2AnsbTjCBvE
        BnmJDfN7mUFsTgF7ib8P/oLVCAHVzPrynRGiXlDi5MwnLBDz5SWat85mnsAoMAtJahaS1AJG
        plWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMEhr6W1g3HPqg96hxiZOBgPMUpwMCuJ
        8DLmtiQJ8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwMQc
        cm9z7EvWtbbKHTUXWddO3SkhEfJ+c7jETPOivoptui5rrXcqHN6ddp75W9WLRpPHPxdkP4za
        +uln4idebxbV1cmt7ul2FvGGBXffOx6eOl07fF27MYdtlazk4RdbrGeahnZ3L1PlEGx8e+5X
        omPDjqpYp9WzFIw/3Tn8/dK2Rao3XmtPTmmxM5yoZbnptKfYhE3u9mbrF5u+nZW5/nDhsw/v
        i/Ylc3+X3Ft879gyvpBnC/+6JakY2HzLt1GcPmN/hWytJfMnh4VV7O9qHTYdN7Wdd/V9rFWM
        V02a4uETqqpF2yyVHzE8ijIIL0k9+/3PtsmnZ0ezzZt5Xb7W9v5qxWdcwesPXmOP/iamuV6J
        pTgj0VCLuag4EQAWV0Fw6AIAAA==
X-CMS-MailID: 20220520121722epcas2p25b1d7b12db6030b490f191c2ae3e9f9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520121722epcas2p25b1d7b12db6030b490f191c2ae3e9f9d
References: <20220520121750.71473-1-chanho61.park@samsung.com>
        <CGME20220520121722epcas2p25b1d7b12db6030b490f191c2ae3e9f9d@epcas2p2.samsung.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Like exynos850, exynosautov9 SoC also has two cpu watchdogs.
Unfortunately, some configurations are slightly different so we need to
add samsung,exynosautov9-wdt and separate drv data for those watchdogs.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 41 ++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 6db22f2e3a4f..0dbb3ec9c29c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -60,9 +60,13 @@
 #define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
 #define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
 #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
+#define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
+#define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
 
 #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
+#define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
+#define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
 
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
@@ -236,6 +240,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
+	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+};
+
+static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
+	.mask_reset_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -249,6 +277,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos7 },
 	{ .compatible = "samsung,exynos850-wdt",
 	  .data = &drv_data_exynos850_cl0 },
+	{ .compatible = "samsung,exynosautov9-wdt",
+	  .data = &drv_data_exynosautov9_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -630,8 +660,9 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_OF
-	/* Choose Exynos850 driver data w.r.t. cluster index */
-	if (variant == &drv_data_exynos850_cl0) {
+	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
+	if (variant == &drv_data_exynos850_cl0 ||
+	    variant == &drv_data_exynosautov9_cl0) {
 		u32 index;
 		int err;
 
@@ -644,9 +675,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev)
 
 		switch (index) {
 		case 0:
-			return &drv_data_exynos850_cl0;
+			return variant;
 		case 1:
-			return &drv_data_exynos850_cl1;
+			return (variant == &drv_data_exynos850_cl0) ?
+				&drv_data_exynos850_cl1 :
+				&drv_data_exynosautov9_cl1;
 		default:
 			dev_err(dev, "wrong cluster index: %u\n", index);
 			return NULL;
-- 
2.36.1

