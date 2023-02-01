Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7A2686A07
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Feb 2023 16:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjBAPV3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Feb 2023 10:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbjBAPV0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Feb 2023 10:21:26 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9AE6A4A
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Feb 2023 07:21:18 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1730146wms.4
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Feb 2023 07:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgMf41rQRnpfSO16TfNaM4asZfPKKcxkyDK6JrIdSHY=;
        b=sDPbCH9a4tYZ3zR1ztISMGXawM4AYviJBCRH2M6rJ7ItisZXeupM27wcGx4h6QeM2p
         iadobtP3AEeQ+i/s9IfOgoA3XIq7eQ8s36/TgeCs+Z+dl5ra+Hm8iFEHiGTOmV1zHpT4
         gUVHmQLJwJX1K7ccAdxQ3eFfjdqI+/RYYNeDjv1iOZYO0MJ0AdZHWjyBGMYpFXMuqztG
         cTl8oWIBXNtwmkhDca7ULQBk52ey8ZA9kSWQKbdJ4FQU+madcAG1rLRLMThLS092OeVj
         cV6oKePdQHaVheQk+hXxu/PgCVl2qxbLS8/NuB1K4SHBGTd52W4AZJrnBUl/LkkyxbgM
         oSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgMf41rQRnpfSO16TfNaM4asZfPKKcxkyDK6JrIdSHY=;
        b=Vwk+bN45WKZJUNey2KnZHRiQd2ePNNJJsf6qf6qcMu27/7UGHRaNKp41Ct1XelZbWp
         U7/eg7JWQ9NEiq8PtyXzbI+BzM9kgq/w+FGQ1DzXGLgphBofHQL3P16sai+Kk6JCLFQx
         YXgWERMTIlMCk2cuHUyp8lIV/yoMoRDVwhr2eKvYTbZdOGpRYYAyWQCK46imTmTtRvG1
         RhVIRDOcdlZfikY/fGdcUK5jVDnGnMt5evwLL90g3xRbNfFs42NEIjjfFidhLN2B2Y6M
         FiuC6Fa+DyD3vVMmNbEEBHumTl3BKYdrHIx1TvMpc4Q3bLErQRoTVMUiuGW2cnuMLaX1
         5smQ==
X-Gm-Message-State: AO0yUKXxv/n8SOSGyNm4dIEB92x+syBy7tMfi0GFi/KsCtmuOuMwInxD
        6Hwurx/cu+V6CyMbCFdmUhkJzA==
X-Google-Smtp-Source: AK7set+Q9T4oseeyWKQwBg/d9CJwoFikCw5pS4/g+6Uwd+rTCHgqsRDJB+0/f8qxAcFJw/RUeB8jLw==
X-Received: by 2002:a05:600c:3b0f:b0:3de:1d31:1048 with SMTP id m15-20020a05600c3b0f00b003de1d311048mr2328769wms.29.1675264877062;
        Wed, 01 Feb 2023 07:21:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d64:a4e6:40a8:8e69])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c42d300b003dc53217e07sm1893120wme.16.2023.02.01.07.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:21:16 -0800 (PST)
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
Subject: [PATCH v3 1/5] dt-bindings: firmware: qcom,scm: add qcom,scm-sa8775p compatible
Date:   Wed,  1 Feb 2023 16:20:34 +0100
Message-Id: <20230201152038.203387-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201152038.203387-1-brgl@bgdev.pl>
References: <20230201152038.203387-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a compatible for the sa8775p platform's Secure Channel Manager
firmware interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 4193492ba73e..fd3c787e44a8 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,scm-msm8996
           - qcom,scm-msm8998
           - qcom,scm-qdu1000
+          - qcom,scm-sa8775p
           - qcom,scm-sc7180
           - qcom,scm-sc7280
           - qcom,scm-sc8280xp
-- 
2.37.2

