Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B789420A5C7
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jun 2020 21:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403781AbgFYT3T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jun 2020 15:29:19 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23630 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405221AbgFYT3T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jun 2020 15:29:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593113359; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=pS8ssR3Zq6zNvmjEpPa5Dbnbgq7E+hJ95usQPKlO6uk=; b=XZWp0KNqXvgUA1gsBX5g6VVA1LitJqPcKhrToiREOdjVXtbPr6lkalEmga5pVf/nIqdRquOf
 0odRBJjSBH667MUaiwEAo97w3wEHACZm9b5jfcqI/qIg6JiWrkmdigViChZcvcbVphULgjXx
 M/iDEZFfu2DDCt8u7RX7CnUrOv0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmNTk5OSIsICJsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5ef4fb0efe1db4db892c8722 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 19:29:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABFA1C4339C; Thu, 25 Jun 2020 19:29:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4815C433C8;
        Thu, 25 Jun 2020 19:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4815C433C8
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
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [RESEND PATCHv3 0/2] Convert QCOM watchdog timer bindings to YAML
Date:   Fri, 26 Jun 2020 00:59:03 +0530
Message-Id: <cover.1593112534.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series converts QCOM watchdog timer bindings to YAML. Also
it adds the missing SoC-specific compatible for QCS404, SC7180,
SDM845 and SM8150 SoCs.

v1: https://lore.kernel.org/lkml/cover.1576211720.git.saiprakash.ranjan@codeaurora.org/
v2: https://lore.kernel.org/lkml/cover.1580570160.git.saiprakash.ranjan@codeaurora.org/

Resending this series with watchdog mailing list added.

Changes since v2:
 * Add missing compatibles to enum.

Changes since v1:
 As per Rob's suggestion:
  * Replaced oneOf+const with enum.
  * Removed timeout-sec and included watchdog.yaml.
  * Removed repeated use of const:qcom,kpss-wdt and made use of enum.

Sai Prakash Ranjan (2):
  dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
  dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845,
    SM8150

 .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 -----------
 .../bindings/watchdog/qcom-wdt.yaml           | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

