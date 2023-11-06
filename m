Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7FD7E3014
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 23:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbjKFWog (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 17:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbjKFWoc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 17:44:32 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD60710E0
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 14:44:26 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso5074139b3a.2
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 14:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699310666; x=1699915466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL6rNqUZZ/R7S5vMBh8Bonhs6IZKDfrdmFtaTOQlgvk=;
        b=CSqLR8BeVRWdemljm7igAtREKR8rhIPSka/BQLGCezQwEbyf8B+CGWDHBDXRt9URe8
         cko2aRE7+WBXaVx4ehKNIYTMUcKbRQ9NIb1UMT7dsLkkTqcdISaVFaVbvnWCJZ7CQBck
         Hg5vp8Ru9+p7G05kB84i2BJDsPjTDeD1XUNaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699310666; x=1699915466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL6rNqUZZ/R7S5vMBh8Bonhs6IZKDfrdmFtaTOQlgvk=;
        b=qdzI+pjBj3PZtS/1nwImwS5xBWtSVGCBsiuq93+f1GnkdsBlsRWlr8t7rPm+eMx0Be
         dHOesa/57UeH+OMnv0fCDaFKlmzZaeb3Pw3N3fyEbMySB9ty144eDsvtrQsycWuhTRPb
         BA0FZV2XnSlY/QVVy8kKf2iosJgENq6rz6xoYbypxawqwnXi4d1cxNMtruHgIAL0i9di
         N7H5Nsonf6uUOoeeIvCyRVQoGuYJjW28JnBgvX/0Vn9lP1s66DsODg8Unah4069h5tCo
         Aywl74rr1w8kyrb9HRj7NodKY5kcLyBa/lJNb+b6XFH4Hm7kd/QKlkgjDzMekVV/ZYn/
         1q1A==
X-Gm-Message-State: AOJu0YzSbRj9z1mXk5sV89xU62bLGDLhGp5y1krKysGTw2slu0C4ErY/
        hZW4ZRxyNaKCHUenhdXPjkOdlw==
X-Google-Smtp-Source: AGHT+IGeaYGnK2mOvcF4px0EdMUPyG/1hdE+Ly1oivTOAyc2DaqvSBOFigg78Ncdu9XjKlpJUhYFqg==
X-Received: by 2002:a05:6a20:4412:b0:154:3f13:1bb7 with SMTP id ce18-20020a056a20441200b001543f131bb7mr41711778pzb.49.1699310666346;
        Mon, 06 Nov 2023 14:44:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16a7:2c01:9126:36a4])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00248a00b006b725b2158bsm6043402pfv.41.2023.11.06.14.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 14:44:25 -0800 (PST)
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
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: qcom: sc8280xp: Make watchdog bark interrupt edge triggered
Date:   Mon,  6 Nov 2023 14:43:34 -0800
Message-ID: <20231106144335.v2.7.I1c8ab71570f6906fd020decb80675f05fbe1fe74@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered. Make the change.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..b8081513176a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4225,7 +4225,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sc8280xp", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

