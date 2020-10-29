Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F7D29EECE
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 15:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgJ2OwW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 10:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgJ2OwV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 10:52:21 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30C9C0613CF;
        Thu, 29 Oct 2020 07:52:21 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o3so2513146pgr.11;
        Thu, 29 Oct 2020 07:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2G8CnpKK6+67EHQVBPTyrPyoBH8LLNozBap+IfDR+/o=;
        b=IQGt3DMqLz87CRtjaOJ3TYh0QcvAvvIO46cUV9KhLMh3/qSf7/tFSRI60AUwmYXLeZ
         WG0IGeBo4eeLUsdVnIOpePLH3IpiRaKnWJCxULwvL4KdcPJm0V+lloRoFopU6Zwf+bC1
         7KIH+E2xIiQrdx79KvqbkzwfauX+qy4txaYVbyoc36oEDBv15pP1k1fiJeVKiT+1rEEr
         rMm2UFFI94mznG2KaqnfYzTkss4j2ly9lqT1o2YZr/17Ny6hdz+eI/7C6yEIlrwlw0+K
         HeXBw4nLwIZL0/bPBpvsBrKMV2/a0LjhxnQuP73+egDjETnzJJgieOWAeD7DK627uEP7
         /aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2G8CnpKK6+67EHQVBPTyrPyoBH8LLNozBap+IfDR+/o=;
        b=lodKfYKnbUuOkzqqSPu452FMr0K/5r/gvSHa5UY31yaISTyF+NYCntjlGyPS9PZba0
         MxQAfkIzVYmKoJkWuBSVlUG94zn0cWParHyc1I4Nf0GeqXyyd393i15GH1BdyDrs23JK
         nncvezYawk5mYtXj+iIi8DzX0vSHreihcb7Mv9f5zWLuXprubEIkDZxzOqK/LHGEtiew
         pk8Oyy+SxToqa+JC4mUZ2DQJT5X42RJOzjRWWPM+LmskH9uYcvRo0ek49l3Y33f4s8hX
         4sjBo2qj0eHqIB62XkxdRVLxEg94gyABjK6RvSeEa8vbg75vvMK+fbgLurMGsW8SeAOp
         u0rg==
X-Gm-Message-State: AOAM5313HxqR3MVuRGnI2IZIHDb1wwL9w+7T9UIo4GqeUqy1L8G2VaGA
        fme1ycUVW0DNrKhRU26QqcLKi/mHoSUyeK+W
X-Google-Smtp-Source: ABdhPJzkdCx+zFAyXHmjcMjnibIFzQfqXhRKV02REe1Sovb7PWKVfzdFmIZEtUCrxyi24Z9Cz73xKw==
X-Received: by 2002:aa7:9f0b:0:b029:160:1145:f0d1 with SMTP id g11-20020aa79f0b0000b02901601145f0d1mr4657065pfr.56.1603983141419;
        Thu, 29 Oct 2020 07:52:21 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id t13sm3270702pfc.1.2020.10.29.07.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:52:20 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 29 Oct 2020 22:51:55 +0800
To:     Patrice CHOTARD <patrice.chotard@st.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "moderated list:ARM/STI ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] watchdog: st_lpc_wdt: remove unnecessary
 CONFIG_PM_SLEEP
Message-ID: <20201029145155.7ihr3nfjuuufao4d@Rk>
References: <20201029075327.228570-1-coiby.xu@gmail.com>
 <20201029075327.228570-2-coiby.xu@gmail.com>
 <23c07a77-2ce3-1ebd-c8d7-001cd896f157@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <23c07a77-2ce3-1ebd-c8d7-001cd896f157@st.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 29, 2020 at 07:58:30AM +0000, Patrice CHOTARD wrote:
>Hi Coiby
>
>On 10/29/20 8:53 AM, Coiby Xu wrote:
>> SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/watchdog/st_lpc_wdt.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
>> index 14ab6559c748..c1428d63dc9e 100644
>> --- a/drivers/watchdog/st_lpc_wdt.c
>> +++ b/drivers/watchdog/st_lpc_wdt.c
>> @@ -248,7 +248,6 @@ static int st_wdog_remove(struct platform_device *pdev)
>>  	return 0;
>>  }
>>
>> -#ifdef CONFIG_PM_SLEEP
>>  static int st_wdog_suspend(struct device *dev)
>>  {
>>  	struct st_wdog *st_wdog = watchdog_get_drvdata(&st_wdog_dev);
>> @@ -285,7 +284,6 @@ static int st_wdog_resume(struct device *dev)
>>
>>  	return 0;
>>  }
>> -#endif
>>
>>  static SIMPLE_DEV_PM_OPS(st_wdog_pm_ops,
>>  			 st_wdog_suspend,
>
>Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
Thank you for reviewing the patch and giving the credit despite
the compiling issue with CONFIG_PM_SLEEP disabled as pointed by
Guenter and others:)

>Thanks
>
>Patrice

--
Best regards,
Coiby
