Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8D020A5D1
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jun 2020 21:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406329AbgFYT3d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jun 2020 15:29:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16963 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406335AbgFYT3d (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jun 2020 15:29:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593113372; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bZEXLpiFS2CTcQQYib0XcL0ZOSWmr7D6wUi6jTv1x9A=; b=PGbVQJ0VtYaiwn09VzQml6yG0ElWRYA/HLf6vvAgRlWc0gpHzvgKUwDDtsuqo5lROfTQWLr6
 NoRAOdTIiy3FbMTnnaO5OIkukYPnGrVbRGf8LWpmDSMoaYRwl+QCAhvI+/Kg+NPXUsB/RTaz
 ZaezJ1V8H++d7f8gD2+qgWs0m7A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmNTk5OSIsICJsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5ef4fb1bfe1db4db892ca91d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 19:29:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65246C43395; Thu, 25 Jun 2020 19:29:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5F9BC433CA;
        Thu, 25 Jun 2020 19:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5F9BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCHv3 2/2] dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845, SM8150
Date:   Fri, 26 Jun 2020 00:59:05 +0530
Message-Id: <09da1ba319dc4a27ef4e4e177e67e68f1cb4f35b.1593112534.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1593112534.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1593112534.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add missing compatible for watchdog timer on QCS404,
SC7180, SDM845 and SM8150 SoCs.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 5448cc537a03..0709ddf0b6a5 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -15,6 +15,10 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,apss-wdt-qcs404
+      - qcom,apss-wdt-sc7180
+      - qcom,apss-wdt-sdm845
+      - qcom,apss-wdt-sm8150
       - qcom,kpss-timer
       - qcom,kpss-wdt
       - qcom,kpss-wdt-apq8064
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

