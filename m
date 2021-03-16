Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FD033CB5C
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Mar 2021 03:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCPCXw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 22:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhCPCXY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 22:23:24 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD29C06174A;
        Mon, 15 Mar 2021 19:23:24 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so6117808ote.6;
        Mon, 15 Mar 2021 19:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oG4lAeO7tyf3QKY1d+wD/lnHF3SopRsWHfyiyrtig8Y=;
        b=P4PwVOmNPAiI8JHJQGjD2MzP6XXBBPIqgKoUn/J2GlWxwoTpxA+f5fo+TRGzbM4UAQ
         E/tEXzAudakjBUq1gg7YhfYaeMBB6OrAd2bln/rHC7KkoeWIRtyjbKhUDpCNsJvr5+mE
         xN4QAPtpRWuLeoRbvC8NRf6YW0DQT1PYYxR2NwjJZymPKxHUHC9m950LkfKZQ+ufjI+5
         xmaZIXwxFLfgMY+QyqIZVBlh3+BnG/TdBqKSBZZmzZ1SGC6LR9iF0lcdRyS2o7bPUVNR
         R63lpRO8vNKzAIgb5/SIWrH4XlDG6k34ILYXhZPc0PPlvtmTANF6WU+T9VXBT2Hwp44+
         88Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oG4lAeO7tyf3QKY1d+wD/lnHF3SopRsWHfyiyrtig8Y=;
        b=RzC3FHNPFr9/IsKuAMMOqpMonHmv5kGf5hKW/vQxNXv0qQhzJ1TpBwNfGOeHGA2dU0
         uaoPNcbsB8b+A3wKPeWo64gamV5NIe2dQBl+XgAkiAyAMuwIQi3oBDaFO9eT/JVFVjbf
         aQLXe8jU20ROzGtF5zqaJs4yNGoapsEuqdW8HhN0kCDhA7gOfVLF8eZ7HcufpTb02WL3
         rN9bSCbFEmh9DS8PhydLFNqt9O9qnfwoWna2idt1UOBvOJOzKTJrXC40ZmM9NlKqn4Q4
         Aolguu47/8BseS1IwYVlsTF8bnZ+tS4K34GQTLQ2iXjwhpkyp5pPLbF1Dn8nHq62PgWO
         T5oA==
X-Gm-Message-State: AOAM532zun1rKJXs70GX+gEmM4IjWx/8wljPWfvd2XsNQG3sp2nKehL4
        whk0uasgFbCf4DNg/uQDFso=
X-Google-Smtp-Source: ABdhPJxS6urIkq/glfi+8CgT0lrgTQyXKTcBCF8OI+30JFZ1vkT2BzIVDJehDHkLlE1hko3vvMNLcw==
X-Received: by 2002:a05:6830:1515:: with SMTP id k21mr1543506otp.269.1615861403932;
        Mon, 15 Mar 2021 19:23:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm2899819ooo.34.2021.03.15.19.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 19:23:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/9] watchdog: of_xilinx_wdt: Used BIT macro
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, Srinivas Goud <srinivas.goud@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
 <1615805214-24857-3-git-send-email-srinivas.neeli@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <911ea811-9b9d-f2e1-bd0b-74432e652c04@roeck-us.net>
Date:   Mon, 15 Mar 2021 19:23:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615805214-24857-3-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/15/21 3:46 AM, Srinivas Neeli wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> Used BIT macro instead of mask value.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/watchdog/of_xilinx_wdt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 00549164b3d7..0d7df2370db7 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -24,12 +24,12 @@
>  #define XWT_TBR_OFFSET      0x8 /* Timebase Register Offset */
>  
>  /* Control/Status Register Masks  */
> -#define XWT_CSR0_WRS_MASK   0x00000008 /* Reset status */
> -#define XWT_CSR0_WDS_MASK   0x00000004 /* Timer state  */
> -#define XWT_CSR0_EWDT1_MASK 0x00000002 /* Enable bit 1 */
> +#define XWT_CSR0_WRS_MASK	BIT(3) /* Reset status */
> +#define XWT_CSR0_WDS_MASK	BIT(2) /* Timer state  */
> +#define XWT_CSR0_EWDT1_MASK	BIT(1) /* Enable bit 1 */
>  
>  /* Control/Status Register 0/1 bits  */
> -#define XWT_CSRX_EWDT2_MASK 0x00000001 /* Enable bit 2 */
> +#define XWT_CSRX_EWDT2_MASK	BIT(0) /* Enable bit 2 */
>  

Requires #include <linux/bits.h>

>  /* SelfTest constants */
>  #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
> 

