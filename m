Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0762C29FD00
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Oct 2020 06:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgJ3FWx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Oct 2020 01:22:53 -0400
Received: from z5.mailgun.us ([104.130.96.5]:20523 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgJ3FWx (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Oct 2020 01:22:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604035355; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TnWAZdBttXycLF7Pg/ea+orhZ9ZprM5LnpXC0r6qX6s=;
 b=uqn0ZNr06HWoZAjTY7dRRm5J+dOBS/GHPMM5YMp2I8r/PdxMD5iqAOxlbB24NTiAGwD/haMr
 GTvczn2nFWhsJzzHeoqFIKUJXd6IOWQV31uKUWywcrDF3N/Elq2LvlTdlufgILsSXh7bUnkm
 DLlCB/itkSgejQPogAaynXv14/w=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJmNTk5OSIsICJsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f9ba2d68335df1657b8ab90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 05:21:26
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E077C433C6; Fri, 30 Oct 2020 05:21:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F015EC433F0;
        Fri, 30 Oct 2020 05:21:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Oct 2020 10:51:24 +0530
From:   kathirav@codeaurora.org
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Luka Perkov <luka.perkov@sartura.hr>" <kathirav@codeaurora.org>
Subject: Re: [PATCH v2] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when
 appropriate
In-Reply-To: <20201028114635.7570-1-robert.marko@sartura.hr>
References: <20201028114635.7570-1-robert.marko@sartura.hr>
Message-ID: <2f0653b7d05d1ef26f6624b38d1d7b2d@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2020-10-28 17:16, Robert Marko wrote:
> If the watchdog hardware is enabled/running during boot, e.g.
> due to a boot loader configuring it, we must tell the
> watchdog framework about this fact so that it can ping the
> watchdog until userspace opens the device and takes over
> control.
> 
> Do so using the WDOG_HW_RUNNING flag that exists for exactly
> that use-case.
> 
> Given the watchdog driver core doesn't know what timeout was
> originally set by whoever started the watchdog (boot loader),
> we make sure to update the timeout in the hardware according
> to what the watchdog core thinks it is.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
> Changes in v2:
> * Correct authorship
> 
>  drivers/watchdog/qcom-wdt.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index ab7465d186fd..28c93a918e38 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -152,6 +152,13 @@ static int qcom_wdt_restart(struct
> watchdog_device *wdd, unsigned long action,
>  	return 0;
>  }
> 
> +static int qcom_wdt_is_running(struct watchdog_device *wdd)
> +{
> +	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
> +
> +	return (readl(wdt_addr(wdt, WDT_EN)) & 1);

QCOM_WDT_ENABLE macro can be used instead of 1?

> +}
> +
>  static const struct watchdog_ops qcom_wdt_ops = {
>  	.start		= qcom_wdt_start,
>  	.stop		= qcom_wdt_stop,
> @@ -294,6 +301,21 @@ static int qcom_wdt_probe(struct platform_device 
> *pdev)
>  	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
>  	watchdog_init_timeout(&wdt->wdd, 0, dev);
> 
> +	if (qcom_wdt_is_running(&wdt->wdd)) {
> +		/*
> +		 * Make sure to apply timeout from watchdog core, taking
> +		 * the prescaler of this driver here into account (the
> +		 * boot loader might be using a different prescaler).
> +		 *
> +		 * To avoid spurious resets because of different scaling,
> +		 * we first disable the watchdog, set the new prescaler
> +		 * and timeout, and then re-enable the watchdog.
> +		 */
> +		qcom_wdt_stop(&wdt->wdd);

qcom_wdt_start disables the WDT, configure the timeout values and 
enables it. Do we still need to call qcom_wdt_stop?

> +		qcom_wdt_start(&wdt->wdd);
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> +	}
> +
>  	ret = devm_watchdog_register_device(dev, &wdt->wdd);
>  	if (ret)
>  		return ret;
