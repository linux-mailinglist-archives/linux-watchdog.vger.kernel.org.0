Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77BD76B9561
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Mar 2023 14:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjCNNFi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Mar 2023 09:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjCNNFS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Mar 2023 09:05:18 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A7CAA730
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Mar 2023 06:01:38 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r11so10059449edd.5
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Mar 2023 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678798873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQYNV4JS9J59GL9ARq0SzSc6IYTv8e6Odhxu43xh8dM=;
        b=DXcgzCRG3ImbWERH1DYWvg5iQ4jLgKUFzroO+xvfuL5ZVzxxJcnrFQG2/lNFLH2ATR
         NvvduCgygH4POrFSTfzSgmVzSyA+WqK5WWEWcliIs2PF1y3pwD+4W+3wyekCvbcpiW0r
         OnXRoEDg3MEIPkAxYpYtErPPYnmlHF2C4zbqXVrBiR4u928jVigIOpeFxMA9wYUsDxOM
         Cy1n8af6a0xCBPyp29e3xLP951dJ0Y1YlQ8QaNRfPfbwnWuhmSNHFvs+A/upgZVciPPI
         pxGqa1WRqMaY1LECqTvYbhSV8K2jbDsEP7QirPhEJUNV6p+Tf6vDVM++EeUuTscXgPw6
         +ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQYNV4JS9J59GL9ARq0SzSc6IYTv8e6Odhxu43xh8dM=;
        b=T9uaoshh4vF5LeqNIGcU8DXpLgmyhh4dgn+Ex0d0YbN0RFCR8j70eo2/ZslSzTQpfH
         0305Rj55VtvmZBZusSDwco9SLthKey1mEaH71TJp7muGzF503vs8NGCYmny2Z1OTjH8p
         NYu+9B5StM2YJ3wsIyTOEJ13Uoi4XM7TfqGa/U3p4aOHTggDey6SUAmEuozKRb8ENZu7
         hbFDCMQ5ef6Ec8fWcJdfU4OIp2cj0vGe1cfTkyOxGhS3jOt9vZ5SuUew06rS/SsgTnts
         Y7UHrfswSZ5wsyLUW/COkHZhsA/ZiENonSbQyJJpJt2y1/ztpDIgDrHlMhqRvzM8G0sy
         wtfg==
X-Gm-Message-State: AO0yUKUl+shs/PgUJwpISSxZygcFHF8ComG0TDqqxZjWmQDcvMrfKaaF
        ElPORG7aqYpErHlUGPHfUFpuJ27leIAd27biHMs=
X-Google-Smtp-Source: AK7set/mIFSkFUi0R/m1jVrscAIJA30bZ0/Za28UAQk9sWPAr9Zdpre4fTc8I9Ct7+OhtZVjkPjGnA==
X-Received: by 2002:a2e:3a16:0:b0:295:b0a5:f66f with SMTP id h22-20020a2e3a16000000b00295b0a5f66fmr10286645lja.28.1678798397989;
        Tue, 14 Mar 2023 05:53:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s9-20020a19ad49000000b004dda74eccafsm395374lfd.68.2023.03.14.05.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:53:17 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:53:00 +0100
Subject: [PATCH 5/6] dt-bindings: usb: dwc3: Add QCM2290 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-topic-2290_compats-v1-5-47e26c3c0365@linaro.org>
References: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
In-Reply-To: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678798384; l=984;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6UMUh/04krKh/2VacWll/qoFcprxFJbKkd3m3SNGTZM=;
 b=/oaiLc0pXANHZhWzQ/BEVQSNywVPnQB31vN4WC+T8+P+ztrzZ8NNt0yoLTJ+2er1hnvbb21gkHWH
 kqGpBpdUDsPK0PfXwn5NMl/sBElXyHKHZwL7EtIQ0THs9nQTJV+Y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Document the QCM2290 DWC3 controller.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4875c5b7d5b5..a2aabdac4105 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
+          - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
           - qcom,sc7180-dwc3
           - qcom,sc7280-dwc3
@@ -300,6 +301,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcm2290-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
               - qcom,sm8150-dwc3

-- 
2.39.2

