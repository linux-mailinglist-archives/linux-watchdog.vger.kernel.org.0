Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE833651DC
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Apr 2021 07:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbhDTFoP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Apr 2021 01:44:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53373 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhDTFoO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Apr 2021 01:44:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618897424; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7LkHj0VTOUKK/UXJch10kxBz5vG6doxMUBx721m/62w=;
 b=Aq5Ddb826HHh+RNz3rYg9RjhvDylubp+mxwkiHs83193PLK5FXRLZDLWtLwNlA41W98MQkzN
 Jh3gN5vJyeieg5Pv+Sb/OZnuafTeo1NqFmLzE2Cuuyqhp/TsVTCe91+NzcrV4ZyTWJeD/C5S
 OEIPGlWxUGsWF/j0SzuAAz4Gf/0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmNTk5OSIsICJsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 607e69fd853c0a2c4692af76 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 05:43:25
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C0CCC4323A; Tue, 20 Apr 2021 05:43:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 41B6DC433F1;
        Tue, 20 Apr 2021 05:43:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Apr 2021 11:13:19 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: qcom: Move suspend/resume to
 suspend_late/resume_early
In-Reply-To: <20210310202327.GA237124@roeck-us.net>
References: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
 <20210310202327.GA237124@roeck-us.net>
Message-ID: <948130ae3a0781eb19b7431059852c23@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On 2021-03-11 01:53, Guenter Roeck wrote:
> On Thu, Mar 11, 2021 at 01:50:04AM +0530, Sai Prakash Ranjan wrote:
>> During suspend/resume usecases and tests, it is common to see issues
>> such as lockups either in suspend path or resume path because of the
>> bugs in the corresponding device driver pm handling code. In such 
>> cases,
>> it is important that watchdog is active to make sure that we either
>> receive a watchdog pretimeout notification or a bite causing reset
>> instead of a hang causing us to hard reset the machine.
>> 
>> There are good reasons as to why we need this because:
>> 
>> * We can have a watchdog pretimeout governor set to panic in which
>>   case we can have a backtrace which would help identify the issue
>>   with the particular driver and cause a normal reboot.
>> 
>> * Even in case where there is no pretimeout support, a watchdog
>>   bite is still useful because some firmware has debug support to dump
>>   CPU core context on watchdog bite for post-mortem analysis.
>> 
>> * One more usecase which comes to mind is of warm reboot. In case we
>>   hard reset the target, a cold reboot could be induced resulting in
>>   lose of ddr contents thereby losing all the debug info.
>> 
>> Currently, the watchdog pm callback just invokes the usual suspend
>> and resume callback which do not have any special ordering in the
>> sense that a watchdog can be suspended before the buggy device driver
>> suspend callback and watchdog resume can happen after the buggy device
>> driver resume callback. This would mean that the watchdog will not be
>> active when the buggy driver cause the lockups thereby hanging the
>> system. So to make sure this doesn't happen, move the watchdog pm to
>> use late/early system pm callbacks which will ensure that the watchdog
>> is suspended late and resumed early so that it can catch such issues.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 

Gentle Ping. I don't see this in linux-next or linux-watchdog, please 
let
me know if anything is pending from my side.

Thanks,
Sai

>> ---
>>  drivers/watchdog/qcom-wdt.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index e38a87ffe5f5..0d2209c5eaca 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -329,7 +329,9 @@ static int __maybe_unused qcom_wdt_resume(struct 
>> device *dev)
>>  	return 0;
>>  }
>> 
>> -static SIMPLE_DEV_PM_OPS(qcom_wdt_pm_ops, qcom_wdt_suspend, 
>> qcom_wdt_resume);
>> +static const struct dev_pm_ops qcom_wdt_pm_ops = {
>> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_wdt_suspend, qcom_wdt_resume)
>> +};
>> 
>>  static const struct of_device_id qcom_wdt_of_table[] = {
>>  	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
