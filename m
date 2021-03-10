Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5823348D9
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Mar 2021 21:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhCJUXv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Mar 2021 15:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbhCJUXb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Mar 2021 15:23:31 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABE3C061574;
        Wed, 10 Mar 2021 12:23:31 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id q130so1610113oif.13;
        Wed, 10 Mar 2021 12:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vm9XUUppL8awfY6TqwCU4Ztl76kZr7dZVqDbSCfoZBY=;
        b=K/USteWKzYPi2Omxz47yeC+3vTraxCrIdPrXnFadaRkmP8b8oRLHmwhakEmkV6OCov
         5wp+cdqzhhRys3HR23jbU0XRHg2dhANmlUC4vj7RHB7N0mncCs4z/2wpmbMUKoLcF0F6
         9GyRLwbYJIfazI0TaxQuNeJjaBeSGqZZ2oP1Un3Jd3xM3NLEhpt+YYpwMdOrZMt36IHZ
         q3iFDSVHnXdAVxdPAebDbmaBqOj3Mta01lBFLaJVK+4VF5dNGz4OcvYMRUNy1xH/MLlA
         JtEO5sIabItDztaVeSZJIBkwt9Qzwkaa1UaAbvkjXv6rLNPNqOzON01Vdh1TsTTwjb3d
         5HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vm9XUUppL8awfY6TqwCU4Ztl76kZr7dZVqDbSCfoZBY=;
        b=QYW1iibu9B9n/OvPWjy78brgXt/dUCKC9NaagEeikImNHSXKVHZmzVI6TeLghTyiDP
         ubW/WAW73ey5l7QNNFHWuV2jvTR0KeGtzGIwZ7G/6drPM6fQ70GB8t4mXBP9w2hJeuM3
         7I8pzQAl541fNNGcq3Z88cP6x1rQJ4zXPGGZEokTARDngSGvj93V5ygP9AEO/MtS/m8s
         LdVZxvaEyCZZ2bY/8NDbZBlPN7+l1BWrF0RJBYIbMufwIK6yZA9UjBvSbUuhwyOzcjt0
         OF3qU3bYxJ6EfjTP1+rgLsi0ckZvJ1CBFLAMv8XehZlQLkPxco4UhVfUIPw7RCYv3bJc
         82NQ==
X-Gm-Message-State: AOAM532nmq8tujaU1+Oi31XyKeNFSY3MF+h0Z+9ju+8WM7pC+IypL/3W
        NejsdAqmfcDrSchzuu40lgU=
X-Google-Smtp-Source: ABdhPJwPd35TGu9N7pw8fk3DDKtasC4jlo33D9P2tKXWhXlmS4dB344eohQD7mTsv1bHLprFjoApSg==
X-Received: by 2002:aca:741:: with SMTP id 62mr3548334oih.104.1615407810962;
        Wed, 10 Mar 2021 12:23:30 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f197sm73222oob.38.2021.03.10.12.23.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 12:23:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 10 Mar 2021 12:23:27 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] watchdog: qcom: Move suspend/resume to
 suspend_late/resume_early
Message-ID: <20210310202327.GA237124@roeck-us.net>
References: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 11, 2021 at 01:50:04AM +0530, Sai Prakash Ranjan wrote:
> During suspend/resume usecases and tests, it is common to see issues
> such as lockups either in suspend path or resume path because of the
> bugs in the corresponding device driver pm handling code. In such cases,
> it is important that watchdog is active to make sure that we either
> receive a watchdog pretimeout notification or a bite causing reset
> instead of a hang causing us to hard reset the machine.
> 
> There are good reasons as to why we need this because:
> 
> * We can have a watchdog pretimeout governor set to panic in which
>   case we can have a backtrace which would help identify the issue
>   with the particular driver and cause a normal reboot.
> 
> * Even in case where there is no pretimeout support, a watchdog
>   bite is still useful because some firmware has debug support to dump
>   CPU core context on watchdog bite for post-mortem analysis.
> 
> * One more usecase which comes to mind is of warm reboot. In case we
>   hard reset the target, a cold reboot could be induced resulting in
>   lose of ddr contents thereby losing all the debug info.
> 
> Currently, the watchdog pm callback just invokes the usual suspend
> and resume callback which do not have any special ordering in the
> sense that a watchdog can be suspended before the buggy device driver
> suspend callback and watchdog resume can happen after the buggy device
> driver resume callback. This would mean that the watchdog will not be
> active when the buggy driver cause the lockups thereby hanging the
> system. So to make sure this doesn't happen, move the watchdog pm to
> use late/early system pm callbacks which will ensure that the watchdog
> is suspended late and resumed early so that it can catch such issues.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/qcom-wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index e38a87ffe5f5..0d2209c5eaca 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -329,7 +329,9 @@ static int __maybe_unused qcom_wdt_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(qcom_wdt_pm_ops, qcom_wdt_suspend, qcom_wdt_resume);
> +static const struct dev_pm_ops qcom_wdt_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_wdt_suspend, qcom_wdt_resume)
> +};
>  
>  static const struct of_device_id qcom_wdt_of_table[] = {
>  	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
