Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1348142AD9
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Jun 2019 17:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405336AbfFLPYO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Jun 2019 11:24:14 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39218 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727967AbfFLPYO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Jun 2019 11:24:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id j2so9866033pfe.6;
        Wed, 12 Jun 2019 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fj8w7JFwxSiJmuLmJTCqCfMeiQ/Z4xIXLViQMCuR7R8=;
        b=BueqaEpqE3yTy8qRAlT1y+RnLGUPcAfbZ9U8bwaVmBNE8GA58uNSFoDwn5ZbqCJbX0
         dhX/kgshtQdziUqhbWq22zptY56mz9uS5anM+Rn/VXWeqjHrFhNzy/wnwxQ/pG67aHyU
         tcXvwqgFhx/q0Gp6TAzEfmL+bj5yBzm1bqEjJpqOnIwJTGpQBiXBJLocPKX96O+RRpgP
         ypgQVGAe753s05t2Pqka0ytbu0xKxS9J6ARXTnYHrEgoDiioqolJ5qf6G59h+4HGU8Zc
         YyeF+lZ7kdW6IsLrvH/DS4vt0vjxN/To3DkR4P4jPsxpgtXdH8TA99gYLsHjKC4GJ35p
         WyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fj8w7JFwxSiJmuLmJTCqCfMeiQ/Z4xIXLViQMCuR7R8=;
        b=SJNHZEpB0vbNs4KiCRt1N45C6rysaXgW3SV6bT4unOQ9OXTOEPu+Gm5lKvQv3zwx5J
         C9RLSrK+Uqr02kktpF+pFX/MaA9Iw+WZjTbIFMAdXYbKlv2X+4NgPcbAO483LgdeoHLx
         YrPD02UUFCEQUTvrDR7VhoP/LArwpLs3uZNc3a7A+nkxM1S4sieqeV1HNdR01dtX+JvF
         ++DXvNj2467z/Z6ACu9+WdVhrySjuFZ3/r3csPxuGUD5kul3MDfIkw3tYm+3wfGylOBY
         VHLxwJB18Qp9oXj7aRdM7UriNy0O5n59aJZt+8MqaW5EHyDBhLoEZJyni/wF6uRnyyVp
         J+ig==
X-Gm-Message-State: APjAAAXauOR7nNY9v6uTa4hV1Jr1OUrTuOZ/fi6hrZyg7JLvEkS1m7FY
        IYRPdDeXR7xhyWE5BecYXh8wK1T6
X-Google-Smtp-Source: APXvYqwKlVFqfb3mgwvUK2av74PQnxpr/vAe172n2dcNuwwZhDxNLFcfKnU0R2L+6vNbVlyJyRB2gw==
X-Received: by 2002:a63:4d08:: with SMTP id a8mr9743550pgb.329.1560353053032;
        Wed, 12 Jun 2019 08:24:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z3sm223990pjn.16.2019.06.12.08.24.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 08:24:11 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
To:     Ken Sloat <KSloat@aampglobal.com>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>
Cc:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190612150154.16778-1-ksloat@aampglobal.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8af0794a-327d-7144-609f-0c56422e92ec@roeck-us.net>
Date:   Wed, 12 Jun 2019 08:24:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612150154.16778-1-ksloat@aampglobal.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/12/19 8:02 AM, Ken Sloat wrote:
> From: Ken Sloat <ksloat@aampglobal.com>
> 
> Currently, the atmel-sama5d4-wdt continues to run after system suspend.
> Unless the system resumes within the watchdog timeout period so the
> userspace can kick it, the system will be reset. This change disables
> the watchdog on suspend if it is active and re-enables on resume. These
> actions occur during the late and early phases of suspend and resume
> respectively to minimize chances where a lock could occur while the
> watchdog is disabled.
> 
> Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
> ---
>   drivers/watchdog/sama5d4_wdt.c | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 111695223aae..84eb4db23993 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -280,6 +280,18 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>   MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
>   
>   #ifdef CONFIG_PM_SLEEP
> +static int sama5d4_wdt_suspend_late(struct device *dev)
> +{
> +	struct sama5d4_wdt *wdt;
> +
> +	wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
>   static int sama5d4_wdt_resume(struct device *dev)
>   {
>   	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
> @@ -293,10 +305,25 @@ static int sama5d4_wdt_resume(struct device *dev)
>   
>   	return 0;
>   }
> +
> +static int sama5d4_wdt_resume_early(struct device *dev)
> +{
> +	struct sama5d4_wdt *wdt;
> +
> +	wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_start(&wdt->wdd);
> +
> +	return 0;
> +}
>   #endif
>   
> -static SIMPLE_DEV_PM_OPS(sama5d4_wdt_pm_ops, NULL,
> -			 sama5d4_wdt_resume);
> +static const struct dev_pm_ops sama5d4_wdt_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, sama5d4_wdt_resume)
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(sama5d4_wdt_suspend_late,
> +			sama5d4_wdt_resume_early)

I don't think you need both sama5d4_wdt_resume()
and sama5d4_wdt_resume_early().

Guenter

> +};
>   
>   static struct platform_driver sama5d4_wdt_driver = {
>   	.probe		= sama5d4_wdt_probe,
> 

