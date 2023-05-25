Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C044671079F
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 May 2023 10:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240148AbjEYIfO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 May 2023 04:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240290AbjEYIev (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 May 2023 04:34:51 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA10E68
        for <linux-watchdog@vger.kernel.org>; Thu, 25 May 2023 01:34:19 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso3214715e9.3
        for <linux-watchdog@vger.kernel.org>; Thu, 25 May 2023 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003644; x=1687595644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhkj+jhN4dCHfkXrmOcFF9dhH+DUQWKn87IVVkP75hw=;
        b=ZehNlg4sDGva6upU8qgciq5kERZ1kPXqk6abmBRkH4/YOOB1F9xYfEupuOCwsiLquI
         J1QWYqqF+gp6Iuua9bvv/zKxGeks3OoHBz4JhCgD/lFan2QBKTrtQhmJdmaorUuATKcq
         ji262dckDTzlk3z6FLXtc/Nhrf7LrYiKIm1lf1/5YzLVkq66UG5FXoxvO+zh7pqAJhup
         3VwwgPmxGXvWffemlmT+3tOYtS0Ckl6ajMX2ncUizULjR/wfaAKJnDH3gFgeqdoIjnST
         zIDnvhF0d5CtCaEwcyhZ3ajYd7qXeIc7FikOkniL6snj7GRhkKRmb7fTtmyM1jIZMsJp
         Okng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003644; x=1687595644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhkj+jhN4dCHfkXrmOcFF9dhH+DUQWKn87IVVkP75hw=;
        b=Tqori3fc6YjBPVSIjhLEocU/EIddpwavIBkxu2Ayrk3q3TapINs79NFsPOBWmkrM33
         /9iQbRpC6wV3XbzbZd6dZIDocFZpxBT/YydjMeGeDKIFt0PQDwcod1Bd0ar62bUksjPX
         Asm0VyIKLspExggC00ZXbZgQsoS/IvXD2UW7eP2OquRO0Ruo847m0RPvYuZsQ3G0Sqgb
         pLilCJb4falDN/J9d3RYT+RVqre4wT9PRz/MvfPxHzqg94RhfHlI8dwZBQpjUZ3kZugl
         QvQAlTTczMX2/+8pTtu52ymRFhRnLvxhJTiKCGgUfUBuWIBlH9jPe+5YHI+syswgm1W7
         OWyg==
X-Gm-Message-State: AC+VfDzegILuz6P7Vy9N2FsnRcPVwt1qL3K1m6MTjAFBzuNPDbcFfLaB
        xmRFehNZB0EEbTzKRcclHyq1+Q==
X-Google-Smtp-Source: ACHHUZ4viw3eM0hV0Wb8n62o1kjN63f3hMtiJxSqJiv88U61/AOY4KsdYyKhzZ8jbOrJvDrNG2WB6w==
X-Received: by 2002:a5d:4d51:0:b0:309:51c5:3bf6 with SMTP id a17-20020a5d4d51000000b0030951c53bf6mr1654642wru.23.1685003644198;
        Thu, 25 May 2023 01:34:04 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:34:03 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Thu, 25 May 2023 10:33:18 +0200
Subject: [PATCH v8 09/10] arm64: dts: mediatek: add cpufreq support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-9-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=OvTRcKiKU/s8W5BwjdAVnfLSdt2CT87vdN092ipTOos=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1vbvuy1WNJ/1D1BVf3YSRSbsSUx2VB9NcibDld
 ohDbjtiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHUReu8D/
 oCNtNJ7CLUns6EscpWxF4xi+neHGt2aLVh+oMRVEHPE2Lim6v+HhD7WcsFWuw+DIpg1/6aCwmWinQ5
 CAY4/5DkhyAHPcMadY1IqrCOlPC7Y7UVr/8nOtidkboNctUyC1ajVLOj9NWCGpjQl0/aH0OpkSgmhH
 30WCSKvl1jcKuCNbfAYUy6oaqNxoZTmy0rYzxVQnBxRXMoZ+eF6yUnrTKSDJcj9i0lg0cnRPfP70Ax
 F6YAeTfIli3DUu5GGPh7196zn8ZmxwttTWsBbG9MZz1xj7AXxEpiZk7avGMBrfGXNIv32/gmz8kcWX
 8KhDD8UbEcYGu0xrrVEuVhlO4bqjdwK88ZSLkE3ZNbx/CCQUd89R9+GLRqUFhdIkASLPuRH5gqqNkB
 wYb1X11AhUC4ByMwpT4AzZQYEo2wQA7mObrYk8cVtpa9Dc5o112GTEmIlxKozhadu9KtGNLawAwaax
 Uvo5l3axpnosk0kdZCqksFPGOyMPHVWX9xBr1XHvclM5AgPlBs9MJS0ZGoJtydAcw+TSLdVfnHzzE1
 gdpGF0Hojoa8NEIqRAuw2JtlC9uooBZOCWLW+MnRTTwNMgPg1ElALo9f1I9JNKSpjy6mXklPPWVvxB
 XA6kc03Ss286/8KxS2raxjqAzZCasRjLfCEj7v5SJmfj2vyDcpeqzmx5QYjg==
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

In order to have cpufreq support, this patch adds proc-supply and
sram-supply for each CPU.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 86524cbf4354..50cbaefa1a99 100644
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

