Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4673A23F283
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 20:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgHGSIx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 14:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgHGSIw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 14:08:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30E9C061756;
        Fri,  7 Aug 2020 11:08:52 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d188so1431449pfd.2;
        Fri, 07 Aug 2020 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o9GfeplJEGWZE00SmFSw687oTtbpYxZHtEH+C525WsM=;
        b=U51uVC8UURDb54ath1YrC7mDCLpm/CjpQ8fUhrrfebCIli2aeodyWXi2PlqxJarsEX
         TQIqQ1fTZ4s+dlx2qwqEvBFLdUIiTqLQmNG0Lg7vXrEzNv9v8GtNob34vPZ/nI+0oV6t
         m4huIM+18HJTqEzHb5mZUjkcvHqSS0SiOeTKesdhdBXnT4IvhDxtgkyMXHxvyKftmKB5
         v5GGMyrBcHx5CNeM5hMDBeQcvtEZGidvGIFaNhf1aUH+ypjyjncrwIkSN+WJpGYAdo71
         +I+ZWAQPuhSf7NYprhlz42gR58I2igazxXO7brgp4PiUMiJY6BDK22Eamk3sblgtArpA
         jMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o9GfeplJEGWZE00SmFSw687oTtbpYxZHtEH+C525WsM=;
        b=BKQadCKoQmH90BvK1b6QO4iPHJ7RFUVhvmjhW9Hb5O6j0EncsIugLFdVm+3F2lW9M8
         WZ/KYnjHg8TjQEiVMVN7WcmPx7tKu6tV2BEEPwkYWTsinoeazCxnq5wWcpfhWo9jFEcg
         u7NzwMqNnzdgXtjShgIy3zLPvzi5Qu/N9hBMPivafUy+1MvrYSIqZU80Q9goK16q29JX
         IlNpKMocyn8LhyeugrDRWzRCY2bHuXhUnj/tg/18H+K4ubR+BtP0sYWLq5lUJWxVKEsj
         8lkVgUQgVlIALLXhXT5C95wVrTnTIsGecIfCfikFEWVvauPafr0IBIpO0lNQjrOlZ+8Z
         LFhQ==
X-Gm-Message-State: AOAM5318BC6Z+4NE3ykUJrsoDSxsvaSisMMlZXeFBdsnVnsniSlDenT4
        FVOCHdlC7uNZ3N9H6jV0aj0=
X-Google-Smtp-Source: ABdhPJwVv8qm+UbX4+y4I9aSasEizsLVsVTWOw9GfQYTGRnWyeAzRCbvcsPDG6WoMeKE4RbIE5gHAg==
X-Received: by 2002:a63:541e:: with SMTP id i30mr12922269pgb.47.1596823732168;
        Fri, 07 Aug 2020 11:08:52 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id f43sm4106367pjg.35.2020.08.07.11.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 11:08:51 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
To:     Guenter Roeck <linux@roeck-us.net>, madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
Date:   Fri, 7 Aug 2020 11:08:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807162141.GA41980@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/7/2020 9:21 AM, Guenter Roeck wrote:
> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>
>> In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>> after misc_register(), hence if ioctl is called before its
>> initialization which can call rdc321x_wdt_start() function,
>> it will see an uninitialized value of rdc321x_wdt_device.queue,
>> hence initialize it before misc_register().
>> Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>> function called from write callback, thus initialize it before
>> misc_register().
>>
>> Found by Linux Driver Verification project (linuxtesting.org).
>>
>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Having said that ... this is yet another potentially obsolete driver.
> You are really wasting your (and, fwiw, my) time.
> 
> Florian, any thoughts if support for this chip can/should be deprecated
> or even removed ?

I am still using my rdc321x-based SoC, so no, this is not obsolete as
far as I am concerned, time permitting, modernizing the driver is on my
TODO after checking/fixing the Ethernet driver first.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
