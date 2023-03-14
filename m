Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C186B958C
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Mar 2023 14:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjCNNIl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Mar 2023 09:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbjCNNIX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Mar 2023 09:08:23 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F3FA42D6
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Mar 2023 06:05:02 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id h8so17956949ede.8
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Mar 2023 06:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678799092;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8MiNq49jj5N76vOjmnLvIQjHj4KSRTiJUui/5+4fP1s=;
        b=IbvyX0qRSUW4czSwxSYadtNGs42/0jSWKYAq5gu030uwmvMUK2Ly5tHQUg/h0r9Ev+
         qHKg8QQi2gb986MBS3Wmp1Ct/WYqdl3ZKLejCzJRkgtjgLw1+yf2pSH4bvOmv4/Q2Kn8
         5x5uRlzEbzfT8NDYuVp5xyjsf6H0EaJ3/rluSbSy376FfCw6Xalq2GCCrcxadt9VV08A
         virdQukK/tundG/YXCKWZBdO7ERtt+XNiYLNkfbCvGPrnRW+YgHkQLVBtH9WrEBNqQCT
         HvvGBCVhRGWeUpqaRKVN+PBu3MnNasa+NQMgk0uKOY+wh9GLwO9+cL27qEmIf02dgRjz
         YMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678799092;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MiNq49jj5N76vOjmnLvIQjHj4KSRTiJUui/5+4fP1s=;
        b=nKIGKZ5eIDUysRwFzOAWg22AtGesKpZ0W7+MzcQfNqeiNSo7AmdUwRW9O0i9/9EjK4
         kmv6LrtMqLaBV46McPECEC8TNA2a8/mDZv5fRSa+fXxTVHMU+7PZDubBBbbxQkfpbDzw
         jYSmNn8g/P8iukNy+vlZmkyUQ9wOP6uzL5FlRV3sO/kV2/PgLK87rAcKL4gC+IQzEJsp
         oRRq4I+8ltXQN3rP6q372VO6tiys+iyLgkM/gD2wJlq7ksliPLQIPS5S6c9UzJousvV2
         2K2hNtDU01sq6s9LpN8LuthnriHEQTJXPDmYluYLisFinmy15rArR06ybxAcbWvrYEKd
         hhjg==
X-Gm-Message-State: AO0yUKVZ8MF71QAP1Jbql6/VTmMvwsgrHDZMhijmSqqQSNiVosYX6aM6
        YEafsk7A09A7+KRtIgstvn9NG/xAm7g37fwF6zc=
X-Google-Smtp-Source: AK7set8VKJrgRZQmRB5O8ZRHtIgj6S97HoqVRdvQ+bdeVt0+Ot8plS+62FwVZz74fIgpHE6Yl4Y7XA==
X-Received: by 2002:ac2:4354:0:b0:4cc:73ff:579a with SMTP id o20-20020ac24354000000b004cc73ff579amr609441lfl.38.1678798386805;
        Tue, 14 Mar 2023 05:53:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s9-20020a19ad49000000b004dda74eccafsm395374lfd.68.2023.03.14.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:53:06 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/6] QCM2290 compatibles
Date:   Tue, 14 Mar 2023 13:52:55 +0100
Message-Id: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACduEGQC/x2N0QrCMAwAf2Xk2UDXqTB/RUTSmLnAbEszRRj7d
 4OPd3DcBiZNxeDSbdDko6YlO/SHDnim/BTUhzPEEIcw9EdcS1XGGMdw5/KqtBqekvB4pkkkBfA
 wkQmmRplnT/N7WVzWJpN+/6frbd9/94JWunkAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678798384; l=1135;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IVVr6i/KawvLqgguv8RbQtO5KAqHsyGmBYNRJ1zL87s=;
 b=W0b4hLXBOA8niOLA8fKdilzR5RN4jcIicLpxxMuwCxGKwdtorkzQeCG0KRkBUbfGtPhGN+20WiF1
 9tOrl1oNDvSI33bPrrkLp5i9LoYhpz7RyDAT9iAeJDJncuAa08eM
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

Document a couple of compatibles for IPs found on the QCM2290 that don't
require any specific driver changes

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (6):
      dt-bindings: watchdog: qcom-wdt: add QCM2290
      dt-bindings: dmaengine: qcom: gpi: Add QCM2290 GPI DMA
      dt-bindings: nvmem: Add compatible for QCM2290
      dt-bindings: mmc: sdhci-msm: Document QCM2290 SDHCI
      dt-bindings: usb: dwc3: Add QCM2290 compatible
      dt-bindings: thermal: tsens: Add QCM2290

 Documentation/devicetree/bindings/dma/qcom,gpi.yaml       | 1 +
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml      | 1 +
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml  | 1 +
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 2 ++
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml  | 1 +
 6 files changed, 7 insertions(+)
---
base-commit: ec0fa9a0a6fac454745c930bdb8619d0a354bac9
change-id: 20230314-topic-2290_compats-5bec96afeeb0

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

