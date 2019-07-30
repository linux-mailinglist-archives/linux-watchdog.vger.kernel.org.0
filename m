Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A1D7AEF0
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 19:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbfG3RIN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 13:08:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35971 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728647AbfG3RIN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 13:08:13 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so30171998pfl.3;
        Tue, 30 Jul 2019 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nnvZBnEEdZuLp4XlEeG764rYU22mYDAA8+9O3TP4fyY=;
        b=JgerthkRz1vAlzzQycx9Yqri53uzEMIO9AzXm3UeSE3VNjX+4hCtqgLF+2JZh3MGOn
         U7qjCCT8HA7RWoYyMKcMJQdYc4X+ORGNJgK5HQaIRxHvLpXH509q3AWM3dZC/wEZ1xkJ
         tLY27naCHkt7Kf6XoYDL10tYlx2JU5vGiRd/vNHl0t6TQmty0Hgq8W8C5W61KzGoETVH
         gEkY0B0eDDAFl2A9xK/DycMUwnQP9o7h9/nbxHDKuym5gwYYF1RWq/iVZT4ogb1+55Sa
         0XmgfwNhDePlrjKRfNDMpHc/2Z4dMv+dMvsAnwT5u5q/MNq4h8SoTxITc6IE+PmjXHEN
         5g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=nnvZBnEEdZuLp4XlEeG764rYU22mYDAA8+9O3TP4fyY=;
        b=BG5WShxKKpjfQBuBGKpnA10WO4ob811pWVSpQgiEY1rdSkkdBRB8dX9m8VMPEE1Pk1
         tKfXLPpBV3X+dxfXUwWJbqIOCtvfzKYJi2M8gcwP3nwnpoVbnvg5qc4rxFxSoRXAknzN
         YCMBvYRfrmkPKuONSFE1NKJTj4jAbuZSD5tBPtUXNlNglDhqutpmg2hpkdIlqjjvaBgn
         qVYTRYmmfGGYf6FUuZ9UyGmpv90c0myMtNe9NUSvzu5H61dcsqPGAUKCZYJPlqJw14Di
         7mQd4Ubgs9XByi+Nf3mq387DOhenDTeJC0EqiHpS/HrjCmB/ETfEMtgyt0gi2c+9XJE1
         Ai/g==
X-Gm-Message-State: APjAAAVWpwruuE91U8ofkeFqPNvlcy+nny5YmQWrXwOtlOSswryyUhCE
        WahOoXiN3jnH/mlNTydbfbU=
X-Google-Smtp-Source: APXvYqzGPYxStVf6hwBkFBp+5QiileRkDsIvuod93h13BkdRX8kRcoQm4LQFWfjVnSvfq1iOY9Db2w==
X-Received: by 2002:a17:90a:a404:: with SMTP id y4mr122045239pjp.58.1564506492564;
        Tue, 30 Jul 2019 10:08:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r6sm147906900pjb.22.2019.07.30.10.08.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 10:08:12 -0700 (PDT)
Date:   Tue, 30 Jul 2019 10:08:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Jim Cromie <jim.cromie@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] watchdog: scx200_wdt: Mark expected switch fall-through
Message-ID: <20190730170811.GA20680@roeck-us.net>
References: <20190729200602.GA6854@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729200602.GA6854@embeddedor>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 03:06:02PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: i386):
> 
> drivers/watchdog/scx200_wdt.c: In function ‘scx200_wdt_ioctl’:
> drivers/watchdog/scx200_wdt.c:188:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    scx200_wdt_ping();
>    ^~~~~~~~~~~~~~~~~
> drivers/watchdog/scx200_wdt.c:189:2: note: here
>   case WDIOC_GETTIMEOUT:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/scx200_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/scx200_wdt.c b/drivers/watchdog/scx200_wdt.c
> index efd7996694de..46268309ee9b 100644
> --- a/drivers/watchdog/scx200_wdt.c
> +++ b/drivers/watchdog/scx200_wdt.c
> @@ -186,6 +186,7 @@ static long scx200_wdt_ioctl(struct file *file, unsigned int cmd,
>  		margin = new_margin;
>  		scx200_wdt_update_margin();
>  		scx200_wdt_ping();
> +		/* Fall through */
>  	case WDIOC_GETTIMEOUT:
>  		if (put_user(margin, p))
>  			return -EFAULT;
