Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B1013DE39
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 16:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgAPPEQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 10:04:16 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35002 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgAPPEP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 10:04:15 -0500
Received: by mail-pj1-f65.google.com with SMTP id s7so1718372pjc.0;
        Thu, 16 Jan 2020 07:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9aYYysUJc5O1GVrj/WJZfQ1VR8Kjol/FSsTxs8wt3Po=;
        b=su1RMBdpMgNolta0yRnwdr2hFM60rZ6K0CJP2l3ExFb8UekzOBhvGCYzWj9Zjive1a
         nfLfP7a5Idwr2vzP+5JMFW+5DuL2nIM5DcTIOpISxyXxKcxp9NHYUWr5gN+8SqzncaRX
         kXgHeczMUSmyhiZ68VneOltC1XFA0yrE8q6+yV0t1YK/otddH6p31jIWrZpT5QrXHAzQ
         4/DdQuxvEG5nw0nM2l7ngUvWroOh/lDta7eU+wWGbMDMRmXGdANBPFHWA48KMgStK/5b
         yzf9OugbebywJa+hFCX83ukPpdd58F5MuoVwmYR7IE5pO52aI0tQmHJcrOc8yBC+cluM
         GqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9aYYysUJc5O1GVrj/WJZfQ1VR8Kjol/FSsTxs8wt3Po=;
        b=SQDLKfnp7NTxnInRYCCfF8cY1tSeMoNGSDArdfdQ4tqsHaqnubqzqcwId5mz3dW+zH
         qQY5zGyDgDwtgqzIYMKN5juMmGEMLa5Mn+L/HJ+uT0nS7xAqTfv8y32IclG/5JO64Nqw
         sg6GHqhGukdcZBbfMTKtI/X19mqiVnPnMrJYKLaMQAk19CF0MXY4o5x5qS3qOi+TIwhx
         eiDwdZ9pR9+8Yi4pIdUNEjxv9zXXPHeC67pnP225G9vCkHTuLZTYBZ7kkRUN9pF2qvv1
         V1sxa+Rav1yv7+BPpC7hoOqTPVhbfLpMge1Ls/YCoTIG3fJv28yInltxmjNuXAz53wmD
         gRFw==
X-Gm-Message-State: APjAAAWdQqIeeS87jJE2dMImwl+DSXdV+ns2tBPVL7HCxlUVLfqqHtre
        hlNWqw8UHTjK5E9AJRxGIb4=
X-Google-Smtp-Source: APXvYqweT9duHvIwuiopBktIZ1DmoA3YPIEGyOxcRBNR8OotDJuab5tPjaSkV4tho7CtYEOjVqM+ew==
X-Received: by 2002:a17:902:bb83:: with SMTP id m3mr32964602pls.258.1579187055039;
        Thu, 16 Jan 2020 07:04:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g22sm24354714pgk.85.2020.01.16.07.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2020 07:04:14 -0800 (PST)
Subject: Re: [PATCH 2/9] watchdog: of_xilinx_wdt: Used BIT macro
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
References: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
 <1579181217-31127-3-git-send-email-srinivas.neeli@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3f904c30-32e2-914a-9545-9cd554b45bfe@roeck-us.net>
Date:   Thu, 16 Jan 2020 07:04:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579181217-31127-3-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/16/20 5:26 AM, Srinivas Neeli wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> Used BIT macro instead of mask value.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>   drivers/watchdog/of_xilinx_wdt.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 00549164b3d7..0d7df2370db7 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -24,12 +24,12 @@
>   #define XWT_TBR_OFFSET      0x8 /* Timebase Register Offset */
>   
>   /* Control/Status Register Masks  */
> -#define XWT_CSR0_WRS_MASK   0x00000008 /* Reset status */
> -#define XWT_CSR0_WDS_MASK   0x00000004 /* Timer state  */
> -#define XWT_CSR0_EWDT1_MASK 0x00000002 /* Enable bit 1 */
> +#define XWT_CSR0_WRS_MASK	BIT(3) /* Reset status */
> +#define XWT_CSR0_WDS_MASK	BIT(2) /* Timer state  */
> +#define XWT_CSR0_EWDT1_MASK	BIT(1) /* Enable bit 1 */
>   
>   /* Control/Status Register 0/1 bits  */
> -#define XWT_CSRX_EWDT2_MASK 0x00000001 /* Enable bit 2 */
> +#define XWT_CSRX_EWDT2_MASK	BIT(0) /* Enable bit 2 */
>   
>   /* SelfTest constants */
>   #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
> 
Using bitops also requires including linux/bits.h explicitly.

Guenter


