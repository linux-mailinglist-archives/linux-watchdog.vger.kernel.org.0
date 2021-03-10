Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F7C3348C8
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Mar 2021 21:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhCJUVI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Mar 2021 15:21:08 -0500
Received: from z11.mailgun.us ([104.130.96.11]:17248 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231264AbhCJUUx (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Mar 2021 15:20:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615407653; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=dxtZkfJ5IYq7cEqVuScsgqcXnLuYpfjLDBXSw8+MHek=; b=vIL8LOb4zthXNBgBdJY8hXPXFaYQeRg/Ygau0677ND5TS8up2jBSTno585Ze46bsqsfsbkov
 tGNJuq8uQ/YdiQH/fH3VtwkBmR6zcBb1edoymgVjaeW6o+PMjUROCDJw9VKCvF+abroc9CYz
 nh+OeQQ6XZli5cyZPYgZcaH05v8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmNTk5OSIsICJsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60492a05d3a53bc38f144a70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 20:20:21
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14BF2C43465; Wed, 10 Mar 2021 20:20:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1C96C433C6;
        Wed, 10 Mar 2021 20:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1C96C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] watchdog: qcom: Move suspend/resume to suspend_late/resume_early
Date:   Thu, 11 Mar 2021 01:50:04 +0530
Message-Id: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

During suspend/resume usecases and tests, it is common to see issues
such as lockups either in suspend path or resume path because of the
bugs in the corresponding device driver pm handling code. In such cases,
it is important that watchdog is active to make sure that we either
receive a watchdog pretimeout notification or a bite causing reset
instead of a hang causing us to hard reset the machine.

There are good reasons as to why we need this because:

* We can have a watchdog pretimeout governor set to panic in which
  case we can have a backtrace which would help identify the issue
  with the particular driver and cause a normal reboot.

* Even in case where there is no pretimeout support, a watchdog
  bite is still useful because some firmware has debug support to dump
  CPU core context on watchdog bite for post-mortem analysis.

* One more usecase which comes to mind is of warm reboot. In case we
  hard reset the target, a cold reboot could be induced resulting in
  lose of ddr contents thereby losing all the debug info.

Currently, the watchdog pm callback just invokes the usual suspend
and resume callback which do not have any special ordering in the
sense that a watchdog can be suspended before the buggy device driver
suspend callback and watchdog resume can happen after the buggy device
driver resume callback. This would mean that the watchdog will not be
active when the buggy driver cause the lockups thereby hanging the
system. So to make sure this doesn't happen, move the watchdog pm to
use late/early system pm callbacks which will ensure that the watchdog
is suspended late and resumed early so that it can catch such issues.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/watchdog/qcom-wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index e38a87ffe5f5..0d2209c5eaca 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -329,7 +329,9 @@ static int __maybe_unused qcom_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(qcom_wdt_pm_ops, qcom_wdt_suspend, qcom_wdt_resume);
+static const struct dev_pm_ops qcom_wdt_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_wdt_suspend, qcom_wdt_resume)
+};
 
 static const struct of_device_id qcom_wdt_of_table[] = {
 	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

