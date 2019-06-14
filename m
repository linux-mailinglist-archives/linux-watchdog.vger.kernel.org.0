Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60272464D9
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2019 18:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfFNQqM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Jun 2019 12:46:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38206 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfFNQqM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Jun 2019 12:46:12 -0400
Received: by mail-pl1-f193.google.com with SMTP id f97so1251479plb.5;
        Fri, 14 Jun 2019 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z0Q8djqHX6ZMfWsK/PWD8i+5lV9BAONQ6vZFum0/x6M=;
        b=nuer/AobPoxP8KxkPKIEp1Pi4bj1OThodc7YnaduLgelE+l0GQKCmRr/yADUxqFazs
         0MRyGpcxmigz70ZivLMmBCV6QlSBJG62YKtUaJBR8SPq1dyA6a9S3vHpY4ZWGeJYGahV
         SS9P7gw0joJ2q1FzO3NgGsPLKXcAHByLH0zCm5nfIj1mLtB28XB2dbZoU/iV1QEx0dDr
         byc+3Eu0tePDzDCYi/ymYIFFeWVsn+r5y1rCOS/cZeAlHm6EVrf0Qx5PD1ZsePldomuX
         QaR1i58UD4J29VBGZOA03DeCsZWcJpMLKqJtBdYJqynWj5tVoSNODXu52nRsqYNPIjdW
         fg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=z0Q8djqHX6ZMfWsK/PWD8i+5lV9BAONQ6vZFum0/x6M=;
        b=nlnqebnGwFhCnaLNnwjYg/5z7Miw+/nqJr1I8fwRTiJ0EAXbIVRaAYayyy/1ZgOysT
         DAsLNUWI4RHQwdSii4fccps/xmjsdgZUW2DNfKotozrY4KCxyoUgcpe3bKygKpUamF9q
         cVhL3NH1LEfx+kj/VXIIlT5HeOW1BOlopKnM1SFWySi6DHGSajYw7KT/Ci3nZ5Fv/xyI
         U9+BlhbUxaXrfrgaCVt7titsBnX8pq2vJ2LBeQyZLAZmQbD6vs20Vk+pL1wDpocRVOTc
         bbu6NJihJUeanCMsedvxycfBfd4ZcJFisaN2t5scVuOjErPEpCPzM/jME0iS6+3/IjaJ
         ChOA==
X-Gm-Message-State: APjAAAVSDPz92uvWJg2w6vYCTbN+Dim9O8HxsF08mPein0f1NMW9s27s
        AFlQVNaP1X6z2ucn2tnWvic=
X-Google-Smtp-Source: APXvYqwz29BHb+7kecHv8rdqjLtchfGJlP2LhtF80HB0TpaLtUPO64PROcPKpcZVRwui3EO+D5ubyw==
X-Received: by 2002:a17:902:988b:: with SMTP id s11mr67503607plp.216.1560530771670;
        Fri, 14 Jun 2019 09:46:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 139sm3433474pfw.152.2019.06.14.09.46.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 09:46:10 -0700 (PDT)
Date:   Fri, 14 Jun 2019 09:46:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ken Sloat <KSloat@aampglobal.com>
Cc:     "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Message-ID: <20190614164609.GA29814@roeck-us.net>
References: <20190614125310.29458-1-ksloat@aampglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614125310.29458-1-ksloat@aampglobal.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 14, 2019 at 12:53:22PM +0000, Ken Sloat wrote:
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
>  Changes in v2:
>  -Consolidate resume and resume early statements.
> 
>  drivers/watchdog/sama5d4_wdt.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 111695223aae..0d123f8cbcc6 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -280,7 +280,17 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>  MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
>  
>  #ifdef CONFIG_PM_SLEEP
> -static int sama5d4_wdt_resume(struct device *dev)
> +static int sama5d4_wdt_suspend_late(struct device *dev)
> +{
> +	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int sama5d4_wdt_resume_early(struct device *dev)
>  {
>  	struct sama5d4_wdt *wdt = dev_get_drvdata(dev);
>  
> @@ -291,12 +301,17 @@ static int sama5d4_wdt_resume(struct device *dev)
>  	 */
>  	sama5d4_wdt_init(wdt);
>  
> +	if (watchdog_active(&wdt->wdd))
> +		sama5d4_wdt_start(&wdt->wdd);
> +

The call to sama5d4_wdt_init() above now explicitly stops the watchdog
even if we want to (re)start it. I think this would be better handled
with an else case here

	else
		sama5d4_wdt_stop(&wdt->wdd);

Guenter

>  	return 0;
>  }
>  #endif
>  
> -static SIMPLE_DEV_PM_OPS(sama5d4_wdt_pm_ops, NULL,
> -			 sama5d4_wdt_resume);
> +static const struct dev_pm_ops sama5d4_wdt_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(sama5d4_wdt_suspend_late,
> +			sama5d4_wdt_resume_early)
> +};
>  
>  static struct platform_driver sama5d4_wdt_driver = {
>  	.probe		= sama5d4_wdt_probe,
> -- 
> 2.17.1
> 
