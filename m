Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D56047227B
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Dec 2021 09:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhLMI1M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Dec 2021 03:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhLMI1M (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Dec 2021 03:27:12 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9738CC06173F
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Dec 2021 00:27:11 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id r25so48907943edq.7
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Dec 2021 00:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9qNVJJUEkc7Dcqq+w3jXBP/JOAXOW45KnRjiowBHvGk=;
        b=lGsG+RSK6fKMObsJQ7Iti5lpYgJ6YDHFJh2yVwO4XuHD8dveHSTYe/H5vctCR3EceI
         XqKuogxu2fO0A5lqmYqIOpALu/ZAlwyN5MpiGyuxrhGT4dFdyWMvGpLMx8bvZsddP9hp
         uygNMnJ/yqA/HLuo9RxL3P+UaNjwUw8FVJxoH5ME1qus3y9LosZQt6MPD+Go9ivr+x+I
         5NBCzSlBofWA0sfijE46EUYppcRu4UKN9UbgQuwQlhr8/MVWSyaIoK6EGtTLTPMvbQQ1
         YS5aqS6H4kpadwXpvOh44y1zf//CCrxgItwxZNG/CI17aEzqwFI/8ITqQJIsV4zBY6wg
         c6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9qNVJJUEkc7Dcqq+w3jXBP/JOAXOW45KnRjiowBHvGk=;
        b=ANLVpdz+aMJHQRmMcLYnbGt6y2ZKxmnXY1O85gFwH1/PKX/QSPdeArpCn3wMeHGxTC
         v/Kmg334vi1tRnyPIujX/pd7fdWCqD+sj/01oz2deK0Rth8lzJeXIBa0eM2BtJ2Zxqwk
         QX+tp3VWYiY83Q96vowjMlMHZUGEVb7P8dJ4yvpo5jiccuyGe9jPh1lWJt7m88D84t2l
         TneOgSW+8mmG4TvvUcRg2kKRs/CqNB5+/0wQoY5Egq8ppFgongJlAzPcMF5wXhHjpmla
         1OPzN+Bo4dKcEkr2t/bIi9KNf8rjb7GBzn91KD3yu4zkU1iV5CoNI36cLV2eN8Zn07p1
         6JBA==
X-Gm-Message-State: AOAM532T2Zg09JiG56JiAQNcg8SaxcpuV6+sMJnSlIAhQuL9DdHJQqRL
        wUnMjNIfLm/2b4szH+/ViOSgLw==
X-Google-Smtp-Source: ABdhPJzJQzH9IbD0iKwzxP+OhiHo4OBp+NQ23YW0riJPC6Agdl1/DHF8upIV5V9+Kb8bNnWCgPyEyg==
X-Received: by 2002:a17:907:608f:: with SMTP id ht15mr41645248ejc.300.1639384030231;
        Mon, 13 Dec 2021 00:27:10 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:09 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Amit Kucheria <amitk@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Rob Herring <robh@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 00/10] dt-binding patches for sm6350
Date:   Mon, 13 Dec 2021 09:26:01 +0100
Message-Id: <20211213082614.22651-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series adds compatibles to the dt-bindings documentation where it
was missed before.

Finally, the last patch solves some further dtbs_check errors by
modifying the sm6350.dtsi to match the binding docs more closely.

Please note, that the first patch from Konrad is a resend that wasn't
picked up when sent to the lists in August 2021.

Konrad Dybcio (1):
  dt-bindings: arm: msm: Add LLCC for SM6350

Luca Weiss (9):
  dt-bindings: firmware: scm: Add SM6350 compatible
  dt-bindings: qcom,pdc: Add SM6350 compatible
  dt-bindings: phy: qcom,qusb2: Add SM6350 compatible
  dt-bindings: thermal: tsens: Add SM6350 compatible
  dt-bindings: usb: qcom,dwc3: Add SM6350 compatible
  dt-bindings: watchdog: Add SM6350 and SM8250 compatible
  dt-bindings: arm: msm: Don't mark LLCC interrupt as required
  dt-bindings: simple-framebuffer: allow standalone compatible
  arm64: dts: qcom: sm6350: Fix validation errors

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml   |  2 +-
 .../bindings/display/simple-framebuffer.yaml     | 12 +++++++-----
 .../devicetree/bindings/firmware/qcom,scm.txt    |  1 +
 .../bindings/interrupt-controller/qcom,pdc.txt   |  5 +++--
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml  |  1 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml       |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml   |  2 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi             | 16 ++++++++--------
 9 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.34.1

