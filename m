Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6A7F37F6F
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 23:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfFFVUK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jun 2019 17:20:10 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44065 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfFFVUK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jun 2019 17:20:10 -0400
Received: by mail-pl1-f195.google.com with SMTP id c5so1409151pll.11;
        Thu, 06 Jun 2019 14:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9QlvjOpv9aY/6/qhy+I2l/VtQWPhEL6g5W3ycbCxLbg=;
        b=hY6sMbtrklI4anmLJhxciTGb2+eS++SqFH6S0wSGbgern4B1mvJ5746/wa7cZbT3cb
         W3KGTNf3lSM50lI1s/Nv391LIm6szBaZu1B/1tSG6FOwOh7HAtEzpqx39thRar2YEUSP
         jpTXo7+x4WABtK4VDOWHZZJajkk2Z0RkwswfL+1XdqAxDQUrwXSdIJprUv8+V6r3kue0
         uO1vO9Fe/aLW8R/1qY8yUWWPhOl0FWL7453geI2qova/pcI2wIKdI44QgSuw6AympdsA
         CZQGfs/RfejjsOwhjCS05F4IqQusi7Gjz+mclpnQDdzlFZlSfRVI/lI+QeIj83hbr4Ss
         F/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9QlvjOpv9aY/6/qhy+I2l/VtQWPhEL6g5W3ycbCxLbg=;
        b=PruF4Z267V4XZG3Yax0FH2lhx6/8NMX24CsSX2bqkqjJU+Lz4Mx5iYm9NF95x0jm+7
         QRmr5TRPkHrpiCnfFlwBw/m+ucq1i3RbGVsjfXTDqpuq4MYJyKuK/ppR5YwZQZKZM/iN
         How/F/s3FarB0yo62DDNUZYbLMnvgO7HZu6RyGBI7Z7BlNbqi052qz664qKcRUmAk6to
         aFspscuLBoCMv8cK6YsRwgVumJZ1bKM7V8inhFRHn/gG3qAULsyfnFJvH9KyoY8qLsnY
         vxti6koSbEa4bubdZcpOa2i7okhE/aBrAZeBAFxLyyGaMQt1whXO/y1LTUmp7+CCUQN4
         DIrA==
X-Gm-Message-State: APjAAAU1+4emdpF6SkovrDOdXcpV3ReoZ+/JNaWN0JI33MhwkAFoftEe
        +voLaae4oaEYp1Ig+9cy7nA=
X-Google-Smtp-Source: APXvYqyn05gUfB1oAEN5JJchgHPbDRjH4TkYRE/NkEZIhq8mgnAtpGvtu8tUt+0JmGgC8bAdl6r5LQ==
X-Received: by 2002:a17:902:b088:: with SMTP id p8mr9894353plr.335.1559856009469;
        Thu, 06 Jun 2019 14:20:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j37sm90658pgj.58.2019.06.06.14.20.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 14:20:08 -0700 (PDT)
Date:   Thu, 6 Jun 2019 14:20:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk
Subject: Re: [PATCH 6/6] watchdog/hpwdt: Reflect changes
Message-ID: <20190606212008.GE1299@roeck-us.net>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
 <1558126783-4877-7-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558126783-4877-7-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 17, 2019 at 02:59:43PM -0600, Jerry Hoemann wrote:
> Bump driver number to reflect recent changes.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index dc65006..9e02f88 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -26,7 +26,7 @@
>  #include <linux/watchdog.h>
>  #include <asm/nmi.h>
>  
> -#define HPWDT_VERSION			"2.0.2"
> +#define HPWDT_VERSION			"2.0.3"
>  #define SECS_TO_TICKS(secs)		((secs) * 1000 / 128)
>  #define TICKS_TO_SECS(ticks)		((ticks) * 128 / 1000)
>  #define HPWDT_MAX_TICKS			65535
