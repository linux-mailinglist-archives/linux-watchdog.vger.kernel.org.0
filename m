Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19098673855
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jan 2023 13:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjASM0h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 19 Jan 2023 07:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjASM0f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 19 Jan 2023 07:26:35 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE2230F6
        for <linux-watchdog@vger.kernel.org>; Thu, 19 Jan 2023 04:26:34 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id g205so1349261pfb.6
        for <linux-watchdog@vger.kernel.org>; Thu, 19 Jan 2023 04:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDcqyjghTTsahWm0LBhul5ie8C0XQVKH9Pe7ZUs3gig=;
        b=U/+dhNQ+UQUiGl4Lt85t3/bIygZpPid2qCbBmYqGG74iEmbzM9oKbp2oQtPC6Zgut7
         FlkEl+maiJcGTQlqKWnRs7ubMuIURqxLOGpYYlDMcPjS9LzpdU+4nRgUA98iDOKV9kZw
         3nxX5xLyqAsEyaiFT34mxoIMTjINabAoxg29ZUehMJ1Ogu8T1S9tNqBoq2QodAoXgD9D
         lwMlgTlcMat/M/cY81xQF07e0qOPnJWapgbuX7OOMM7r/ry8bthWXFa3jLHpUoBB/QUy
         NnHlCImCG2CwRUWMRs5zcvQSIOMZlrV+yrV414OQ5Eg5nWy9W6zPaMqfhlSUyxKzpkjS
         5CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDcqyjghTTsahWm0LBhul5ie8C0XQVKH9Pe7ZUs3gig=;
        b=iEvShQLLgiDZZIHdbsBVFVVLRqnXygCBfd3NLjYHJh7ovAXcuBU1Lsd8NYLgdgpkEr
         AC2tEatTf2yVGvtLK/uww7e1NGkOsKKoD9YbiMa3rO+hAKUV+z9U1bJLTADBls1T35pw
         bXauGtIP9s+C5HHSYsauoYEyF8j1cfp0TMWlbeuJ1OODNhGoqrLUxnD3V1wZyr2N0NMq
         iKfRpgQuJdcRyrUjpuq0+kYc+vqhsPZ864SqxqCLau6kTbwrl07N/0AH0BP05XL15uJK
         cITtYBkXXmC6MyMjhtZ9p/JSiHN9pGoie1UG054e3gmdJO/p6yY+sPkJHnAwAwkq5+Tb
         FxEQ==
X-Gm-Message-State: AFqh2kqhIyzMywU+mK+cI1pwtlufFGkWr4uJSGHu/KsEJoNLZktevaY7
        f4+Z/8btBT3dELYU8UktgRe2nKu5TTVmewPI
X-Google-Smtp-Source: AMrXdXsc7aIvXEW4swSuW5UKOD4yxA1yGEY95GZqC4fwHFSnJ1HaWcgSiiU/+uezq9F8ZeCr0fOOrQ==
X-Received: by 2002:a62:1884:0:b0:58b:c7f8:623c with SMTP id 126-20020a621884000000b0058bc7f8623cmr9387997pfy.27.1674131193593;
        Thu, 19 Jan 2023 04:26:33 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c60:63d3:2d69:9f71:187e:f085])
        by smtp.gmail.com with ESMTPSA id b28-20020aa7951c000000b0056bcb102e7bsm9707344pfp.68.2023.01.19.04.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 04:26:32 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, agross@kernel.org, andersson@kernel.org,
        saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH] dt-bindings: watchdog: Add binding for Qualcomm SM6115
Date:   Thu, 19 Jan 2023 17:56:19 +0530
Message-Id: <20230119122619.1020908-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add devicetree binding for watchdog present on Qualcomm
SM6115 SoC.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index d8ac0be36e6c..b1785777b8c4 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,apss-wdt-sdm845
               - qcom,apss-wdt-sdx55
               - qcom,apss-wdt-sdx65
+              - qcom,apss-wdt-sm6115
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
-- 
2.38.1

