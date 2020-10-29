Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CFE29EE4E
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 15:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbgJ2Obc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 10:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgJ2Obc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 10:31:32 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000DAC0613CF;
        Thu, 29 Oct 2020 07:31:31 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b3so2497136pfo.2;
        Thu, 29 Oct 2020 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zRncE1X7mePBiM0SYCp+vTaN/KpzBsiKiLmub/YURAE=;
        b=SEf94aX0Mj5GFY5YDSKNwqE/utvYYlY/Lb7HeosZov2jgxv2gQHB3CTbmBjqvDh592
         TfKaw21L/d/A4cNZgXQjvtwNmYmoklQKHcLt8b1xhhUrKV+oSUInq9YfpNCgm7ltbHRz
         c87BygMqgwe6068Xf37nzDlWqPRApME11A4xrSLGoyHZOpCmPkOPM5VNtNOKJILCs7m+
         fWV543LE9gjRQ1eVzJrGtvwkNk2RvTvL7vjHQasLFaRo7MfXvrfMsoPSiXuchWzD3i7z
         XjSfFWTwgj57agC4nOh+kf2sSKtXFzqBAxJ78VyXs5lMt3sZnPjDyyZX4pVqF3cQBCiX
         gqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zRncE1X7mePBiM0SYCp+vTaN/KpzBsiKiLmub/YURAE=;
        b=typwhz8hXkYe4eU+BBp+ZsS6R0/RHwsOSeW4Rkhx+gciq07FF7IZsz0TqfmASUX+tx
         u9gC8UrCGiakkvhc6PGvRt/AEG2vdWL0R60HKDk3Gs/NyBqV5T/2quR3+pCCt3l8hQSm
         EdXOZvm2ywm8OGQE/C46CNIrQ8nvK03NvBEgiZ1np3Chnf6K7Tz9PRcTPA3vuMUnd0fG
         PeheWe3H7yAuXBhFQnxfpyirN2ur8fEPDoswGs4LzNrW4j2j9GQQqI0NxGeOLG+YWIDr
         XApfmlApYIdSJbSVv9FS5c1lKahzNrsrttfw/Jc9RxSuEt0AQACZYCvTXodBOLXZI0I4
         u0Ag==
X-Gm-Message-State: AOAM5338scLrJW8daoOcb5hQA9voWxasrw5vsS6ocaj21pMADGoIsRzI
        dmyvs9L5VTvJpMIz2h9vND7AN2wMwjVCt0id
X-Google-Smtp-Source: ABdhPJwRZiOQswCD21PzvvHuL4m3SzFzRUBfMy3SVA4VkKPRl2cgt7nvK7JiRme9qXLTj03tFUYJPw==
X-Received: by 2002:a17:90a:d082:: with SMTP id k2mr39078pju.195.1603981891636;
        Thu, 29 Oct 2020 07:31:31 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id hj11sm13685pjb.55.2020.10.29.07.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:31:31 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 29 Oct 2020 22:30:13 +0800
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Barry Song <baohua@kernel.org>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "moderated list:ARM/CSR SIRFPRIMA2 MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] watchdog: sirfsoc_wdt: remove unnecessary
 CONFIG_PM_SLEEP
Message-ID: <20201029143013.4y4am5z7tw65b43y@Rk>
References: <20201029075327.228570-1-coiby.xu@gmail.com>
 <20201029075327.228570-3-coiby.xu@gmail.com>
 <41e73435-375f-1865-69ce-462395476258@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <41e73435-375f-1865-69ce-462395476258@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 29, 2020 at 06:05:21AM -0700, Guenter Roeck wrote:
>On 10/29/20 12:53 AM, Coiby Xu wrote:
>> SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/watchdog/sirfsoc_wdt.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/sirfsoc_wdt.c b/drivers/watchdog/sirfsoc_wdt.c
>> index 734cf2966ecb..dc8341cd7d44 100644
>> --- a/drivers/watchdog/sirfsoc_wdt.c
>> +++ b/drivers/watchdog/sirfsoc_wdt.c
>> @@ -170,7 +170,6 @@ static int sirfsoc_wdt_probe(struct platform_device *pdev)
>>  	return 0;
>>  }
>>
>> -#ifdef	CONFIG_PM_SLEEP
>>  static int sirfsoc_wdt_suspend(struct device *dev)
>
>And again: __maybe_unused
>
>I would suggest to test compile the code with CONFIG_PM_SLEEP disabled.

I will test it before send v2! Thank you for the feedback!
>
>>  {
>>  	return 0;
>> @@ -189,7 +188,6 @@ static int sirfsoc_wdt_resume(struct device *dev)
>>
>>  	return 0;
>>  }
>> -#endif
>>
>>  static SIMPLE_DEV_PM_OPS(sirfsoc_wdt_pm_ops,
>>  		sirfsoc_wdt_suspend, sirfsoc_wdt_resume);
>>
>

--
Best regards,
Coiby
