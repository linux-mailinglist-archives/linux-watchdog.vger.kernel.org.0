Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929E8686A0B
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Feb 2023 16:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjBAPVc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Feb 2023 10:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjBAPV1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Feb 2023 10:21:27 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECFACC34
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Feb 2023 07:21:21 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso1646995wmp.3
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Feb 2023 07:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfiAJhWCSMgCEcGEAhFzJhf5R1x05G+rWIUQ9Ziqj6k=;
        b=x+9NnYk7j0azIF0oaj/wBp5N+RsuvyR7zMLKMnKU6GxSLUW8uyh0b2cp6v7jXc0+Ua
         2ORp09r5Rw87cGjGuxaoJHwrFcCPB48cWWsWpYkmUt8FV6heeqyP30AB1gXR1slTMT49
         58SWaNC4Spz7agvhGgP92ICVRUkfcz+WTZpFISgoiVGXt0LslmWfwKD6Ey61/UnE1M4K
         GD0PGP1hKJu/5Fzj2UpdNMx/NSykD/mTr+t1EDGbHGA+gFWl28SSwdi6bD+ZLlXqplFH
         QWwEX5D2UUZJ04/DUhfn+DalN4Afq5uV6BfZpSnj6EfjAlV0YS/eGWNICyl7VOLooPaj
         CaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfiAJhWCSMgCEcGEAhFzJhf5R1x05G+rWIUQ9Ziqj6k=;
        b=A97K0U03TbH46pzX1kn1ZleLkOL45dfRcpVzZcgeiu6kjhS0ChbhrwP+I1XjMA5jXh
         MIEoLL4pI4gKFT/oChRrnZo2UaYeZaHOn1zG0zFuw6fjrMXgbdvNrkA1ysDSZFdRy0BG
         MXj674v4q+XGnvXtyj+wGCuz8/ER4ogIoCu5SP5W+yFxIGlvrDr6NO0HzUiPv2Yh9O+V
         AgNv5p/vpwKLFPCFjKe6L38Z/yC8bRg2OGg8CevxYKW3vjznSh/1Pa8gsAykDxz238iw
         UpuIsxy2/RUXkuernTMOz1z5NCY0xTAmfPpxajMdfAXBiXAHWD9yKO0psvBgMeNv/N+B
         so1w==
X-Gm-Message-State: AO0yUKXIFuzjanUiuePseXAUile5c7dLk8UNhEScfXhwue18rGgYIMHd
        jD1VRdi34lIO9NhJ5rKExEDApg==
X-Google-Smtp-Source: AK7set9tX6J/22MdEHrh5v8f/7/SM5D41B6DcAA0B8xBdCcFkBIXcZ4hctkopjCq1xzU56oMCYRedw==
X-Received: by 2002:a05:600c:511f:b0:3dc:55d9:ec8 with SMTP id o31-20020a05600c511f00b003dc55d90ec8mr2504689wms.41.1675264880047;
        Wed, 01 Feb 2023 07:21:20 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d64:a4e6:40a8:8e69])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c42d300b003dc53217e07sm1893120wme.16.2023.02.01.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:21:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/5] dt-bindings: arm: qcom: add the sa8775p-ride board
Date:   Wed,  1 Feb 2023 16:20:37 +0100
Message-Id: <20230201152038.203387-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201152038.203387-1-brgl@bgdev.pl>
References: <20230201152038.203387-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Document the sa8775p SoC and its reference board: sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 22553637c519..6709e64a4480 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -49,6 +49,7 @@ description: |
         qru1000
         sa8155p
         sa8540p
+        sa8775p
         sc7180
         sc7280
         sc8180x
@@ -89,6 +90,7 @@ description: |
         liquid
         mtp
         qrd
+        ride
         sbc
         x100
 
@@ -805,6 +807,11 @@ properties:
               - qcom,sa8540p-ride
           - const: qcom,sa8540p
 
+      - items:
+          - enum:
+              - qcom,sa8775p-ride
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - google,cheza
-- 
2.37.2

