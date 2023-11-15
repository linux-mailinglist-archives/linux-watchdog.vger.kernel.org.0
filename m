Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECEF7E0C50
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Nov 2023 00:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjKCXgL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Nov 2023 19:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbjKCXgC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Nov 2023 19:36:02 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E022D7B
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Nov 2023 16:35:59 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc34c3420bso26740825ad.3
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Nov 2023 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699054558; x=1699659358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1BlnpLKRujmj++l/dAo18/lb6NbFp3/th0VKiPzT+I=;
        b=O+fHFKu7OrbA8r/9UBvLMQF7TBJZFiAerfsEcmkBqiv6w8Lb5cCyr0jkWXhTPiGx5D
         f7pEDPaJZqcRoO/2l0MKK4DfLkx3006xd8lqV1UUcf/BhiMh06CmLWQdeBxcM/Y6KAyb
         M0Q/MGejeiGQXrnih+HadgcTmIqTE3YH/Ngpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699054558; x=1699659358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1BlnpLKRujmj++l/dAo18/lb6NbFp3/th0VKiPzT+I=;
        b=PHglkLG8OXaY2kkH1b1/lfpCt2iNDZTCLNPvMiRSGQr9RsGg0ZEhcjmA6f2h4uW4Go
         4Kn3NN4lcTQRXkKR9aWmzDDp3L+EN2RhohSz9B6ggYd7e8U/5P4lp5M8cyJj+swJYZrL
         Mmo9v5/1LqWggDLyrT9t/zb6KzDL8ZsSw4dHDQLFwYRPg9sJmkmfpt5bOi1PoAowGyA6
         CYcqMmsY9jG9MDGeKbsar9ZJ4HataUdRCf+TlwI4nP9O/8Wf5pfYJSks2CuDiV1Aj2DT
         Ak82wxFtHGKK9xMyLNtHs5IYDlf+CTCkTWdnikvaNV2eq+ryHUDevQ1EF4mLmSLgOvFd
         UHIg==
X-Gm-Message-State: AOJu0YzqQiVbqULKkz2KoHjw1S31iI0su8p/G4jYcEQrE2OBuXkHXykz
        j4mxH+xYRgZlXwlj9g8I2/dNVQ==
X-Google-Smtp-Source: AGHT+IGiKPEOOZ6icuMTp8Vu2YYI0J74G85B7ofaE4byNM28eWtIGjWhTQ1O9/bkWhFhSoGq0O8KIw==
X-Received: by 2002:a17:902:d2cf:b0:1cc:3302:7354 with SMTP id n15-20020a170902d2cf00b001cc33027354mr17375680plc.17.1699054558674;
        Fri, 03 Nov 2023 16:35:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:5195:5e72:f5bb:e3f0])
        by smtp.gmail.com with ESMTPSA id jg5-20020a17090326c500b001b8b2a6c4a4sm1878114plb.172.2023.11.03.16.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:35:58 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: qcom: sm6350: Make watchdog bark interrupt edge triggered
Date:   Fri,  3 Nov 2023 16:34:34 -0700
Message-ID: <20231103163434.8.Ic1d4402e99c70354d501ccd98105e908a902f671@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered. Make the change.

Fixes: 5f82b9cda61e ("arm64: dts: qcom: Add SM6350 device tree")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8fd6f4d03490..6464e144c228 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2524,7 +2524,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sm6350", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

