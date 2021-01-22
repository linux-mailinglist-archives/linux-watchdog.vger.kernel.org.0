Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D341130053B
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 15:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbhAVOWx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 09:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbhAVOWm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 09:22:42 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D68C06174A;
        Fri, 22 Jan 2021 06:22:02 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id k8so5176604otr.8;
        Fri, 22 Jan 2021 06:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dE5eeABbsl9hoYyeXHJw9dTzbdaMxoVlvnITbTCl6Vg=;
        b=sW5mi6DwxsKlgOpEA+BR+j9OUULLa9UEls+lEDf1fdLPuwrRPzDiZb9JXPUoj67b+n
         6toaI/AVZOzngjEteTJixlnY8EvCzMJ/ep+BhSfBMYIzp6RPKftO2XEES2K5ixtwroR7
         uExtbvH97tNf5kY8C3i0dEGXZ3rwV0LHfL4abiYPF5BUzXWjkaQxw8vz7ta6jXzBEXpw
         2bPFxvME2oWvxhz3FFxMaZxRk/m2YwMGSkSurMMobxNvDyN5mc9EsdCU2C6yweHlUNwf
         MyNYWERCIZ6mxQLMx5XubW4RR1PFK2BYaX4HUT1Yp/7X8CG/N8qcUwU5+ACK28A1qdxj
         e7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dE5eeABbsl9hoYyeXHJw9dTzbdaMxoVlvnITbTCl6Vg=;
        b=NIOnrs4FtNB1ypwm3qDgWJp2Mcmry6D65Cpry9lDQAXi4FRJNhtEi+Ae/JlFKnKGEN
         ugKj2uEtIa5gxN9EcnV8NftwOnKtfmJWd4OFn9MXucHBYYH+6F32tzA6Y6WWX7IpHB+m
         wxxwOcJXQk9itY5gdg1wN6EV1aMTxYZ1YBGpNXJXaUCpzYEDM4N4iMlQSIPdMAgNadOi
         3vOhT7BB/lC7EtVgKQEq4rpQZVXIo9aa6PALkpb3zMr+htHgu12uhErcylKIDvBpnmPu
         1O/uP5/Np6QkarIwzf7X1ldf0TEgapNel9bPee+mW9vnXuJ8eXylWh5A+G1WpSj8IEzL
         M/MQ==
X-Gm-Message-State: AOAM530tEXeSvuTIM87g6Zw9d/5ZMJDQ4tcttPQmGYO8Ye1Y7RAHz7Qg
        lCPZkk87NuMFCSPf5kiVA78=
X-Google-Smtp-Source: ABdhPJyeei9v5OqtdFEMSqhpcw9t6Qd1FeFBwKUV0/E/Ugzi3qj3swsAvivR6SVBIw1T/4WlWq5RbA==
X-Received: by 2002:a05:6830:350:: with SMTP id h16mr452245ote.130.1611325321557;
        Fri, 22 Jan 2021 06:22:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n1sm1024058oog.31.2021.01.22.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 06:22:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 4/5] platform/x86: intel_scu_wdt: Drop SCU notification
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <20210122123201.40935-4-andriy.shevchenko@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c0ab2b21-7907-92a8-04f3-0afe7dd38387@roeck-us.net>
Date:   Fri, 22 Jan 2021 06:21:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122123201.40935-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/22/21 4:32 AM, Andy Shevchenko wrote:
> Since SCU code along with the Intel MID watchdog driver has been refactored
> in a way that latter will be probed only after the former has been come
> to live, the notification code is bogus and not needed. Remove it for good.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/platform/x86/intel_scu_wdt.c | 31 +++++++---------------------
>  1 file changed, 7 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
> index 227218a8f98e..19f7686a3c19 100644
> --- a/drivers/platform/x86/intel_scu_wdt.c
> +++ b/drivers/platform/x86/intel_scu_wdt.c
> @@ -12,7 +12,6 @@
>  #include <linux/platform_data/intel-mid_wdt.h>
>  
>  #include <asm/intel-mid.h>
> -#include <asm/intel_scu_ipc.h>
>  #include <asm/io_apic.h>
>  #include <asm/hw_irq.h>
>  
> @@ -49,34 +48,18 @@ static struct intel_mid_wdt_pdata tangier_pdata = {
>  	.probe = tangier_probe,
>  };
>  
> -static int wdt_scu_status_change(struct notifier_block *nb,
> -				 unsigned long code, void *data)
> -{
> -	if (code == SCU_DOWN) {
> -		platform_device_unregister(&wdt_dev);
> -		return 0;
> -	}
> -
> -	return platform_device_register(&wdt_dev);
> -}
> -
> -static struct notifier_block wdt_scu_notifier = {
> -	.notifier_call	= wdt_scu_status_change,
> -};
> -
>  static int __init register_mid_wdt(void)
>  {
>  	if (intel_mid_identify_cpu() != INTEL_MID_CPU_CHIP_TANGIER)
>  		return -ENODEV;
>  
>  	wdt_dev.dev.platform_data = &tangier_pdata;
> -
> -	/*
> -	 * We need to be sure that the SCU IPC is ready before watchdog device
> -	 * can be registered:
> -	 */
> -	intel_scu_notifier_add(&wdt_scu_notifier);
> -
> -	return 0;
> +	return platform_device_register(&wdt_dev);
>  }
>  arch_initcall(register_mid_wdt);
> +
> +static void __exit unregister_mid_wdt(void)
> +{
> +	platform_device_unregister(&wdt_dev);
> +}
> +__exitcall(unregister_mid_wdt);
> 

