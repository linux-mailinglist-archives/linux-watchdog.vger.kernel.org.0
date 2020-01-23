Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B84DD146AF3
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2020 15:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgAWOPn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jan 2020 09:15:43 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52918 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgAWOPn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jan 2020 09:15:43 -0500
Received: by mail-pj1-f65.google.com with SMTP id a6so1271898pjh.2
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Jan 2020 06:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BUxRlGduW20wNt60pBx0kiQP8cXDs6h2P10W60vpjl8=;
        b=cXDLgL9lhYYVAwA68056tX/55Q1Y0knV0QLMNkZRNW5WBAcbOFl+JWQnTRR/8C4ZrN
         DMP4dF0y8c9g8+xwu9O6biDxbA8ealOAW7nTbLMxltN9OfoUy6N83oKNphdTC0UAp4i2
         8Fhfihtkbj/xN2mVtdDdslZRZKuQnE6mCOZuGjlydZhKv0hskYAdqN0+m8T6AprVoU7X
         M11EuACrPWP+9MlhPuM3UM8NQuUv2/FzKZCCtC49JM/T2LqtlPmjc16rJBgfHWYpPtzV
         +ADxQWbswbUrzLKGsyNj5O0PbdkptRgvqiVdyoT45Qn+/sdWrmZvqK3SDcaBou3O3sy0
         +r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BUxRlGduW20wNt60pBx0kiQP8cXDs6h2P10W60vpjl8=;
        b=SImgeg2TbXLApAYW3YSf4uy8x6eRX/HHjezBlgo1ee+CAXqZ1SrGPTzxF+GJOVBVUz
         NNzPbAtZrINKhQ7CVAWf9on9jovPM3JAVgru2ON3n0Lzn3HTMZN5KWNWKu/yXpRqhfO5
         QDUCTe2alNGmmgsSwanC0AxQz2lQJaZHkn3lWXDOlNPQTN01JOVu0q56UQeiEH5lrGZS
         ndj2NoBJsrkU5qNAk40wo141N8tEEC6F25SzDxI0aPytvejDEnWaMDysvxItb4gqucd4
         8NFnO3kFJVqsR/C0Q9Fy2S4hhtomSupu6njN6e5XlvNPsj8gLePsVNnOHJ6KqIfc14hX
         pCfA==
X-Gm-Message-State: APjAAAUG7g7IUeLuvzOR1ET6klNxusVBsBgf7EfiRKRImkU22ga0F1GI
        IKveIeTlYFouxhVra5QeIRxaBlci
X-Google-Smtp-Source: APXvYqyAz+uw1h/yu7zT/jzG7gUExrBHeKyPe7AsezyqJA0gUCegbIuhBzhyj53EOVZEa98f46S0rw==
X-Received: by 2002:a17:90b:4004:: with SMTP id ie4mr4753913pjb.49.1579788942487;
        Thu, 23 Jan 2020 06:15:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c184sm3021429pfa.39.2020.01.23.06.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 06:15:41 -0800 (PST)
Subject: Re: [PATCH] watchdog: it87_wdt: add IT8786 ID
To:     Vincent Prince <vincent.prince.fr@gmail.com>,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
References: <20200123140544.25937-1-vincent.prince.fr@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <212ba9bd-33f5-d09a-e020-39df3fcc4b4a@roeck-us.net>
Date:   Thu, 23 Jan 2020 06:15:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200123140544.25937-1-vincent.prince.fr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/23/20 6:05 AM, Vincent Prince wrote:
> From: Vincent Prince <Vincent.PRINCE.fr@gmail.com>
> 
> IT8786 watchdog works as in IT872x
> 
> Tested on VECOW ECS-9000 board.
> 
> Signed-off-by: Vincent Prince <Vincent.PRINCE.fr@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/it87_wdt.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index a4b71ebc8cab..f3bf3ea50e39 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -67,6 +67,7 @@
>   #define IT8726_ID	0x8726	/* the data sheet suggest wrongly 0x8716 */
>   #define IT8728_ID	0x8728
>   #define IT8783_ID	0x8783
> +#define IT8786_ID	0x8786
>   
>   /* GPIO Configuration Registers LDN=0x07 */
>   #define WDTCTRL		0x71
> @@ -294,6 +295,7 @@ static int __init it87_wdt_init(void)
>   	case IT8721_ID:
>   	case IT8728_ID:
>   	case IT8783_ID:
> +	case IT8786_ID:
>   		max_units = 65535;
>   		break;
>   	case IT8705_ID:
> 

