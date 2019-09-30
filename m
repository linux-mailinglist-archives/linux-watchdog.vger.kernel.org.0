Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F32C2191
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2019 15:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbfI3NNg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Sep 2019 09:13:36 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39153 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3NNg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Sep 2019 09:13:36 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so5598668pff.6;
        Mon, 30 Sep 2019 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pVqHd88otrSSyzUhdPAR49J1f4QIfMdZze38ZYfnGJs=;
        b=KkzqKB2rnVFlsdLNa7dSs41MXFDLgv37IlpcfV2jnGpqNTYANx7+RcupnhBb/KhzHP
         XUP5vxLdQHf/gBy6AnKwD3TP19AWnADwCBPYbG7Qjf/wbwMPInUm+HmfObCavMtthrPi
         sRL1QjPy38FuGN0KyxFYPmv1AMinVWfjmoM4PGupv33amM1ZxKhDVkPSmcrNrytgwPvK
         iHfr3kWKpGnC2qUq53mOYChj1aDxuO1mF68Wo7xQjbZDlG1wT2W1JfZci/HX13HGXfKH
         cmW+pUQUHtItBS40eVqNnfzKgKfXlt5lbUQ4T8o/Feq6dr1B/sZNQhYGZPvuKyWgh4Yt
         jOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pVqHd88otrSSyzUhdPAR49J1f4QIfMdZze38ZYfnGJs=;
        b=NVinWrHij0ZBb19wyP4yPnqw33IlKRgwwAGtL0vCNPdKumE2YF57uHsLj464aaSl2g
         yhBdJG8lqm580Kz+v1o2UO2hglo0EgekLNPyBmpg8nKd4Wz9acpYaGGsE6VLSoK8dwQS
         wBmFY0okZ5q8ywXNIk0dZCPm92arwSlRF38y8Pv7zi/A2gVwRtgWCclCHrLZxkCUPGME
         pgn2oc//A42iu4E5MPhA/vlNFLmD2UHZ71zW+34AzjyEpsIo9hAcJBxstTqZc1h2nG3a
         2vsyTYGltFgonQBPUXO/C7HWryxHYEvcpWsa5bxDjQs3Zi9j3GjulTl1hgJmJF0jmBD0
         2OOQ==
X-Gm-Message-State: APjAAAVIJYOpy7PiXQcYpgQdwu7o+HtcXEoITUASQX3Gvx/7P9g9m5oZ
        ce9Z52jNaTR3YCPS6QkdzScGctby
X-Google-Smtp-Source: APXvYqwdRxFKPM0Pz0zgUmoVNsKMD68FJTXMT+xPN89Q1GzC8MAh8LTX/FnyJOJKEKYuwPUxtC2ZCQ==
X-Received: by 2002:a17:90a:fb91:: with SMTP id cp17mr26999130pjb.51.1569849215014;
        Mon, 30 Sep 2019 06:13:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q204sm12830664pfc.11.2019.09.30.06.13.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 06:13:34 -0700 (PDT)
Subject: Re: [PATCH] watchdog/sbc7240_wdt: Fix yet another
 -Wimplicit-fallthrough warning
To:     Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20190929114649.22740-1-bp@alien8.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <17098752-cdbf-00f8-b578-22c56ae85c59@roeck-us.net>
Date:   Mon, 30 Sep 2019 06:13:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190929114649.22740-1-bp@alien8.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/29/19 4:46 AM, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> ... by moving the fall through comment outside of the code block so that
> gcc sees it.
> 
> No functional changes.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/sbc7240_wdt.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sbc7240_wdt.c b/drivers/watchdog/sbc7240_wdt.c
> index 12cdee7d5069..90d67e6d8e8b 100644
> --- a/drivers/watchdog/sbc7240_wdt.c
> +++ b/drivers/watchdog/sbc7240_wdt.c
> @@ -194,9 +194,8 @@ static long fop_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   
>   		if (wdt_set_timeout(new_timeout))
>   			return -EINVAL;
> -
> -		/* Fall through */
>   	}
> +	/* Fall through */
>   	case WDIOC_GETTIMEOUT:
>   		return put_user(timeout, (int __user *)arg);
>   	default:
> 

