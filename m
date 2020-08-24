Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900A624FECF
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Aug 2020 15:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgHXN3E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Aug 2020 09:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgHXN3C (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Aug 2020 09:29:02 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABB4C061573;
        Mon, 24 Aug 2020 06:29:02 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v16so4239395plo.1;
        Mon, 24 Aug 2020 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hEnRIpFiLehmtAlZxH3jRvSO84NH8KzXJDVQTp6vxi8=;
        b=kKgf5ZTDJKjwOXM1i8vDvjDrl8G2nbdB0h+cDxf+AvvTGdBYqX3hP7NWhEjp5BEH3/
         o2QYiRj3FP8x4KjgUoh1e5fetQwNiNidM/f1vFDWHPdJcIG0tY0n35PYTaNt3kahfJmP
         6STTXFHhkpLfPi5JM5YCf+bvKgLmOjuHePya5yy66RhDxKX0DTj0jRyLmG72arTcqbL/
         wagDepaDVpkRdYaUH1R6Ji+7nmJpmOj4Ia0Rk8L+8G5MN8yIvyYOpvY0nnXeIdwcYYIK
         V60v1jaRO5afJT09SNt/+cka+5wA2tdRmhJtwhW7P865nKioH+g3tBJEwHjVzJRWKpEX
         hqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hEnRIpFiLehmtAlZxH3jRvSO84NH8KzXJDVQTp6vxi8=;
        b=jJ9+0w7U58HP2KzVtdH4HahyoUE+2Y11xLu+lUHtmjghi3fW8D1TX3VcNApFI9b9Bl
         QveHjwTgDTM+sZyea9zx/SRQN9YKEH1Ryecq7OlqxIIQIcFXy//5gOOrW5PboiEpGq0q
         45vdEc+syJfU/12+ZNIhRpX4QAFucCjam0UgodUHyFKGLjcPeqxbuOgVyMbewKIgJmlY
         O7nEXG0aFHbHb2MhbeEWt6bpkBkNTbgQaLfGJ/NDkoy/uvOvdTAH0iCUnZj2HCR0J/7/
         O2P9H+fZb5ttfAZv7xJ3QgfHNqR3IehAAQZ0IbJE7d2Nqgfz1ntAJxF5bZug7UJ36Zni
         +0bg==
X-Gm-Message-State: AOAM532EppEt2nEGma4FnLKsuJda7ZqT4tip3+v1JRm9Vm+ZIJXxbQ7W
        SjLFvZbJE0qRD/Ygc86MdRYzDn8yGGk=
X-Google-Smtp-Source: ABdhPJzzW9M+tAlcbQ5RodOPkUTg1f0UuTNIISj06WmmXC3qdDs5fmTylFJSJ/tFaO/61dANiwbpGw==
X-Received: by 2002:a17:90a:8687:: with SMTP id p7mr4845167pjn.50.1598275741476;
        Mon, 24 Aug 2020 06:29:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o38sm9557867pgb.38.2020.08.24.06.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 06:29:00 -0700 (PDT)
Subject: Re: [PATCH] watchdog: sbsa_gwdt: add shutdown hook to driver
To:     Qiang Zhao <qiang.zhao@nxp.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200824081804.23206-1-qiang.zhao@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <cdfd0c4d-3433-f952-0e49-ebc0f7474e1a@roeck-us.net>
Date:   Mon, 24 Aug 2020 06:28:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824081804.23206-1-qiang.zhao@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/24/20 1:18 AM, Qiang Zhao wrote:
> From: Zhao Qiang <qiang.zhao@nxp.com>
> 
> Kexec maybe need more time than timeout of wdt(sbsa)
> which will reset the system.
> So it is necessary to add shutdown hook to disable the
> wdt when run kexec.
> 

Please explain why watchdog_stop_on_reboot() does not work.

Thanks,
Guenter

> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
>  drivers/watchdog/sbsa_gwdt.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index f0f1e3b..bbcd04d 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -313,6 +313,14 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void sbsa_gwdt_shutdown(struct platform_device *pdev)
> +{
> +	struct sbsa_gwdt *gwdt;
> +
> +	gwdt = platform_get_drvdata(pdev);
> +	sbsa_gwdt_stop(&gwdt->wdd);
> +}
> +
>  /* Disable watchdog if it is active during suspend */
>  static int __maybe_unused sbsa_gwdt_suspend(struct device *dev)
>  {
> @@ -357,6 +365,7 @@ static struct platform_driver sbsa_gwdt_driver = {
>  		.pm = &sbsa_gwdt_pm_ops,
>  		.of_match_table = sbsa_gwdt_of_match,
>  	},
> +	.shutdown = sbsa_gwdt_shutdown,
>  	.probe = sbsa_gwdt_probe,
>  	.id_table = sbsa_gwdt_pdev_match,
>  };
> 

