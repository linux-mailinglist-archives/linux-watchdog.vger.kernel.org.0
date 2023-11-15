Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0BD7E2FFE
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 23:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbjKFWoV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 17:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbjKFWoU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 17:44:20 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5225D77
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 14:44:16 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1e9bb3a0bfeso3079644fac.3
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 14:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699310656; x=1699915456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEa1YhaI6E/DSKEdiY/yJdz0Wh7Ldi/F7Q44NLO+PJQ=;
        b=C1dZ9i1P+3RfPTZUX+eTvGxc7Tpd+jjxUfclljveuPnvWnh8sG9Od3eypO7w4gHGL8
         45Gw+n6Gdk+EXZ4Im1G/n6hHw7oE0GzlH/GzRDVSzwD/+ReQO6j/zLiVROfXtmSTJfC/
         RYiaCABXHaYOn6JJI8stLZ9P1/y+sUbWpUL10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699310656; x=1699915456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEa1YhaI6E/DSKEdiY/yJdz0Wh7Ldi/F7Q44NLO+PJQ=;
        b=wCzFF5Zr0Ug1zkon75UskYTHO4vMLNuF3MmIiMNJcuJHRo4dQjqbc2V4+9yS41Xfwc
         wmHpiSyIz7Zd7aI2cLb3XKoNElrD6VdvJujc1rAp2C6cINu8+W23JghSkSTdOGundwDU
         vLOHnl9jnXdHdKwfNj3Cfo4HfXY3xDjDUc5FIHfBw9kyVvGEWIQifuq4ZV9/QOooJLWW
         9un3lKwI2LLCgTXnCUnjPKK6f8+YkOZxQzBA0e6vFKMuUczxBudS8fT0ZBEThlOevWHp
         XzmgnoP3fQ9DqBeN269oU+f5RUDLIOJRnek376GwmL0gCWXty1d8n2MayvgLFrLlpllt
         CmLA==
X-Gm-Message-State: AOJu0YzJybYY1loMpL1hfXT0YvcNFt4w0RSA0SC/tfAA04Xfb4smSQp1
        X2sFgKb2sLvSsJ16FdHVAQBfOQ==
X-Google-Smtp-Source: AGHT+IFh7/H41PW/ppGqA6uqFtTneJWaryTFy923BZ7uQQOrznF8C+prk0YJps9r/dnHPHRhuKcniw==
X-Received: by 2002:a05:6870:10d6:b0:1d0:d9e2:985f with SMTP id 22-20020a05687010d600b001d0d9e2985fmr973799oar.57.1699310656018;
        Mon, 06 Nov 2023 14:44:16 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16a7:2c01:9126:36a4])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00248a00b006b725b2158bsm6043402pfv.41.2023.11.06.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 14:44:15 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     swboyd@chromium.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] arm64: dts: qcom: sc7280: Make watchdog bark interrupt edge triggered
Date:   Mon,  6 Nov 2023 14:43:29 -0800
Message-ID: <20231106144335.v2.2.I11f77956d2492c88aca0ef5462123f225caf4fb4@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered. Make the change.

Fixes: 0e51f883daa9 ("arm64: dts: qcom: sc7280: Add APSS watchdog node")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 04bf85b0399a..1964ef66492f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -5389,7 +5389,7 @@ watchdog: watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sc7280", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			status = "reserved"; /* Owned by Gunyah hyp */
 		};
 
-- 
2.42.0.869.gea05f2083d-goog

