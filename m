Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1FE29EC6E
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 14:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgJ2NFY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 09:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgJ2NFY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 09:05:24 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3D5C0613CF;
        Thu, 29 Oct 2020 06:05:23 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id x1so3048523oic.13;
        Thu, 29 Oct 2020 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9iXsLjZgUfdA09GLMwB0swDJcMnTzFt7AU3m46lf4t4=;
        b=myYl8XFK6amQDTqj2VrTBoh+OvJUi+sIIwEKannjHGdG1cU6WtV0YIdTnjQP+mAe3S
         SBvbI3WwQDA2U50xBHqRfDFs1rXIxKE7ZIVFGJRTy4BDKhMz7YAFsNTIN5tf0RqLyYid
         ennK8RLLngOf6UHTQ8UuxCLK308pQQMdF2M0fSD0E/wsuqvx4nUHAg3n9KHeZ73ZNaG3
         PEX7p9r5TmhvUb1GYBLmiTRJC2PI9dS0QN6pZ2s5bEsOGHy1ZozZ3hOHzzAXVg6eslJh
         IAt/jRZ7ZCva66wiTOzO04g2iCqIpI1ELEzbA1s877sfsiODSmgcJrZUv0jZAcjDVMO6
         FsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9iXsLjZgUfdA09GLMwB0swDJcMnTzFt7AU3m46lf4t4=;
        b=kaivjJIBXZhVs65ZrLhV2ujfSl/BXnTWQ8w7roz21esM72PZqN4PyEZ71stemxcszK
         0vAIIUanjkG57UmJV1nXz6wkMOmzkupo3KX7PSVqmqgN7t8BCdgg04uDaqChMzKqyBGW
         q0KuVFDFZkYMhxq++x0gHImsc9kpTvseEw9tvtUO/14bJNhWuEEMEPgt7iIAf8aj85EB
         gts/5nn1qEWg7jEeMo1WCRGWuH3aW+xyuIyiswAK67C2Ixc2Yos8NK7BfvlWzTLg8vtZ
         u4HE1rcVdOsXa7FEZ2pZiXhnykQkw5lm444OFSkHxYWdpaCR4NgPJK0y2SVOOmStSscv
         xhGQ==
X-Gm-Message-State: AOAM531/joMPoaQ/TUqvnL+YhB/urt8LOYK8z8DG7hRNSqbti5ixlaxH
        3Xos5DeO6UgEarthnlaVQQhIqYmuJVE=
X-Google-Smtp-Source: ABdhPJwnDgXS+Qak/0GSaQu2DMn1nzM/MOQzw9czr7h6J4u7Oj84WPksoga2qlRh+6RcmhsF2W8ywg==
X-Received: by 2002:aca:6501:: with SMTP id m1mr2720909oim.124.1603976723124;
        Thu, 29 Oct 2020 06:05:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u7sm565978otg.60.2020.10.29.06.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 06:05:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] watchdog: sirfsoc_wdt: remove unnecessary
 CONFIG_PM_SLEEP
To:     Coiby Xu <coiby.xu@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Barry Song <baohua@kernel.org>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "moderated list:ARM/CSR SIRFPRIMA2 MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20201029075327.228570-1-coiby.xu@gmail.com>
 <20201029075327.228570-3-coiby.xu@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <41e73435-375f-1865-69ce-462395476258@roeck-us.net>
Date:   Thu, 29 Oct 2020 06:05:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029075327.228570-3-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/29/20 12:53 AM, Coiby Xu wrote:
> SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/watchdog/sirfsoc_wdt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sirfsoc_wdt.c b/drivers/watchdog/sirfsoc_wdt.c
> index 734cf2966ecb..dc8341cd7d44 100644
> --- a/drivers/watchdog/sirfsoc_wdt.c
> +++ b/drivers/watchdog/sirfsoc_wdt.c
> @@ -170,7 +170,6 @@ static int sirfsoc_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef	CONFIG_PM_SLEEP
>  static int sirfsoc_wdt_suspend(struct device *dev)

And again: __maybe_unused

I would suggest to test compile the code with CONFIG_PM_SLEEP disabled.

>  {
>  	return 0;
> @@ -189,7 +188,6 @@ static int sirfsoc_wdt_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static SIMPLE_DEV_PM_OPS(sirfsoc_wdt_pm_ops,
>  		sirfsoc_wdt_suspend, sirfsoc_wdt_resume);
> 

