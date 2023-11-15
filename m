Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6957E3011
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 23:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbjKFWoe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 17:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbjKFWob (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 17:44:31 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D4E10D1
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 14:44:24 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5b9a456798eso2891479a12.3
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 14:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699310664; x=1699915464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoQQSdSDYBKEseBDgznR6qWCbGS/9uqfHl1O8JZlopA=;
        b=UB5FYUDmVoHNn5AX6qWx6Z7TGqqPuziq3IAuL5pIsIl/KaWGRmuqA1W6wVOt44XFbG
         gPOypVsSS91+T/fY9BOunlb1l1s250oY8ks1sXQ796XM2L+6bWqYAnpBxE4uVi3jCxv+
         jWaGeInivD210DibD0hPo+suU6BJa2Fz4/jt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699310664; x=1699915464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoQQSdSDYBKEseBDgznR6qWCbGS/9uqfHl1O8JZlopA=;
        b=HlJGmn9sB4TsniDEmYqYmIfeQJWK3GQytgVfoMM9iL4HHQ5ZeaEHRqRsgei6SV3f9C
         ekphIWzQpOO7K3wdM17Xwax7kAb+fLQ8wiREbm1r0WwFzSHKJvL9DTw09kM1E0CqdKrb
         G4c2XHnjtv8YyATMF6sfBR7eLZcEzWGi9bWU/u+E5DwEHIPoAOUlwteJH5WSqIRCeLim
         Z9ie1TwO3hSPISsEaAArLMnHVuuIIF12bkR0XZRaZ2gHgBJ1sRH2FMgCV4M15duR3ItC
         dGlD313MXwZsgLss7Jkq5Zaxmy72yXQRt2GhUtkDlKC3AFSsiL6R9n8RNpOAv2ARMVmv
         IAhQ==
X-Gm-Message-State: AOJu0YzUCo13Nd+3+KV4kPVS+grU6egUOQR/BfO0yh993jo0WTRlqItw
        d20woPs6kHqdlyxCtahT2rJgqg==
X-Google-Smtp-Source: AGHT+IFP1JyPcxPHC4k7NBuLtx69VLdWd6t2zKXiNXtGgUUDRL9+93hlXMrEA2gTPJQMP9kBuHCYMg==
X-Received: by 2002:a05:6a20:430d:b0:171:a2df:4e68 with SMTP id h13-20020a056a20430d00b00171a2df4e68mr29744632pzk.36.1699310664461;
        Mon, 06 Nov 2023 14:44:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16a7:2c01:9126:36a4])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00248a00b006b725b2158bsm6043402pfv.41.2023.11.06.14.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 14:44:23 -0800 (PST)
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] arm64: dts: qcom: sa8775p: Make watchdog bark interrupt edge triggered
Date:   Mon,  6 Nov 2023 14:43:33 -0800
Message-ID: <20231106144335.v2.6.I909b7c4453d7b7fb0db4b6e49aa21666279d827d@changeid>
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

Fixes: 09b701b89a76 ("arm64: dts: qcom: sa8775p: add the watchdog node")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 13dd44dd9ed1..6b92f9083104 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2235,7 +2235,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sa8775p", "qcom,kpss-wdt";
 			reg = <0x0 0x17c10000 0x0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		memtimer: timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

