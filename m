Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9812D18407C
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Mar 2020 06:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCMF1N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Mar 2020 01:27:13 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53805 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgCMF1N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Mar 2020 01:27:13 -0400
Received: by mail-pj1-f66.google.com with SMTP id l36so3566428pjb.3;
        Thu, 12 Mar 2020 22:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gLleOVVIH1V4ng51RzCsvVcqilo8Qnn64XoABi5t8sI=;
        b=Nfv/t9lScGUJzQyLLwDN4KfRRcwbIjDjzCXdJJoF7OZ4cVAwhHJVcLMR6gUf7+bfJl
         XlHjHYVXFIrzINfAT80FFXOFqWiZ8Nz0QlxChpc1kIOB7XPasm2sgnO+7gatcWIMfn7/
         l4WpuUsELHNGj272Flu10BXp2VcbLddrz+zPuvCm+lQCb3ebYL30/zwBcnnmv9EahB5R
         iD/5szY5+YGS1xOJaTTgNNmGNfWOLoUB0Lt/wSED/bJqhHeJYA6hfGRMNQpMAX/svHwn
         JuDh8upfKSwiW0w6PSGnZ1GWHrIWZtgU+WfuPg9d82h/axv1DLp1drDF8OYbAVFRqlzU
         Df3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gLleOVVIH1V4ng51RzCsvVcqilo8Qnn64XoABi5t8sI=;
        b=MtQlo6+k5dM1Kl0usRdOIjRABnt6hRjVf//Ga3LqsQuSlm9wbPbcLbT+AOrOyNt7q2
         R6pUIpRfIhV+RTXivDI9WWPamnAsSGFJnoCUJws6mJ+iiLGSeUzfmkWcW4cuRXuMHWJL
         Q91uGjS2eBFYM+uLVG3S4ouHowyJaUerqh5GfpeJx6zkm4VF9guPwIxn7wM2prUq7hpZ
         ecTQWdBL4nG1J+0UUJUGZG1Ufs8iiGHP/N13FRlC6wD4ISWjYMOy5Dmw4wTJ8PYAAANQ
         AP4Ojp+1erl5aiVaIY4hPCdpbwd5Uo79gWG2thNCgpeo11N+aAwUO7ji2Yf1xLh1L/wF
         bivQ==
X-Gm-Message-State: ANhLgQ2Dc8kC6llNpxN6ma3MP6GsXYpgIyDi0nAR84WcM0xoIHhlGTRR
        0xb/bcc4mi44F7Tfuh1HlZtslMHM
X-Google-Smtp-Source: ADFU+vuF/uyCroH964x3emJVaVrqPgtwjQpRBMY6p+hOkhStOd55ElhfdsOpHGJRGqbWOT/64VGVCQ==
X-Received: by 2002:a17:902:aa88:: with SMTP id d8mr11371971plr.201.1584077230174;
        Thu, 12 Mar 2020 22:27:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x6sm55904813pfi.83.2020.03.12.22.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 22:27:09 -0700 (PDT)
Subject: Re: [PATCH] watchdog: orion: use 0 for unset heartbeat
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200313031312.1485-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5d58b64d-e053-9f7f-49fe-682dc87fe817@roeck-us.net>
Date:   Thu, 12 Mar 2020 22:27:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313031312.1485-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/12/20 8:13 PM, Chris Packham wrote:
> If the heartbeat module param is not specified we would get an error
> message
> 
>   watchdog: f1020300.watchdog: driver supplied timeout (4294967295) out of range
>   watchdog: f1020300.watchdog: falling back to default timeout (171)
> 
> This is because we were initialising heartbeat to -1. By removing the
> initialisation (thus letting the C run time initialise it to 0) we
> silence the warning message and the default timeout is still used.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Good catch.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/orion_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 8e6dfe76f9c9..4ddb4ea2e4a3 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -52,7 +52,7 @@
>  #define WDT_A370_RATIO		(1 << WDT_A370_RATIO_SHIFT)
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
> -static int heartbeat = -1;		/* module parameter (seconds) */
> +static int heartbeat;		/* module parameter (seconds) */
>  
>  struct orion_watchdog;
>  
> 

