Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 123DE7AEF7
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 19:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbfG3RJD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 13:09:03 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36037 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729330AbfG3RJD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 13:09:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so30173169pfl.3;
        Tue, 30 Jul 2019 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DilQFfP56DdN5Kdq5OznAgfL1puUo/GsuVBjQKuj3/o=;
        b=bVBJslbcKBO0jyAhuYAR0WYm4kTsbpzqF5Mr+ZLHgbQ2wBjff7162J+yYre7h+vS/X
         lnf/+ri6eA7PdX/sTZIoigkJSt2PlhP3eVwNaZkD4J7cQxPMkZTTfdh3S1kayoreYlJ6
         dF6f6O966HFjB6ShGFbMd44IZRE3Q5MSrgZ00vWAUVceQi+QknvtzBMgogPJ3CRcATf5
         uJuYxsB2aJjOXrSmMKos9js37MToeFWdTCPiKe+ZYqTIWbmx8xaeKvMVlIlOpN/L0+kI
         yxj6JtDMVbxU80qAYuaTqOwaKQA5isJqu1STXW5lYauk/6Ham477G9m88D88F6xEbOL8
         zwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=DilQFfP56DdN5Kdq5OznAgfL1puUo/GsuVBjQKuj3/o=;
        b=dFgDNDHJPIXqwEhwZULxf+6wow3Cl0iXzJMaWCHy/df/KW8uuVIHbXF2y5+MJD9Wzk
         vGmFQaj9KikT9n4MbWQMj0RmOYiGJn3x4uxaqdLRDsh6iPGP1K5ZC6pPV1I31gSxY7Tv
         DOEc1yz51lg8q5mLgPc1SPopAPgz1oD2STYwEdAZmWL1nD6o5HzZGp3y9ZpbkA3+vRUa
         OWf7WzZeMy+V2ZiyjSqp4JhE4FEnZQV6thNmw6mbmBB/HQ/cQgTj4K/kSiVkbfYMCFMG
         nVE0Nip17/mkXQWrZOV+cIZVObmBJJaElRnpEpRvqvzkLHKD5O6C3d37cMFUX66HyAR8
         72EA==
X-Gm-Message-State: APjAAAVTfMCt5Hky0nkhkMEK3nyb6PE0WbiD/k3aLYtVi5fAnkd7s0pp
        dWGvhdm9d3omDaBxFp3q89D/RXdb
X-Google-Smtp-Source: APXvYqwSSWn0fcDuIRvJQkKj6u29ImFIedJydUp1B1Z/6qK6P2Rb6k9PNadGcQ/Yg4lho5d/nHAXzw==
X-Received: by 2002:aa7:98da:: with SMTP id e26mr42667064pfm.34.1564506542116;
        Tue, 30 Jul 2019 10:09:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v7sm25313099pff.87.2019.07.30.10.09.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 10:09:01 -0700 (PDT)
Date:   Tue, 30 Jul 2019 10:09:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] watchdog: riowd: Mark expected switch fall-through
Message-ID: <20190730170900.GA20743@roeck-us.net>
References: <20190730014650.GA31309@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190730014650.GA31309@embeddedor>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 08:46:50PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings (Building: sparc64):
> 
> drivers/watchdog/riowd.c: In function ‘riowd_ioctl’:
> drivers/watchdog/riowd.c:136:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    riowd_writereg(p, riowd_timeout, WDTO_INDEX);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/watchdog/riowd.c:139:2: note: here
>   case WDIOC_GETTIMEOUT:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/riowd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
> index 41a2a11535a6..b35f7be20c00 100644
> --- a/drivers/watchdog/riowd.c
> +++ b/drivers/watchdog/riowd.c
> @@ -134,7 +134,7 @@ static long riowd_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  			return -EINVAL;
>  		riowd_timeout = (new_margin + 59) / 60;
>  		riowd_writereg(p, riowd_timeout, WDTO_INDEX);
> -		/* Fall */
> +		/* Fall through */
>  
>  	case WDIOC_GETTIMEOUT:
>  		return put_user(riowd_timeout * 60, (int __user *)argp);
